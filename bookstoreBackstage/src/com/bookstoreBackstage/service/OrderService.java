package com.bookstoreBackstage.service;

import org.hibernate.criterion.DetachedCriteria;

import com.bookstoreBackstage.domain.Order;
import com.bookstoreBackstage.domain.PageBean;

public interface OrderService {

	/**
	 * 分页查询所有图书
	 * @param criteria 查询条件
	 * @param currPage 当前页数
	 * @param pageSize 每页显示数量
	 * @return
	 */
	public PageBean<Order> findAllOrders(DetachedCriteria criteria, Integer currPage, Integer pageSize);

	/**
	 *未发货订单修改为以发货
	 * @param order order对象实体
	 */
	public void updateOrder(Order order);

	/**
	 * 根据订单id查询订单
	 * @param orderId
	 * @return 查询到的order对象 如果没查到返回null
	 */
	public Order findOrderById(String orderId);

}
