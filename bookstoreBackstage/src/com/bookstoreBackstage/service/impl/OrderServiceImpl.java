package com.bookstoreBackstage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.bookstoreBackstage.dao.OrderDao;
import com.bookstoreBackstage.domain.Order;
import com.bookstoreBackstage.domain.PageBean;
import com.bookstoreBackstage.service.OrderService;

@Transactional
public class OrderServiceImpl implements OrderService {
	//属性注入orderDao
	@Resource(name="orderDao")
	private OrderDao orderDao;

	@Override
	public PageBean<Order> findAllOrders(DetachedCriteria criteria, Integer currPage, Integer pageSize) {
		PageBean<Order> pageBean = new PageBean<Order>();
		// 封装当前页数:
		pageBean.setCurrPage(currPage);
		// 封装每页显示记录数:
		pageBean.setPageSize(pageSize);
		// 封装总记录数:
		// 调用DAO:
		Integer totalCount  = orderDao.findCount(criteria);
		pageBean.setTotalCount(totalCount);
		
		// 封装总页数:
		Double tc = totalCount.doubleValue();
		Double num = Math.ceil(tc/pageSize);
		pageBean.setTotalPage(num.intValue());
		
		// 封装每页显示数据的集合
		Integer begin = (currPage - 1) * pageSize;
		List<Order> list = orderDao.findByPage(criteria,begin,pageSize);
		pageBean.setList(list);
		
		return pageBean;
	}

	@Override
	public void updateOrder(Order order) {
		orderDao.update(order);
	}

	@Override
	public Order findOrderById(String orderId) {
		return orderDao.findById(orderId);
	}
}
