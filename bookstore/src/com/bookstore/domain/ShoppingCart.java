package com.bookstore.domain;

import java.io.Serializable;

public class ShoppingCart implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Long quantity;
	private String bookID;
	private String userID;
	
	/*private User user;
	private Book book;*/
	
	//购物车关联书籍

	public Long getQuantity() {
		return quantity;
	}

	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}

	public String getBookID() {
		return bookID;
	}

	public void setBookID(String bookID) {
		this.bookID = bookID;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	/*public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
*/
	
	
}
