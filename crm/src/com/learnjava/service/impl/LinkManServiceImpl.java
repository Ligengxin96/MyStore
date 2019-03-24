package com.learnjava.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.learnjava.dao.LinkManDao;
import com.learnjava.domain.LinkMan;
import com.learnjava.domain.PageBean;
import com.learnjava.service.LinkManService;

@Transactional
public class LinkManServiceImpl implements LinkManService {

	//注入LinkManDao
	@Resource(name="linkManDao")
	private LinkManDao linkManDao;

	@Override
	public PageBean<LinkMan> findByPage(DetachedCriteria criteria, Integer currPage, Integer pageSize) {
		PageBean<LinkMan> pageBean = new PageBean<LinkMan>();
		// 封装当前页数:
		pageBean.setCurrPage(currPage);
		// 封装每页显示记录数:
		pageBean.setPageSize(pageSize);
		// 封装总记录数:
		// 调用DAO:
		Integer totalCount  = linkManDao.findCount(criteria);
		pageBean.setTotalCount(totalCount);
		
		// 封装总页数:
		Double tc = totalCount.doubleValue();
		Double num = Math.ceil(tc/pageSize);
		pageBean.setTotalPage(num.intValue());
		
		// 封装每页显示数据的集合
		Integer begin = (currPage - 1) * pageSize;
		List<LinkMan> list = linkManDao.findByPage(criteria,begin,pageSize);
		pageBean.setList(list);
		
		return pageBean;
	}

	@Override
	public void saveLinkMan(LinkMan linkMan) {
		linkManDao.save(linkMan);
	}

	@Override
	public LinkMan findByID(Long lkm_id) {
		return linkManDao.findById(lkm_id);
	}

	@Override
	public void updateLinkMan(LinkMan linkMan) {
		linkManDao.update(linkMan);
	}

	@Override
	public void deleteCustomer(LinkMan linkMan) {
		linkManDao.delete(linkMan);
	}
	
	
}
