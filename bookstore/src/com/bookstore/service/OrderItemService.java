package com.bookstore.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.bookstore.domain.OrderItem;

public interface OrderItemService {

	/**
	 * 生成订单详情
	 * @param orderItem
	 */
	public void saveOrderDetail(OrderItem orderItem);

	/**
	 * 查找订单详情
	 * @param orderItemCriteria
	 * @return 这个订单的详情(所有书籍的数量等等)一个List集合
	 */
	public List<OrderItem> findOrderDetail(DetachedCriteria criteria);


	/**
	 * 删除订单详情
	 * @param orderItem 订单详细对象
	 */
	public void deleteOrderItem(OrderItem orderItem);
}
