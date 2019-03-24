package com.learnjava.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.learnjava.dao.BaseDictDao;
import com.learnjava.domain.BaseDict;
import com.learnjava.service.BaseDictService;

@Transactional
public class BaseDictServiceImpl implements BaseDictService{

	@Resource(name="baseDictDao")
	private BaseDictDao baseDictDao;

	@Override
	public List<BaseDict> findByTypeCode(DetachedCriteria criteria,BaseDict baseDict) {
		return baseDictDao.findAll(criteria);
	}
	
}
 