package com.learnjava.web.action;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.learnjava.domain.Customer;
import com.learnjava.domain.LinkMan;
import com.learnjava.domain.PageBean;
import com.learnjava.service.CustomerService;
import com.learnjava.service.LinkManService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LinkManAction extends ActionSupport implements ModelDriven<LinkMan>{
	
	//注入LinkManService
	@Resource(name="linkManService")
	private LinkManService linkManService;

	//注入CustomerService
	@Resource(name="customerService")
	private CustomerService customerService;
	
	//模型驱动获取LinkMan对象
	private LinkMan linkMan = new LinkMan();
	@Override
	public LinkMan getModel() {
		return linkMan;
	}
	
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
	
	//离线条件查询对象
	private DetachedCriteria criteria =  DetachedCriteria.forClass(LinkMan.class);
	
	//跳转添加联系人页面
	public String saveUI() {
		//同步查询customer对象回显到页面
		criteria = DetachedCriteria.forClass(Customer.class);
		List<Customer> customersList = customerService.findAllCustomers(criteria);
		ActionContext.getContext().getValueStack().set("customersList", customersList);
		
		return "saveUI";
	}
	
	//跳转修改联系人页面
	public String editUI() {
		//查询所有customer对象
		//在根据id查询联系人对象回显到页面
		criteria = DetachedCriteria.forClass(Customer.class);
		List<Customer> customersList = customerService.findAllCustomers(criteria);
		ActionContext.getContext().getValueStack().set("customersList", customersList);
		
		//查询联系人
		criteria = DetachedCriteria.forClass(LinkMan.class);
		linkMan = linkManService.findByID(linkMan.getLkm_id());
		ActionContext.getContext().getValueStack().push(linkMan);
		
		return "editUI";
	}
	
	//删除联系人
	public String deleteCustomer() {
		//先查询在删除(方便hibernate的级联删除)
		linkMan = linkManService.findByID(linkMan.getLkm_id());
		linkManService.deleteCustomer(linkMan);
		return"deleteSuccess";
	}
	
	//查找联系人
	public String findAllLinkMans() {
		//添加条件查询
		if(linkMan.getLkm_name() != null) {
			criteria.add(Restrictions.like("lkm_name", "%"+linkMan.getLkm_name()+"%"));
		}
		
		if(linkMan.getLkm_gender() != null && !"".equals(linkMan.getLkm_gender())) {
			criteria.add(Restrictions.eq("lkm_gender", linkMan.getLkm_gender()));
		}
		
		// 调用业务层查询:
		PageBean<LinkMan> pageBean = linkManService.findByPage(criteria, currPage, pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		return SUCCESS;
	}
	
	//保存联系人
	public String saveLinkMan() {
		linkManService.saveLinkMan(linkMan);
		return "saveSuccess";
	}
	
	//修改联系人
	public String updateLinkMan() {
		linkManService.updateLinkMan(linkMan);
		return "updateSuccess";
	}
	
}
