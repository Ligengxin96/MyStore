package com.learnjava.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.learnjava.domain.Customer;
import com.learnjava.domain.PageBean;
import com.learnjava.domain.User;

public interface UserService{
	
	/**
	 * 保存注册的用户
	 * @param user 用户对象
	 */
	public void regist(User user);

	/**
	 * 用户登陆功能
	 * @param criteria 查询条件
	 * @param user 用户对象
	 * @return 返回用户的所有信息
	 */
	public User login(DetachedCriteria criteria,User user);
	
	/**
	 * 查询所有用户
	 * @param criteria 查询条件
	 * @return 装有所有User对象的集合
	 */
	public List<User> findAllUsers(DetachedCriteria criteria);
}