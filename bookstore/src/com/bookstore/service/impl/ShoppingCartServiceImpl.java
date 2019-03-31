package com.bookstore.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.bookstore.dao.ShoppingCartDao;
import com.bookstore.domain.ShoppingCart;
import com.bookstore.service.ShoppingCartService;

@Transactional
public class ShoppingCartServiceImpl implements ShoppingCartService{

	//属性注入shoppingCartDao
	@Resource(name="shoppingCartDao")
	private ShoppingCartDao shoppingCartDao;

	@Override
	public void save(ShoppingCart shoppingCart) {
		shoppingCartDao.save(shoppingCart);
	}

	@Override
	public List<ShoppingCart> findShoppingCartItem(DetachedCriteria criteria) {
		return shoppingCartDao.findAll(criteria);
	}

	@Override
	public void updateCount(ShoppingCart shoppingCart) {
		shoppingCartDao.update(shoppingCart);
	}


}
