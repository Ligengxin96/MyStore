package com.bookstore.domain;

public class OrderItem {

	private String orderItemId;
	private Long  quantity;
	private Long subtotal;
	private String bookId;
	private String bookName;
	private Long currentPrice;
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
	public Long getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(Long subtotal) {
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
	public Long getCurrentPrice() {
		return currentPrice;
	}
	public void setCurrentPrice(Long currentPrice) {
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
