package com.bookstoreBackstage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.bookstoreBackstage.dao.BookDao;
import com.bookstoreBackstage.domain.Book;
import com.bookstoreBackstage.domain.PageBean;
import com.bookstoreBackstage.service.BookService;

@Transactional
public class BookServiceImpl implements BookService{

	//属性注入bookDao
	@Resource(name="bookDao")
	private BookDao bookDao;

	@Override
	public List<Book> findAllBooks(DetachedCriteria criteria) {
		return bookDao.findAll(criteria);
	}

	@Override
	public Book findBookByID(String bookId) {
		return bookDao.findById(bookId);
	}

	@Override
	public PageBean<Book> findByPage(DetachedCriteria criteria, Integer currPage, Integer pageSize) {
		PageBean<Book> pageBean = new PageBean<Book>();
		// 封装当前页数:
		pageBean.setCurrPage(currPage);
		// 封装每页显示记录数:
		pageBean.setPageSize(pageSize);
		// 封装总记录数:
		// 调用DAO:
		Integer totalCount  = bookDao.findCount(criteria);
		pageBean.setTotalCount(totalCount);
		
		// 封装总页数:
		Double tc = totalCount.doubleValue();
		Double num = Math.ceil(tc/pageSize);
		pageBean.setTotalPage(num.intValue());
		
		// 封装每页显示数据的集合
		Integer begin = (currPage - 1) * pageSize;
		List<Book> list = bookDao.findByPage(criteria,begin,pageSize);
		pageBean.setList(list);
		
		return pageBean;
	}

	@Override
	public int findBookCount(DetachedCriteria criteria) {
		return bookDao.findCount(criteria); 
	}
} 
