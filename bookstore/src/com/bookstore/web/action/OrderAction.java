package com.bookstore.web.action;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.bookstore.domain.Book;
import com.bookstore.domain.Order;
import com.bookstore.domain.OrderItem;
import com.bookstore.domain.ShoppingCart;
import com.bookstore.domain.User;
import com.bookstore.service.BookService;
import com.bookstore.service.OrderItemService;
import com.bookstore.service.OrderService;
import com.bookstore.service.ShoppingCartService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;

public class OrderAction extends ActionSupport implements ModelDriven<Order>{

	private static final long serialVersionUID = 1L;
	
	//模型驱动获取order
	private Order order = new Order();
	@Override
	public Order getModel() {
		return order;
	}
	
	//属性注入orderService
	@Resource(name="orderService")
	private OrderService orderService;
	//属性注入orderItemService
	@Resource(name="orderItemService")
	private OrderItemService orderItemService;
	//属性注入shoppingCartService
	@Resource(name="shoppingCartService")
	private ShoppingCartService shoppingCartService;
	//属性注入bookService
	@Resource(name="bookService")
	private BookService bookService;
	
	//购物车结算的所以书籍的id和数量(不知道怎么传map就都放在数组里)
	//数组内容为 书籍id,数量,书籍id,数量.............
	private ArrayList<String> bookIDs;
	public void setBookIDs(ArrayList<String> bookIDs) {
		this.bookIDs = bookIDs;
	}
	//离线条件查询
	private DetachedCriteria criteria = DetachedCriteria.forClass(Order.class);
	
	//跳转到我的订单页面
	public String myOrderUI() {
		return "myOrderUI";
	}
	
	/**
	 * 生成订单
	 * @return
	 * @throws IOException 
	 */
	public void produceOrder() throws IOException {
		User user = (User) ActionContext.getContext().getSession().get("user");
		
		order.setOrderTime(new Date());
		order.setAddress(user.getUserAddress());
		order.setuserID(user.getUserId());
		order.setOrderId(UUID.randomUUID().toString());
		//生成订单
		orderService.produceOrder(order);
		//保存订单详情
		orderDetail(order.getOrderId());
		//删除购物车数据
		batchDeleteItem();
		
		//String->list->json
		List<String> list = new ArrayList<>();
		list.add(order.getOrderId());
		//把orderId返回到前端,下个页面使用
		JSONArray jsonArray = JSONArray.fromObject(list);
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println(jsonArray.toString());
	}
	
	/**
	 * 生成订单详情
	 * @return
	 */
	public void orderDetail(String orderID) {
		
		for(int i = 0;i < bookIDs.size();i+=2) {
			OrderItem orderItem = new OrderItem();
			Book book = bookService.findBookByID(bookIDs.get(i));
			
			orderItem.setorderID(orderID);//是那个订单的那条详情
			orderItem.setBookId(book.getBookId());//订单详情的书籍id
			orderItem.setImage(book.getSmallImage());//订单详情的书籍的图片
			orderItem.setBookName(book.getBookName());//订单详情的书名
			orderItem.setQuantity(Long.valueOf(bookIDs.get(i+1)));//那本书的数量
			
			DecimalFormat df = new DecimalFormat("0.0");
			String price = df.format(book.getDiscount()*book.getPrice()/10.0);
			orderItem.setCurrentPrice(Double.valueOf(price));
			String totalPrice = df.format(orderItem.getCurrentPrice()*orderItem.getQuantity());
			orderItem.setSubtotal(Double.valueOf(totalPrice));
			
			orderItemService.saveOrderDetail(orderItem);
		}
		
	}
	
	/**
	 * 批量删除购物车项目
	 * @return
	 */
	public void batchDeleteItem() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		//逐一遍历选择的书籍id,一个个删除
		for(int i = 0;i < bookIDs.size();i+=2) {
			//置空查询条件
			criteria = DetachedCriteria.forClass(ShoppingCart.class);
			//添加新的条件
			criteria.add(Restrictions.eq("userID", user.getUserId()));
			criteria.add(Restrictions.eq("bookID", bookIDs.get(i)));
			List<ShoppingCart> shoppingCartList = shoppingCartService.findShoppingCartItem(criteria);
			shoppingCartService.deleteItem(shoppingCartList.get(0));
		}	
	}
	
}
