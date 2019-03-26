package com.bookstore.web.action;

import javax.annotation.Resource;

import com.bookstore.domain.ShoppingCart;
import com.bookstore.domain.User;
import com.bookstore.service.BookService;
import com.bookstore.service.ShoppingCartService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

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
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public void setBookCount(Long bookCount) {
		this.bookCount = bookCount;
	}

	//属性注入shoppingCartService
	@Resource(name="shoppingCartService")
	private ShoppingCartService shoppingCartService;
	//属性注入bookService
	@Resource(name="bookService")
	private BookService bookService;
	
	//跳转到购物车页面
	public String shoppingCartUI() {
		return "shoppingCartUI";
	}
	
	public String addBooktoCart() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		if(user == null) {
			return LOGIN;
		}
		System.out.println("userid="+user.getUserId());
		System.out.println("bookid="+bookId);
		System.out.println("bookCount="+bookCount);
		
		shoppingCart.setUserID(user.getUserId());
		shoppingCart.setBookID(bookId);
		shoppingCart.setQuantity(bookCount);
		shoppingCartService.save(shoppingCart);
		
		return "shoppingCartUI";
	}
	
}
