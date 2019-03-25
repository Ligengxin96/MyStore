package com.bookstoreBackstage.web.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.bookstoreBackstage.domain.PageBean;
import com.bookstoreBackstage.domain.User;
import com.bookstoreBackstage.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User>{
	private static final long serialVersionUID = 1L;

	//模型驱动获取user对象
	private User user = new User();
	@Override
	public User getModel() {
		return user;
	}

	//注入userService
	@Resource(name="userService")
	private UserService userService;
	
	//设置当前页数(currPage),每页数量(pageSize)
	private Integer currPage = 1;
	private Integer pageSize = 10;
	public void setCurrPage(Integer currPage) {
		if (currPage == null) {
			currPage = 1;
		}
		this.currPage = currPage;
	}
	public void setPageSize(Integer pageSize) {
		if (pageSize == null) {
			pageSize = 10;
		}
		this.pageSize = pageSize;
	}
	
	//离线条件查询对象
	private DetachedCriteria criteria =  DetachedCriteria.forClass(User.class);

	/**
	 * 跳转到添加用户页面
	 * @return 跳转到add.jsp
	 */
	public String saveUI() {
		return "saveUI";
	}
	
	/**
	 * 查询需要修改的用户并跳转到修改页面
	 * @return 跳转到修改页面
	 */
	public String editUI() {
		//根据id查询用户
		criteria = DetachedCriteria.forClass(User.class);
		user = userService.findByID(user.getUserId());
		ActionContext.getContext().getValueStack().push(user);
		
		return "editUI";
	}
	
	/**
	 * 修改用户信息
	 * @return 修改成功页面
	 */
	public String updateUser() {
		userService.updateUser(user);
		return "updateSuccess";
	}
	
	/**
	 * 删除用户
	 * @return 删除成功页面
	 */
	public String deleteUser() {
		//先查询在删除
		user = userService.findByID(user.getUserId());
		userService.deleteUser(user);
		return"deleteSuccess";
	}
	
	/**
	 * 保存用户
	 * @return 用户列表页面
	 */
	public String saveUser() {
		criteria.add(Restrictions.eq("username", user.getUsername()));
		List<User> list = userService.findAllUsers(criteria);
			//是否用户名存在
			if(list.size()>0) {
				addActionError("用户名已存在!");
				return "saveUI";
			}
			else {
				userService.saveUser(user);
				return "saveSuccess";
			}
	}
	
	/**
	 * 查询所有用户
	 * @return 所以用户对象打印到页面
	 * @throws IOException
	 */
	public String findAllUsers() throws IOException {
		//添加查询条件
		if(user.getUsername() != null && !"".equals(user.getUsername())) {
			criteria.add(Restrictions.eq("username", user.getUsername()));
		}
		if(user.getUserStatus() != null) {
			criteria.add(Restrictions.eq("userStatus", user.getUserStatus()));
		}
		// 调用业务层查询
		PageBean<User> pageBean = userService.findByPage(criteria, currPage, pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		return SUCCESS;
	}
	
	
}
