package com.bookstoreBackstage.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.bookstoreBackstage.domain.Book;
import com.bookstoreBackstage.domain.PageBean;

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

	/**
	 * 保存图书
	 */
	public void saveBook(Book book);

	/**
	 * 删除图书
	 * @param book 需要删除的book对象
	 */
	public void deleteBook(Book book);

	/**
	 * 修改图书信息
	 * @param book 需要修改的book对象
	 */
	public void updateBook(Book book);

	
}