package com.bookstore.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.bookstore.dao.CommentDao;
import com.bookstore.domain.Comment;

public class CommentDaoImpl extends BaseDaoImpl<Comment> implements CommentDao {

	@Override
	public List<Comment> findComment(DetachedCriteria criteria) {
		getHibernateTemplate().setMaxResults(10);
		return (List<Comment>) getHibernateTemplate().findByCriteria(criteria);
	}

}
