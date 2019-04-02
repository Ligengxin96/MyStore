package com.bookstore.web.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;

import com.bookstore.domain.Category;
import com.bookstore.service.CategoryService;
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
	
	//离线查询对象criteria
	private DetachedCriteria criteria = DetachedCriteria.forClass(Category.class);

	/**
	 * 异步查询分类
	 * @return NONE
	 * @throws IOException
	 */
	public String findCategory() throws IOException {
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
