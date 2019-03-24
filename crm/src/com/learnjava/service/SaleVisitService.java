package com.learnjava.service;

import org.hibernate.criterion.DetachedCriteria;

import com.learnjava.domain.PageBean;
import com.learnjava.domain.SaleVisit;

public interface SaleVisitService{

	/**
	 * 分页查询拜访记录
	 * @param criterida 查询条件
	 * @param currPage 当前页数
	 * @param pageSize 每页显示个数
	 * @return 一个装有pageBean对象(里面装有SaleVisit对象)的list集合
	 */
	PageBean<SaleVisit> findAllSaleVisit(DetachedCriteria criteria, Integer currPage, Integer pageSize);

	/**
	 *保存拜访记录
	 * @param saleVisit 拜访记录对象实体
	 */
	public void saveSaleVisit(SaleVisit saleVisit);

}
