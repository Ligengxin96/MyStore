package com.learnjava.web.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;

import com.learnjava.domain.User;
import com.learnjava.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

public class UserAction extends ActionSupport implements ModelDriven<User> {
	// 模型驱动使用的对象
	private User user = new User();
	@Override
	public User getModel() {
		return user;
	}
	
	//注入UserService
	@Resource(name="userService")
	private UserService userService;

	//离线条件查询对象
	private DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
	
	//跳转注册页面
	public String registUI() {
		return "registUI";
	}
	
	/**
	 * 用户注册
	 * @return 注册完后跳转到登陆页面
	 */
	public String regist() {
		userService.regist(user);
		return LOGIN;
	}
	
	/**
	 * 用户登陆的方法:login
	 */
	public String login(){
		User isExistUser = userService.login(criteria,user);
		
		if(isExistUser != null) {
			//保存用户信息到session
			ActionContext.getContext().getSession().put("user", isExistUser);
			//跳转页面
			return SUCCESS;
		}else {
			//返回错误信息
			addActionError("用户名或密码错误");
			return LOGIN;
		}
		
	}
	
	/**
	 * 查询所有用户然后转JSON输出
	 * @return NONE
	 * @throws IOException
	 */
	public String findAllUsers() throws IOException {
		//调用业务层
		List<User> usersList = userService.findAllUsers(criteria);

		//list对象转为json数据
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] {"user_password","user_state"});
		JSONArray jsonArray = JSONArray.fromObject(usersList, jsonConfig);
		//回显到页面
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println(jsonArray.toString());
		
		return NONE;
	}
	
}

	
