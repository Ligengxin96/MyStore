package com.learnjava.service;

import org.hibernate.criterion.DetachedCriteria;

import com.learnjava.domain.LinkMan;
import com.learnjava.domain.PageBean;

public interface LinkManService {

	/**
	 * 分页查询联系人
	 * @param criteria 查询条件
	 * @param currPage 当前页数
	 * @param pageSize 每页显示的个数
	 * @return 一个装有pageBean对象(里面装有LinkMan对象)的list集合
	 */
	public PageBean<LinkMan> findByPage(DetachedCriteria criteria, Integer currPage, Integer pageSize);

	/**
	 * 保存联系人
	 * @param linkMan 联系人实体
	 */
	public void saveLinkMan(LinkMan linkMan);

	/**
	 * 根据联系人id查询联系人
	 * @param lkm_id 联系人id
	 * @return 查询到的联系人实体
	 */
	public LinkMan findByID(Long lkm_id);

	/**
	 * 修改联系人对象
	 * @param linkMan 联系人对象
	 */
	public void updateLinkMan(LinkMan linkMan);

	/**
	 * 删除联系人对象
	 * @param linkMan 联系人对象
	 */
	public void deleteCustomer(LinkMan linkMan);

}
