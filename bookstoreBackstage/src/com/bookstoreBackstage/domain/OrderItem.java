package com.bookstoreBackstage.domain;

/**
 * 订单详情表
 * @author Mr.Li
 *
 */
public class OrderItem {

	private String orderItemId;
	private Long  quantity;
	private Double subtotal;
	private String bookId;
	private String bookName;
	private Double currentPrice;
	private String image;
	private String orderID;
	
	public String getOrderItemId() {
		return orderItemId;
	}
	public void setOrderItemId(String orderItemId) {
		this.orderItemId = orderItemId;
	}
	public Long getQuantity() {
		return quantity;
	}
	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}
	public Double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public Double getCurrentPrice() {
		return currentPrice;
	}
	public void setCurrentPrice(Double currentPrice) {
		this.currentPrice = currentPrice;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getorderID() {
		return orderID;
	}
	public void setorderID(String orderID) {
		this.orderID = orderID;
	}
	
	
}
