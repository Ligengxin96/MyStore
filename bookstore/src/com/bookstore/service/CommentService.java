package com.bookstore.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.bookstore.domain.Comment;

public interface CommentService {

	/**
	 * 查询评论
	 * @param criteria
	 * @return 一个装有评论的list集合
	 */
	public List<Comment> findcomment(DetachedCriteria criteria);

	/**
	 * 添加评论
	 */
	public void addComment(Comment comment);

}
