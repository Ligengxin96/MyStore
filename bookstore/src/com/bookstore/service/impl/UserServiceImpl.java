package com.bookstore.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.transaction.annotation.Transactional;

import com.bookstore.dao.UserDao;
import com.bookstore.domain.User;
import com.bookstore.service.UserService;
import com.bookstore.utils.MD5Utils;

@Transactional
public class UserServiceImpl implements UserService{

	//注入UserDao
	@Resource(name="userDao")
	private UserDao userDao;

	@Override
	public void register(User user) {
		//使用md5加密用户密码
		user.setPassword(MD5Utils.md5(user.getPassword()));
		user.setUserStatus("1");
		userDao.save(user);
	}

	@Override
	public User login(DetachedCriteria criteria,User user) {
		//使用md5加密用户密码
		user.setPassword(MD5Utils.md5(user.getPassword()));
		//添加查询条件
		criteria.add(Restrictions.eq("username", user.getUsername()));
		criteria.add(Restrictions.eq("password", user.getPassword()));
		
		return userDao.login(criteria);
	}

	@Override
	public List<User> findAllUsers(DetachedCriteria criteria) {
		return userDao.findAll(criteria);
	}

	@Override
	public void updateUser(User user) {
		userDao.update(user);
	}

	@Override
	public User findUserById(String userId) {
		return userDao.findById(userId);
	}
}