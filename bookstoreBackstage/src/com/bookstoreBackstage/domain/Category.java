package com.bookstoreBackstage.domain;

import java.util.HashSet;
import java.util.Set;

//图书分类的实体类
public class Category {
	
	private Long categoryId;
	private String categoryName;
	private Long pid;
	
	Set<Book> books =new HashSet<Book>();
	
	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Long getPid() {
		return pid;
	}

	public void setPid(Long pid) {
		this.pid = pid;
	}

	public Set<Book> getBooks() {
		return books;
	}

	public void setBooks(Set<Book> books) {
		this.books = books;
	}

}
