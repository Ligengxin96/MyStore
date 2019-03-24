package com.learnjava.web.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.learnjava.domain.Customer;
import com.learnjava.domain.PageBean;
import com.learnjava.domain.SaleVisit;
import com.learnjava.domain.User;
import com.learnjava.service.CustomerService;
import com.learnjava.service.SaleVisitService;
import com.learnjava.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SaleVisitAction extends ActionSupport implements ModelDriven<SaleVisit>{
	
	//模型驱动获取SaleVisit对象
	private SaleVisit saleVisit = new SaleVisit();
	@Override
	public SaleVisit getModel() {
		return saleVisit;
	}

	//注入SaleVisitService对象
	@Resource(name="saleVisitService")
	private SaleVisitService saleVisitService;
	
	//注入CustomerService对象
	@Resource(name="customerService")
	private CustomerService customerService;
	
	//注入UserService对象
	@Resource(name="userService")
	private UserService userService;
	
	//离线条件查询对象
	private DetachedCriteria criteria = DetachedCriteria.forClass(SaleVisit.class);
	
	// 使用set方法接收当前页(currPage)和每页显示记录数(pageSize)
	private Integer currPage = 1;
	private Integer pageSize = 3;
	public void setCurrPage(Integer currPage) {
		if (currPage == null) {
			currPage = 1;
		}
		this.currPage = currPage;
	}
	public void setPageSize(Integer pageSize) {
		if (pageSize == null) {
			pageSize = 3;
		}
		this.pageSize = pageSize;
	}
	
	//使用set方法接收截止日期(visit_end_time)
	private Date visit_end_time;
	public void setVisit_end_time(Date visit_end_time) {
		this.visit_end_time = visit_end_time;
	}
	//回显需要get方法(Action在值栈中,所有action的属性也在值栈中,但是一定要有get方法)
	public Date getVisit_end_time() {
		return visit_end_time;
	}
	//(条件)查询所有拜访记录
	public String findAllSaleVisits() {
		//设置查询条件
		if(saleVisit.getVisit_time() != null) {
			criteria.add(Restrictions.ge("visit_time",saleVisit.getVisit_time()));
		}
		
		if(visit_end_time != null) {
			criteria.add(Restrictions.le("visit_time",visit_end_time));
		}
		
		//调用业务层
		PageBean<SaleVisit> pageBean = saleVisitService.findAllSaleVisit(criteria,currPage,pageSize);
 		ActionContext.getContext().getValueStack().push(pageBean);
		
		return SUCCESS;
	}
	
	//页面跳转到add.jsp
	public String saveUI() {
		/*criteria = DetachedCriteria.forClass(Customer.class);
		List<Customer> customersList = customerService.findAllCustomers(criteria);
		ActionContext.getContext().getValueStack().set("customersList", customersList);
		
		criteria = DetachedCriteria.forClass(User.class);
		List<User> usersList = userService.findAllUsers(criteria);
		ActionContext.getContext().getValueStack().set("usersList", usersList);*/
		return "saveUI";	
	}
	
	//保存拜访记录
	public String saveSaleVisit() {
		saleVisitService.saveSaleVisit(saleVisit);	
		return "saveSuccess";
	}
}
