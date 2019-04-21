package com.bookstore.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.bookstore.dao.CommentDao;
import com.bookstore.domain.Comment;
import com.bookstore.service.CommentService;

@Transactional
public class CommentServiceImpl implements CommentService {

	//属性注入commentDao
	@Resource(name="commentDao")
	private CommentDao commentDao;

	@Override
	public List<Comment> findcomment(DetachedCriteria criteria) {
		return commentDao.findComment(criteria);
	}

	@Override
	public void addComment(Comment comment) {
		commentDao.save(comment);
	}
}
