package com.learnjava.web.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.learnjava.domain.Customer;
import com.learnjava.domain.PageBean;
import com.learnjava.service.CustomerService;
import com.learnjava.utils.UploadUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

public class CustomerAction extends ActionSupport implements ModelDriven<Customer>{

	//模型驱动获取Customer
	private Customer customer = new Customer();
	@Override
	public Customer getModel() {
		return customer;
	}
	
	//注入CustomerService
	@Resource(name="customerService")
	private CustomerService customerService;
	
	//离线条件查询对象
	private DetachedCriteria criteria =  DetachedCriteria.forClass(Customer.class);

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
	
	/**
	 * 文件上传提供的三个属性:
	 */
	private String uploadFileName; // 文件名称
	private File upload; // 上传文件
	private String uploadContentType; // 文件类型
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	/**
	 * 跳转到add.jsp
	 * @return 跳转到add.jsp
	 */
	public String saveUI() {
		return "saveUI";
	}
	
	/**
	 * 保存客户
	 * @return 跳转到list.jsp页面
	 * @throws IOException 
	 */
	public String saveCustomer() throws IOException {
		// 上传图片:
		if (upload != null) {
			// 文件上传：
			// 设置文件上传路径:
			String path = "G:/upload";
			// 一个目录下存放的相同文件名：随机文件名
			String uuidFileName = UploadUtils.getUuidFileName(uploadFileName);
			// 一个目录下存放的文件过多：目录分离
			String realPath = UploadUtils.getPath(uuidFileName);
			// 创建目录:
			String url = path + realPath;
			File file = new File(url);
			if (!file.exists()) {
				file.mkdirs();
			}
			// 文件上传:
			File dictFile = new File(url + "/" + uuidFileName);
			FileUtils.copyFile(upload, dictFile);
			// 设置image的属性的值:
			customer.setCust_image(url + "/" + uuidFileName);
		}	
		//保存用户
		customerService.saveCustomer(customer);
		return "saveSuccess";
	}
	
	/**
	 * 根据客户id查询客户实体,然后返回得到的客户实体
	 */
	public void findByID() {
		customer = customerService.findById(customer.getCust_id());
		ActionContext.getContext().getValueStack().push(customer);
	}
	
	/**
	 * (条件)查询所以客户
	 * @return 跳转到list.jsp页面
	 */
	public String findAllCustomers() {
		//添加条件查询
		if(customer.getCust_name() != null) {
			criteria.add(Restrictions.like("cust_name", "%"+customer.getCust_name()+"%"));
		}
		
		//2个if条件并列,结果会查询不了,前端默认值是 ""
		if(customer.getBaseDictSource() != null ) {
			if(customer.getBaseDictSource().getDict_id() != null && !"".equals(customer.getBaseDictSource().getDict_id())) {
				criteria.add(Restrictions.eq("baseDictSource.dict_id", customer.getBaseDictSource().getDict_id()));
			}
		}
		
		if(customer.getBaseDictLevel() != null) {
			if(customer.getBaseDictLevel().getDict_id() != null && !"".equals(customer.getBaseDictLevel().getDict_id())) {
				criteria.add(Restrictions.eq("baseDictLevel.dict_id", customer.getBaseDictLevel().getDict_id()));
			}
		}
		
		if(customer.getBaseDictIndustry() != null) {
			if(customer.getBaseDictIndustry().getDict_id() != null && !"".equals(customer.getBaseDictIndustry().getDict_id())) {
				criteria.add(Restrictions.eq("baseDictIndustry.dict_id", customer.getBaseDictIndustry().getDict_id()));
			}
		}
		
		// 调用业务层查询:
		PageBean<Customer> pageBean = customerService.findByPage(criteria, currPage, pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		//不带分页的查询所以客户
	/*	List<Customer> customerList = customerService.findAllCustomers(criteria);
		ActionContext.getContext().getValueStack().set("customerList",customerList);*/
		return SUCCESS;
	}
	
	/**
	 * 查询所有用户然后转JSON输出
	 * @return NONE
	 * @throws IOException
	 */
	public String findAllCustomer() throws IOException {
		//调用业务层
		List<Customer> customerList = customerService.findAllCustomers(criteria);
		
		//list对象转为json数据
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] {"linkMans","baseDictSource","baseDictIndustry","baseDictLevel","cust_mobile","cust_phone","cust_image"});
		JSONArray jsonArray = JSONArray.fromObject(customerList, jsonConfig);
		//回显到页面
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println(jsonArray.toString());
		
		return NONE;
	}
	
	/**
	 * 删除客户
	 * @return 跳转到list.jsp
	 */
	public String deleteCustomer() {
		//先查询在删除(方便hibernate的级联删除)
		customer = customerService.findById(customer.getCust_id());
		//删除图片
		if(customer.getCust_image() != null) {
			File file = new File(customer.getCust_image());
			if (file.exists()) {
				file.delete();
			}
		}
		//删除客户
		customerService.deleteCustomer(customer);
		return "deleteSuccess";
	}
	
	public String editUI() {
		// 根据id查询，跳转页面，回显数据
		customer = customerService.findById(customer.getCust_id());
		// 将customer传递到页面：
		// 两种方式：一种，手动压栈。二种，因为模型驱动的对象，默认在栈顶。
		// 如果使用第一种方式：回显数据: <s:property value="cust_name"/> <s: name="cust_name" value="">
		// 如果使用第二种方式：回显数据: <s:property value="model.cust_name"/>
		ActionContext.getContext().getValueStack().push(customer);
		// 跳转页面
		return "editUI";
		
	}
	
	/**
	 * 修改客户
	 * @return 跳转到list.jsp
	 * @throws IOException
	 */
	public String updateCustomer() throws IOException {
		// 文件项是否已经选择：如果选择了，就删除原有文件，上传新文件。如果没有选，使用原有即可。
		if (upload != null ) {
			// 已经选择了:
			// 删除原有文件:
			String cust_image = customer.getCust_image();
			if(customer.getCust_image() != null || !"".equals(cust_image)) {
				File file = new File(customer.getCust_image());
				if (file.exists()) {
					file.delete();
				}
			}
			
			// 文件上传：
			// 设置文件上传路径:
			String path = "G:/upload";
			// 一个目录下存放的相同文件名：随机文件名
			String uuidFileName = UploadUtils.getUuidFileName(uploadFileName);
			// 一个目录下存放的文件过多：目录分离
			String realPath = UploadUtils.getPath(uuidFileName);
			// 创建目录:
			String url = path + realPath;
			File file = new File(url);
			if (!file.exists()) {
				file.mkdirs();
			}
			
			// 文件上传:
			File dictFile = new File(url + "/" + uuidFileName);
			FileUtils.copyFile(upload, dictFile);
			// 设置image的属性的值:
			customer.setCust_image(url + "/" + uuidFileName);
		}
		
		customerService.updateCustomer(customer);
		return "updateSuccess";
		
	}
}
