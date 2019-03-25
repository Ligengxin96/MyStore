package com.bookstoreBackstage.web.interceptor;

import org.apache.struts2.ServletActionContext;

import com.bookstoreBackstage.domain.Admin;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class PrivilegeInterceptor extends MethodFilterInterceptor{
	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		//判断session是否有用户对象
		Admin isExistUser = (Admin) ServletActionContext.getRequest().getSession().getAttribute("admin");
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
