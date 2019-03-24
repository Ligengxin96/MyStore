package com.bookstore.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.bookstore.domain.Book;
import com.bookstore.domain.PageBean;

public interface BookService{

	/**
	 * 查询所有Book对象
	 * @param criteria
	 * @return 装有所有Book对象的list
	 */
	public List<Book> findAllBooks(DetachedCriteria criteria) ;

	/**
	 * 根据id查询书本
	 * @param bookId
	 * @return 一个book对象
	 */
	public Book findBookByID(String bookId);

	/**
	 * 分页查询所有图书
	 * @param criteria 查询条件
	 * @param currPage 当前页数
	 * @param pageSize 每页数量
	 * @return 一个PageBean对象(装有需要分页对象的集合)
	 */
	public PageBean<Book> findByPage(DetachedCriteria criteria, Integer currPage, Integer pageSize);

	/**
	 * 查询所有书本数量
	 * @param criteria
	 * @return 书本数量
	 */
	public int findBookCount(DetachedCriteria criteria);

	
}