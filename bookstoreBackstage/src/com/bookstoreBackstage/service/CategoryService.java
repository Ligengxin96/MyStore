package com.bookstoreBackstage.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.bookstoreBackstage.domain.Category;

public interface CategoryService {

	/**
	 * 查询所有用户
	 * @param criteria 查询条件
	 * @return 装有所有Category对象的集合
	 */
	public List<Category> findCategory(DetachedCriteria criteria);
}
