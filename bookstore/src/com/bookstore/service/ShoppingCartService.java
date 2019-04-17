package com.bookstore.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.bookstore.domain.ShoppingCart;

public interface ShoppingCartService {

	/**
	 * 保存购物车对象
	 * @param shoppingCart shoppingCart对象
	 */
	public void save(ShoppingCart shoppingCart);

	/**
	 * 查询购物车对象是否存在相同的书本
	 * @return shoppingCart对象
	 */
	public List<ShoppingCart> findShoppingCartItem(DetachedCriteria criteria);

	/**
	 * 修改购物车的书本的数量
	 * @param shoppingCart 购物车对象
	 */
	public void updateCount(ShoppingCart shoppingCart);

	/**
	 * 删除购物车
	 * @param shoppingCart 购物车对象
	 */
	public void deleteItem(ShoppingCart shoppingCart);
}
