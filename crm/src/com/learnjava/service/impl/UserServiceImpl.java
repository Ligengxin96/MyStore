package com.learnjava.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.transaction.annotation.Transactional;

import com.learnjava.dao.UserDao;
import com.learnjava.domain.User;
import com.learnjava.service.UserService;
import com.learnjava.utils.MD5Utils;

@Transactional
public class UserServiceImpl implements UserService{

	//注入UserDao
	@Resource(name="userDao")
	private UserDao userDao;

	@Override
	public void regist(User user) {
		//使用md5加密用户密码
		user.setUser_password(MD5Utils.md5(user.getUser_password()));
		user.setUser_state("1");
		userDao.save(user);
	}

	@Override
	public User login(DetachedCriteria criteria,User user) {
		//使用md5加密用户密码
		user.setUser_password(MD5Utils.md5(user.getUser_password()));
		//添加查询条件
		criteria.add(Restrictions.eq("user_code", user.getUser_code()));
		criteria.add(Restrictions.eq("user_password", user.getUser_password()));
		
		return userDao.login(criteria);
	}

	@Override
	public List<User> findAllUsers(DetachedCriteria criteria) {
		return userDao.findAll(criteria);
	}
}