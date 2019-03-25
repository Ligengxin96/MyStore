package com.bookstoreBackstage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.bookstoreBackstage.utils.MD5Utils;
import com.bookstoreBackstage.dao.UserDao;
import com.bookstoreBackstage.domain.PageBean;
import com.bookstoreBackstage.domain.User;
import com.bookstoreBackstage.service.UserService;

@Transactional
public class UserServiceImpl implements UserService {

	//属性注入userDao
	@Resource(name="userDao")
	private UserDao userDao;

	@Override
	public List<User> findAllUsers(DetachedCriteria criteria) {
		return userDao.findAll(criteria);
	}

	@Override
	public void saveUser(User user) {
		//使用md5加密用户密码
		user.setPassword(MD5Utils.md5(user.getPassword()));
		userDao.save(user);
	}

	@Override
	public PageBean<User> findByPage(DetachedCriteria criteria, Integer currPage, Integer pageSize) {
		PageBean<User> pageBean = new PageBean<User>();
		// 封装当前页数:
		pageBean.setCurrPage(currPage);
		// 封装每页显示记录数:
		pageBean.setPageSize(pageSize);
		// 封装总记录数:
		// 调用DAO:
		Integer totalCount  = userDao.findCount(criteria);
		pageBean.setTotalCount(totalCount);
		
		// 封装总页数:
		Double tc = totalCount.doubleValue();
		Double num = Math.ceil(tc/pageSize);
		pageBean.setTotalPage(num.intValue());
		
		// 封装每页显示数据的集合
		Integer begin = (currPage - 1) * pageSize;
		List<User> list = userDao.findByPage(criteria,begin,pageSize);
		pageBean.setList(list);
		
		return pageBean;
	}

	@Override
	public User findByID(String userId) {
		return userDao.findById(userId);
	}

	@Override
	public void updateUser(User user) {
		userDao.update(user);
	}

	@Override
	public void deleteUser(User user) {
		userDao.delete(user);
	} 
}
