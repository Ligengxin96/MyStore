package com.bookstoreBackstage.web.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.bookstoreBackstage.domain.Category;
import com.bookstoreBackstage.service.CategoryService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

public class CategoryAction extends ActionSupport implements ModelDriven<Category>{

	private static final long serialVersionUID = 1L;

	//模型驱动获取category对象
	private Category category = new Category();
	@Override
	public Category getModel() {
		return category;
	}
	
	@Resource(name="categoryService")
	private CategoryService categoryService; 
	
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
		
	//离线查询对象criteria
	private DetachedCriteria criteria = DetachedCriteria.forClass(Category.class);

	//跳转到添加页面
	public String saveUI() {
		return "saveUI";
	}
	
	/**
	 * 查询需要修改的分类并跳转到修改页面
	 * @return 跳转到修改页面
	 */
	public String editUI() {
		return "editUI";
	}
	
	
	/**
	 * 异步查询分类
	 * @return NONE
	 * @throws IOException
	 */
	public String findAllCategories() throws IOException {
		criteria.add(Restrictions.isNotNull("pid"));
		List<Category> categoryList = categoryService.findCategory(criteria);
		//list对象转为json数据
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] {"books"});
		JSONArray jsonArray = JSONArray.fromObject(categoryList,jsonConfig);
		//回显到页面
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println(jsonArray.toString());
		
		return NONE;
	}
			

}
