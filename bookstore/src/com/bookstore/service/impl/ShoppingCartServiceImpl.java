package com.bookstore.service.impl;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.bookstore.dao.ShoppingCartDao;
import com.bookstore.domain.ShoppingCart;
import com.bookstore.service.ShoppingCartService;

@Transactional
public class ShoppingCartServiceImpl implements ShoppingCartService{

	@Resource(name="shoppingCartDao")
	private ShoppingCartDao shoppingCartDao;

	@Override
	public void save(ShoppingCart shoppingCart) {
		shoppingCartDao.save(shoppingCart);
	}

}
