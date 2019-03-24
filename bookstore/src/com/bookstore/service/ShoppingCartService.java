package com.bookstore.service;

import com.bookstore.domain.ShoppingCart;

public interface ShoppingCartService {

	/**
	 * 保存购物车对象
	 * @param shoppingCart shoppingCart对象
	 */
	public void save(ShoppingCart shoppingCart);
}
