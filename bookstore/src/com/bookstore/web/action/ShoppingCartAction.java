package com.bookstore.web.action;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.bookstore.domain.Book;
import com.bookstore.domain.ShoppingCart;
import com.bookstore.domain.User;
import com.bookstore.service.BookService;
import com.bookstore.service.ShoppingCartService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;

public class ShoppingCartAction extends ActionSupport implements ModelDriven<ShoppingCart>{
	private static final long serialVersionUID = 1L;
	
	//模型驱动获取shoppingCart对象
	private static ShoppingCart shoppingCart = new ShoppingCart();
	@Override
	public ShoppingCart getModel() {
		return shoppingCart;
	}

	//获取购买的书籍信息和加入购物车的书籍数量
	private String bookId;
	private Long bookCount;
	private ArrayList<String> bookIDs;
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public void setBookCount(Long bookCount) {
		this.bookCount = bookCount;
	}
	public void setBookIDs(ArrayList<String> bookIDs) {
		this.bookIDs = bookIDs;
	}

	//属性注入shoppingCartService
	@Resource(name="shoppingCartService")
	private ShoppingCartService shoppingCartService;
	//属性注入bookService
	@Resource(name="bookService")
	private BookService bookService;
	
	//离线查询对象
	private DetachedCriteria criteria = DetachedCriteria.forClass(ShoppingCart.class);
	private DetachedCriteria bookCriteria = DetachedCriteria.forClass(Book.class);

	//跳转到空白页面
	public String emptyUI() {
		return "emptyUI";
	}
	
	//跳转到购物车页面
	public String shoppingCartUI() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		if(user == null) {
			return LOGIN;
		}else {
			return "shoppingCartUI";
		}
	}
	
	/**
	 * 添加商品到购物车
	 * @return 购物车页面
	 */
	public String addBookToCart() {
		//用户没登陆就不允许使用购物车,跳转到登陆页面
		User user = (User) ActionContext.getContext().getSession().get("user");
		if(user == null) {
			return LOGIN;
		}
		//查找需要添加的书籍信息
		bookCriteria.add(Restrictions.eq("bookId", bookId));
		List<Book> books = bookService.findAllBooks(bookCriteria);
		//查询条件
		criteria.add(Restrictions.eq("bookID", books.get(0).getBookId()));
		criteria.add(Restrictions.eq("userID", user.getUserId()));
		//判断是否存在相同的书本(相同就只添加数量)
		List<ShoppingCart> findShoppingCartItem = shoppingCartService.findShoppingCartItem(criteria);
		
		if(findShoppingCartItem.size() != 0) {
			findShoppingCartItem.get(0).setQuantity(findShoppingCartItem.get(0).getQuantity()+bookCount);
			findShoppingCartItem.get(0).setBookName(books.get(0).getBookName());
			
			shoppingCartService.updateCount(findShoppingCartItem.get(0));
		}else {
			shoppingCart.setBookID(books.get(0).getBookId());
			shoppingCart.setUserID(user.getUserId());
			shoppingCart.setQuantity(bookCount);
			shoppingCart.setBookName(books.get(0).getBookName());
			shoppingCart.setBookImage(books.get(0).getSmallImage());
			
			DecimalFormat df = new DecimalFormat("0.0");
			String price = df.format(books.get(0).getDiscount()*books.get(0).getPrice()/10.0);
			shoppingCart.setCurrentPrice(Double.valueOf(price));
			
			shoppingCartService.save(shoppingCart);
		}
		
		return "shoppingCartUI";
	}
	
	/**
	 * 显示用户的购物车的物品
	 * @return
	 * @throws IOException 
	 */
	public String showItem() throws IOException {
		//查找登陆的用户的购物车的所有商品
		User user = (User) ActionContext.getContext().getSession().get("user");
		criteria.add(Restrictions.eq("userID", user.getUserId()));
		List<ShoppingCart> shoppingCartList = shoppingCartService.findShoppingCartItem(criteria);
		
		//回显到页面
		JSONArray jsonArray = JSONArray.fromObject(shoppingCartList);
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println(jsonArray.toString());
		
		return NONE;
	}
	
	/**
	 * 删除购物车项目
	 * @return
	 */
	public String deleteItem() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		criteria.add(Restrictions.eq("userID", user.getUserId()));
		criteria.add(Restrictions.eq("bookID", bookId));
		//先查询在删除
		List<ShoppingCart> shoppingCartList = shoppingCartService.findShoppingCartItem(criteria);
		
		shoppingCartService.deleteItem(shoppingCartList.get(0));
		
		return "shoppingCartUI";
	}
	
	/**
	 * 批量删除购物车项目
	 * @return
	 */
	public String batchDeleteItem() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		//逐一遍历选择的书籍id,一个个删除
		for(int i = 0;i < bookIDs.size();i++) {
			criteria = DetachedCriteria.forClass(ShoppingCart.class);
			//添加新的条件
			criteria.add(Restrictions.eq("userID", user.getUserId()));
			criteria.add(Restrictions.eq("bookID", bookIDs.get(i)));
			List<ShoppingCart> shoppingCartList = shoppingCartService.findShoppingCartItem(criteria);
			shoppingCartService.deleteItem(shoppingCartList.get(0));
		}	
		return "shoppingCartUI";
	}
	
	/**
	 * 修改购物车数量
	 * @return
	 */
	public String updateCount() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		criteria.add(Restrictions.eq("userID", user.getUserId()));
		criteria.add(Restrictions.eq("bookID", bookId));
		List<ShoppingCart> shoppingCartList = shoppingCartService.findShoppingCartItem(criteria);
		
		shoppingCartList.get(0).setQuantity(bookCount);
		shoppingCartService.save(shoppingCartList.get(0));
		
		return "shoppingCartUI";
	}
}
