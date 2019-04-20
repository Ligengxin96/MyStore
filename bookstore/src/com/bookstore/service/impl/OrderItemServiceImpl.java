package com.bookstore.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.bookstore.dao.OrderItemDao;
import com.bookstore.domain.OrderItem;
import com.bookstore.service.OrderItemService;

@Transactional
public class OrderItemServiceImpl implements OrderItemService {

	@Resource(name="orderItemDao")
	private OrderItemDao orderItemDao;
	
	@Override
	public void saveOrderDetail(OrderItem orderItem) {
		orderItemDao.save(orderItem);
	}

	@Override
	public List<OrderItem> findOrderDetail(DetachedCriteria criteria) {
		return orderItemDao.findAll(criteria);
	}

	@Override
	public void deleteOrderItem(OrderItem orderItem) {
		orderItemDao.delete(orderItem);
	}

}
