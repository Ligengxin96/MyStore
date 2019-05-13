package com.bookstoreBackstage.web.action;

import java.util.Date;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.bookstoreBackstage.domain.Order;
import com.bookstoreBackstage.domain.PageBean;
import com.bookstoreBackstage.service.OrderService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


public class OrderAction extends ActionSupport implements ModelDriven<Order>{
	private static final long serialVersionUID = 1L;
	
	//模型驱动获取order对象
	private Order order = new Order();
	@Override
	public Order getModel() {
		return order;
	}
	
	//属性注入orderService
	@Resource(name="orderService")
	private OrderService orderService;
	
	//set和get endTime(截至时间)
	private Date endTime;
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	// 离线查询对象
	private DetachedCriteria criteria = DetachedCriteria.forClass(Order.class);
	
	/**
	 * 使用set方法接收当前页(currPage)和每页显示记录数(pageSize)
	 */
	private Integer currPage = 1;
	private Integer pageSize = 10;
	public void setCurrPage(Integer currPage) {
		if (currPage == null) {
			currPage = 1;
		}
		this.currPage = currPage;
	}
	public void setPageSize(Integer pageSize) {
		if (pageSize == null) {
			pageSize = 10;
		}
		this.pageSize = pageSize;
	}
				
	public String findAllOrders() {
		//添加查询条件
		if(order.getOrderTime() != null && !"".equals(order.getOrderTime())) {
			criteria.add(Restrictions.ge("orderTime", order.getOrderTime()));
		}
		if(endTime != null && !"".equals(endTime)) {
			criteria.add(Restrictions.le("orderTime", endTime));
		}
		if(order.getOrderStatus() != null && !"".equals(order.getOrderStatus())) {
			criteria.add(Restrictions.eq("orderStatus", order.getOrderStatus()));
		}
		
		PageBean<Order> orderList = orderService.findAllOrders(criteria, currPage, pageSize);
		ActionContext.getContext().getValueStack().push(orderList);
		
		return SUCCESS;
	}

	/**
	 * 待发货订单修改为已发货
	 * @return
	 */
	public String updateOrder() {
		order = orderService.findOrderById(order.getOrderId());
		order.setOrderStatus("3");
		orderService.updateOrder(order);
		
		return "updateSuccess";
	}
}
