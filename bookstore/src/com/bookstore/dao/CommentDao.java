package com.bookstore.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.bookstore.domain.Comment;

public interface CommentDao extends BaseDao<Comment>{

	/**
	 * 查询10条评论
	 * @param criteria
	 * @return 10条评论的list集合
	 */
	public List<Comment> findComment(DetachedCriteria criteria);
}
