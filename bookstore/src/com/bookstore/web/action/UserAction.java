package com.bookstore.web.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.bookstore.domain.User;
import com.bookstore.service.UserService;
import com.bookstore.utils.MD5Utils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User> {
	private static final long serialVersionUID = 1L;

	// 模型驱动使用的对象
	private User user = new User();
	@Override
	public User getModel() {
		return user;
	}
	
	//获取注册页面的rePassword属性
	private String rePassword;
	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}
	
	//注入UserService
	@Resource(name="userService")
	private UserService userService;

	//离线条件查询对象
	private DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
	
	//跳转登陆页面
	public String index() {
		return "index";
	}
	
	//跳转登陆页面
	public String loginUI() {
		return LOGIN;
	}
	
	//退出登陆
	public String logoutUI() {
		ActionContext.getContext().getSession().remove("user");
		return LOGIN;
	}
	
	//跳转注册页面
	public String registerUI() {
		return "registerUI";
	}
	
	//跳转到修改密码页面
	public String changePasswordUI(){
		return "changePasswordUI";
	}
	
	//跳转到用户个人中心页面
	public String informationUI(){
		return "informationUI";
	}
	
	/**
	 * 校验用户名是否存在
	 * @return NONE
	 */
	public String checkUsername() {
		HttpServletResponse response = ServletActionContext.getResponse();
		criteria.add(Restrictions.eq("username", user.getUsername()));
		//用户名不能为空
		if(!"".equals(user.getUsername())) {
			try {
				List<User> list = userService.findAllUsers(criteria);
				//如果用户名存在
				if(list.size()>0) {
					response.getWriter().println(1);
					return NONE;
				}else {
					response.getWriter().println(0);
					return NONE;
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		//用户名为空就打印错误信息回前端页面
			try {
				response.getWriter().println(2);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		return NONE;
	}
	
	/**
	 * 用户注册
	 * @return 注册完后跳转到登陆页面
	 */
	public String register(){
		criteria.add(Restrictions.eq("username", user.getUsername()));
		List<User> list = userService.findAllUsers(criteria);
		//两次密码是否一样
		if(user.getPassword() != null && user.getPassword().equals(rePassword)) {
			//是否用户名存在
			if(list.size()>0) {
				addActionError("用户名已存在!");
				return "registerUI";
			}else {
				userService.register(user);
				return LOGIN;
			}
		}else {
			addActionError("两次输入的密码不一致!");
			return "registerUI";
		}
	}
	
	/**
	 * 用户登陆的方法:login
	 */
	public String login(){
		User isExistUser = userService.login(criteria,user);
		
		if(isExistUser != null) {
			//判断用户状态是否是冻结
			if("1".equals(isExistUser.getUserStatus())) {
				//保存用户信息到session
				ActionContext.getContext().getSession().put("user", isExistUser);
				//跳转页面
				return "index";
			}
			if("0".equals(isExistUser.getUserStatus())) {
				//返回错误信息
				addActionError("账号安全异常,已被冻结,请联系管理员");
				return LOGIN;
			}
			
		}else {
			//返回错误信息
			addActionError("用户名或密码错误");
			return LOGIN;
		}
		return LOGIN;
	}
	
	/**
	 * 用户忘记密码改密码的功能
	 * @return
	 */
	public String changePassword(){
		criteria.add(Restrictions.eq("username", user.getUsername()));
		List<User> list = userService.findAllUsers(criteria);
	
		//两次密码是否一样
		if(user.getPassword() != null && user.getPassword().equals(rePassword)) {
			//如果用户不存在,提示用户名错误
			if(list.size()==0) {
				addActionError("用户名错误!");
				return NONE;
			}else {
				//用户注册的时候邮箱和电话号码一样才能修改密码
				if(list.get(0).getUserEmail().equals(user.getUserEmail()) && list.get(0).getUserPhone().equals(user.getUserPhone())) {
					//先把新密码设置成原本用户的密码
					list.get(0).setPassword(MD5Utils.md5(user.getPassword()));
					userService.updateUser(list.get(0));
					return LOGIN;
				}else {
					addActionError("注册所用邮箱或手机号码错误!");
					return "changePasswordUI";
				}
			}
		}else {
			addActionError("两次输入的密码不一致!");
			return NONE;
		}
	}
	
	/**
	 * 修改用户信息
	 */
	public void updateInformation(){
		User existerUser = (User) ActionContext.getContext().getSession().get("user");
		
		existerUser.setUserAddress(user.getUserAddress());
		existerUser.setUserEmail(user.getUserEmail());
		existerUser.setUserPhone(user.getUserPhone());
		
		userService.updateUser(existerUser);
	}
	
}

	
