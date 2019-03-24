package com.learnjava.web.interceptor;

import org.apache.struts2.ServletActionContext;

import com.learnjava.domain.User;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class PrivilegeInterceptor extends MethodFilterInterceptor{

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		//判断session是否有用户对象
		User isExistUser = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		//如果存在
		if (isExistUser != null) {
			return invocation.invoke();
		}else {
			//如果不存在,保存错误信息
			ActionSupport actionSupport = (ActionSupport)invocation.getAction();
			actionSupport.addActionError("没有访问权限,请先登录!");
			//返回登陆页面
			return actionSupport.LOGIN;
		}
		
	}

}
