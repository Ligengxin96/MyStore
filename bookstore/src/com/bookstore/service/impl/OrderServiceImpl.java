package com.bookstore.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.bookstore.dao.OrderDao;
import com.bookstore.domain.Order;
import com.bookstore.service.OrderService;

@Transactional
public class OrderServiceImpl implements OrderService{

	//属性注入orderDao
	@Resource(name="orderDao")
	private OrderDao orderDao;

	@Override
	public void produceOrder(Order order) {
		order.setOrderStatus("1"); //0=完成 1=待付款 2=已付款,未发货 3=,已发货,待签收
		orderDao.save(order);
	}

	@Override
	public Order findOrderById(String orderID) {
		return orderDao.findById(orderID);
	}

	@Override
	public void updateOrderStatus(Order order) {
		orderDao.update(order);
	}

	@Override
	public List<Order> findOrder(DetachedCriteria criteria) {
		return orderDao.findAll(criteria);
	}
}
