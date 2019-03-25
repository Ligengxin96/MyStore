package com.bookstoreBackstage.service.impl;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.transaction.annotation.Transactional;

import com.bookstoreBackstage.dao.AdminDao;
import com.bookstoreBackstage.domain.Admin;
import com.bookstoreBackstage.service.AdminService;
import com.bookstoreBackstage.utils.MD5Utils;

@Transactional
public class AdminServiceImpl implements AdminService{
 
	//属性注入adminDao
	@Resource(name="adminDao")
	private AdminDao adminDao;
	
	@Override
	public Admin login(DetachedCriteria criteria, Admin admin) {
		//使用md5加密密码
		admin.setPassword(MD5Utils.md5(admin.getPassword()));
		//设置查询条件
		criteria.add(Restrictions.eq("password", admin.getPassword()));
		criteria.add(Restrictions.eq("adminName", admin.getAdminName()));
		
		return adminDao.login(criteria);
	}

}
