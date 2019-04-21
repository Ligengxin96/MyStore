package com.bookstore.web.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.bookstore.domain.Comment;
import com.bookstore.domain.User;
import com.bookstore.service.CommentService;
import com.bookstore.utils.JsonDateValueProcessor;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

public class CommentAction extends ActionSupport implements ModelDriven<Comment>{
	
	private static final long serialVersionUID = 1L;

	//模型驱动获取comment
	private Comment comment = new Comment();
	@Override
	public Comment getModel() {
		return comment;
	}

	//属性注入commentService
	@Resource(name="commentService")
	private CommentService commentService;
	
	//离线查询条件
	private DetachedCriteria criteria = DetachedCriteria.forClass(Comment.class);
	
	/**
	 * 查询评论
	 * @throws IOException 
	 */
	public void findComment() throws IOException {
		criteria.add(Restrictions.eq("bookId", comment.getBookId()));
		criteria.addOrder(Order.asc("commentTime"));
		List<Comment> findcommentList = commentService.findcomment(criteria);
		
		JsonConfig config = new JsonConfig();
		JsonDateValueProcessor jsonValueProcessor = new JsonDateValueProcessor();
		config.registerJsonValueProcessor(Date.class, jsonValueProcessor);
		JSONArray jsonArray = JSONArray.fromObject(findcommentList,config);
		
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println(jsonArray.toString());
		
	}
	
	/**
	 * 添加评论
	 * @throws IOException
	 */
	public String addComment() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		User user = (User) ActionContext.getContext().getSession().get("user");
		
		if(user == null) {
			response.getWriter().print("login");
			return null;
		}
		
		comment.setUserId(user.getUserId());
		comment.setUserName(user.getUsername());
		comment.setCommentTime(new Date());
		
		commentService.addComment(comment);
		
		response.getWriter().print("success");
		return null;
	}
}
