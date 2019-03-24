package com.learnjava.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.learnjava.domain.BaseDict;

public interface BaseDictDao extends BaseDao<BaseDict>{

	/**
	 * 查找数据字典
	 * @param criteria 查询条件
	 * @return 查找到的所以的BaseDict对象
	 */
	public List<BaseDict> findAll(DetachedCriteria criteria);

}
