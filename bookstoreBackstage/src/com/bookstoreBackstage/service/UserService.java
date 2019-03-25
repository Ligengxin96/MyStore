package com.bookstoreBackstage.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.bookstoreBackstage.domain.PageBean;
import com.bookstoreBackstage.domain.User;

public interface UserService {

	/**
	 * 查询用户
	 * @param criteria
	 * @return 装有所有用户的list
	 */
	List<User> findAllUsers(DetachedCriteria criteria);

	/**
	 * 保存用户
	 * @param user 用户实体
	 */
	void saveUser(User user);

	/**
	 * 分页查询用户
	 * @param criteria 查询条件
	 * @param currPage 当前页数
	 * @param pageSize 每页显示的个数
	 * @return 一个装有pageBean对象(里面装有User对象)的list集合
	 */
	PageBean<User> findByPage(DetachedCriteria criteria, Integer currPage, Integer pageSize);

	/**
	 * 根据用户id查询用户
	 * @param userId 用户id
	 * @return 查找到就返回该用户实体,没找到就返回null
	 */
	User findByID(String userId);

	/**
	 * 修改用户信息
	 * @param user 用户实体
	 */
	void updateUser(User user);

	/**
	 * 删除用户
	 * @param user 用户实体
	 */
	void deleteUser(User user);

}
