package com.bookstore.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.bookstore.domain.Order;

public interface OrderService {

	/**
	 * 生成订单
	 * @param order 订单实体
	 */
	public void produceOrder(Order order);

	/**
	 * 
	 * @param orderID
	 * @return 一个order 对象
	 */
	public Order findOrderById(String orderID);

	/**
	 * 修改订单状态
	 * @param order order对象
	 */
	public void updateOrderStatus(Order order);

	/**
	 * 查找订单
	 * @param criteria
	 * @return 订单的list
	 */
	public List<Order> findOrder(DetachedCriteria criteria);

}
