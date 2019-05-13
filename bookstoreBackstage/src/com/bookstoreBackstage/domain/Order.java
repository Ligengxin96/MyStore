package com.bookstoreBackstage.domain;

import java.util.Date;

/**
 * 订单表
 * @author Mr.Li
 *
 */
public class Order {

	private String orderId;
	private Date orderTime;
	private String orderStatus;
	private String address;
	private String userID;
	private Double total;
	
	private OrderItem orderItem;
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getuserID() {
		return userID;
	}
	public void setuserID(String userID) {
		this.userID = userID;
	}
	public OrderItem getOrderItem() {
		return orderItem;
	}
	public void setOrderItem(OrderItem orderItem) {
		this.orderItem = orderItem;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	
}
