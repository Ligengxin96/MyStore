package com.learnjava.dao;

import org.hibernate.criterion.DetachedCriteria;

import com.learnjava.domain.User;

public interface UserDao extends BaseDao<User>{
	
	/**
	 * 用户登陆功能
	 * 查找用户的所以信息
	 * @param user 用户实体
	 * @return 如果查询到用户存在吗,返回用户的所以信息,如果没查到返回null
	 */
	public User login(DetachedCriteria criteria);
}