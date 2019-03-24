package com.learnjava.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.learnjava.dao.SaleVisitDao;
import com.learnjava.domain.PageBean;
import com.learnjava.domain.SaleVisit;
import com.learnjava.service.SaleVisitService;

@Transactional
public class SaleVisitServiceImpl implements SaleVisitService{

	//注入SaleVisitDao
	@Resource(name="saleVisitDao")
	private SaleVisitDao saleVisitDao;

	@Override
	public PageBean<SaleVisit> findAllSaleVisit(DetachedCriteria criteria, Integer currPage, Integer pageSize) {
		PageBean<SaleVisit> pageBean = new PageBean<SaleVisit>();
		//封装当前页数
		pageBean.setCurrPage(currPage);
		//封装每页显示记录数
		pageBean.setPageSize(pageSize);
		//封装总记录数:
		//调用DAO:
		Integer totalCount = saleVisitDao.findCount(criteria);
		pageBean.setTotalCount(totalCount);
		
		//封装总页数
		Double tc = totalCount.doubleValue();
		Double num = Math.ceil(tc/pageSize);
		pageBean.setTotalPage(num.intValue());
		
		//封装每页显示数据的集合
		Integer begin = (currPage - 1) * pageSize;
		List<SaleVisit> list = saleVisitDao.findByPage(criteria, begin, pageSize);
		pageBean.setList(list);
		
		return pageBean;
	}

	@Override
	public void saveSaleVisit(SaleVisit saleVisit) {
		saleVisitDao.save(saleVisit);
	}
	
}
