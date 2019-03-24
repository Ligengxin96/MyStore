package com.bookstore.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.bookstore.dao.UserDao;
import com.bookstore.domain.User;

public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{

	@Override
	public User login(DetachedCriteria criteria) {
		List<User> list = (List<User>) this.getHibernateTemplate().findByCriteria(criteria);
		
		if(list.size()>0) {
			return list.get(0);
		}
		else {
			return null;
		}
	}
	
} 