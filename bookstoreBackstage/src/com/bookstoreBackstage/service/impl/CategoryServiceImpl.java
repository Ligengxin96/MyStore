package com.bookstoreBackstage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.bookstoreBackstage.dao.CategoryDao;
import com.bookstoreBackstage.domain.Category;
import com.bookstoreBackstage.service.CategoryService;

@Transactional
public class CategoryServiceImpl implements CategoryService{

	@Resource(name="categoryDao")
	private CategoryDao categoryDao; 
	
	@Override
	public List<Category> findCategory(DetachedCriteria criteria) {
		return categoryDao.findAll(criteria);
	}

}
