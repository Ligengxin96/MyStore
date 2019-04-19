package com.bookstore.web.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.bookstore.domain.Order;
import com.bookstore.domain.OrderItem;
import com.bookstore.service.OrderItemService;
import com.bookstore.service.OrderService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;

public class OrderItemAction extends ActionSupport implements ModelDriven<OrderItem>{

	private static final long serialVersionUID = 1L;
	
	//模型驱动获取orderItem
	private OrderItem orderItem = new OrderItem();
	@Override
	public OrderItem getModel() {
		return orderItem;
	}
	
	//属性注入orderItemService
	@Resource(name="orderItemService")
	private OrderItemService orderItemService;
	//属性注入orderService
	@Resource(name="orderService")
	private OrderService orderService;
	
	//离线条件查询
	private DetachedCriteria criteria = DetachedCriteria.forClass(OrderItem.class);
	
	//订单id
	private String orderId; 
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	//付款成功跳转到个人中心
	public String userInformationUI() {
		return SUCCESS;
	}

	/**
	 * 查询该订单的详情
	 * @param orderID 订单id
	 * @return NONE
	 * @throws IOException
	 */
	public String showOrderItem() throws IOException {
		
		criteria.add(Restrictions.eq("orderID", orderId));
		List<OrderItem> OrderDetailList = orderItemService.findOrderDetail(criteria);
		
		JSONArray jsonArray = JSONArray.fromObject(OrderDetailList);
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println(jsonArray.toString());
		
		return NONE;
	}
	
	/**
	 * 计算订单总金额
	 * @throws IOException
	 */
	public void countTotal() throws IOException {
		
		criteria.add(Restrictions.eq("orderID", orderId));
		List<OrderItem> OrderDetailList = orderItemService.findOrderDetail(criteria);
		double total = 0;
		for (OrderItem orderItem : OrderDetailList) {
			total = total+ orderItem.getSubtotal();
		}
		
		//String->list->json
		List<String> list = new ArrayList<>();
		list.add(String.valueOf(total));
		//把订单总计金额返回到前端
		JSONArray jsonArray = JSONArray.fromObject(list);
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println(jsonArray.toString());
	}
	
	/**
	 * 付款成功修改订单状态
	 * @return
	 */
	public void updateOrderStatus(){
		
		Order order = orderService.findOrderById(orderId);
		order.setOrderStatus("2");
		orderService.updateOrderStatus(order);
	}

}
