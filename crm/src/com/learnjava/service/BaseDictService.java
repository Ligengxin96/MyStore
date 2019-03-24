package com.learnjava.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.learnjava.domain.BaseDict;

public interface BaseDictService {

	/**
	 * 查找数据字典
	 * @param criteria 查询条件
	 * @param baseDict 字典对象
	 * @return 查找到的所以的BaseDict对象
	 */
	public List<BaseDict> findByTypeCode(DetachedCriteria criteria, BaseDict baseDict);

}
