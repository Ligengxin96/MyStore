package com.bookstoreBackstage.service;

import org.hibernate.criterion.DetachedCriteria;

import com.bookstoreBackstage.domain.Admin;

public interface AdminService {

	/**
	 * 
	 * @param criteria 查询条件
	 * @param admin 管理员对象
	 * @return 是否有这个管理员有就返回admin对象没有就返回null
	 */
	Admin login(DetachedCriteria criteria, Admin admin);

}
