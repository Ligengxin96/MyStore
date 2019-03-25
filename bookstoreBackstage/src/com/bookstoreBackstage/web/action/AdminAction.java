package com.bookstoreBackstage.web.action;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;

import com.bookstoreBackstage.service.AdminService;
import com.bookstoreBackstage.domain.Admin;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminAction extends ActionSupport implements ModelDriven<Admin> {
	// 模型驱动使用的对象
	private Admin admin = new Admin();
	@Override
	public Admin getModel() {
		return admin;
	}
	
	//注入UserService
	@Resource(name="adminService")
	private AdminService adminService;

	//离线条件查询对象
	private DetachedCriteria criteria = DetachedCriteria.forClass(Admin.class);
	
	/**
	 * 登陆的方法:login
	 */
	public String login(){
		Admin isExistUser = adminService.login(criteria,admin);
		
		if(isExistUser != null) {
			//保存用户信息到session
			ActionContext.getContext().getSession().put("admin", isExistUser);
			//跳转页面
			return SUCCESS;
		}else {
			//返回错误信息
			addActionError("用户名或密码错误");
			return LOGIN;
		}
		
	}
	
}

	
