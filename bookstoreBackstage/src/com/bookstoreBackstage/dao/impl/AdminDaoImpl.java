package com.bookstoreBackstage.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.bookstoreBackstage.dao.AdminDao;
import com.bookstoreBackstage.domain.Admin;

public class AdminDaoImpl extends BaseDaoImpl<Admin> implements AdminDao {

	@Override
	public Admin login(DetachedCriteria criteria) {
		List<Admin> list = (List<Admin>) this.getHibernateTemplate().findByCriteria(criteria);
		
		if(list.size()>0) {
			return list.get(0);
		}
		else {
			return null;
		}
	}
}

