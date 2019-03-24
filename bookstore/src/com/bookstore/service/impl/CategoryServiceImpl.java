package com.bookstore.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.bookstore.dao.CategoryDao;
import com.bookstore.domain.Category;
import com.bookstore.service.CategoryService;

@Transactional
public class CategoryServiceImpl implements CategoryService{

	@Resource(name="categoryDao")
	private CategoryDao categoryDao; 
	
	@Override
	public List<Category> findCategory(DetachedCriteria criteria) {
		return categoryDao.findAll(criteria);
	}

}
