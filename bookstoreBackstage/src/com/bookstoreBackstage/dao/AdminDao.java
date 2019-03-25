package com.bookstoreBackstage.dao;

import org.hibernate.criterion.DetachedCriteria;

import com.bookstoreBackstage.domain.Admin;

public interface AdminDao extends BaseDao<Admin> {

	/**
	 * 管理员登陆方法
	 * @param criteria
	 * @return 查询到的admin对象,没找到就返回null
	 */
	Admin login(DetachedCriteria criteria);

}
