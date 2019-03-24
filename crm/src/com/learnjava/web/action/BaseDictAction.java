package com.learnjava.web.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.learnjava.domain.BaseDict;
import com.learnjava.service.BaseDictService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

public class BaseDictAction extends ActionSupport implements ModelDriven<BaseDict>{

	//模型驱动获取baseDictd对象
	private BaseDict baseDict =  new BaseDict(); 
	@Override
	public BaseDict getModel() {
		return baseDict;
	}

	//注入BaseDictService
	@Resource(name="baseDictService")
	private BaseDictService baseDictService;
	
	//离线查询对象criteria
	private DetachedCriteria criteria = DetachedCriteria.forClass(BaseDict.class);
	
	/**
	 * 异步获取数据字典数据
	 * @return
	 * @throws IOException
	 */
	public String findByTypeCode() throws IOException {
		//设置查询条件
		criteria.add(Restrictions.eq("dict_type_code", baseDict.getDict_type_code()));
		List<BaseDict> baseDictList = baseDictService.findByTypeCode(criteria,baseDict);
		/**
		 * JsonConfig:JsonConfig的配置对象
		 * JSONArray: 将数组和list转换为json数据
		 * (JSONObject:将对象和map集合转换为json数据)
		 */
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] {"dict_sort","dict_enable","dict_memo"});
		JSONArray jsonArray = JSONArray.fromObject(baseDictList, jsonConfig);
		//回显到页面
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println(jsonArray.toString());
		
		return NONE;
	}
}
