package com.learnjava.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.learnjava.dao.CustomerDao;
import com.learnjava.domain.Customer;
import com.learnjava.domain.PageBean;
import com.learnjava.service.CustomerService;

@Transactional
public class CustomerServiceImpl implements CustomerService{

	@Resource(name="customerDao")
	private CustomerDao customerDao;
	
	@Override
	public void saveCustomer(Customer customer) {
		customerDao.save(customer);
	}

	@Override
	public List<Customer> findAllCustomers(DetachedCriteria criteria) {
		return customerDao.findAll(criteria);
	}

	@Override
	public PageBean<Customer> findByPage(DetachedCriteria criteria, Integer currPage, Integer pageSize) {
		PageBean<Customer> pageBean = new PageBean<Customer>();
		// 封装当前页数:
		pageBean.setCurrPage(currPage);
		// 封装每页显示记录数:
		pageBean.setPageSize(pageSize);
		// 封装总记录数:
		// 调用DAO:
		Integer totalCount  = customerDao.findCount(criteria);
		pageBean.setTotalCount(totalCount);
		
		// 封装总页数:
		Double tc = totalCount.doubleValue();
		Double num = Math.ceil(tc/pageSize);
		pageBean.setTotalPage(num.intValue());
		
		// 封装每页显示数据的集合
		Integer begin = (currPage - 1) * pageSize;
		List<Customer> list = customerDao.findByPage(criteria,begin,pageSize);
		pageBean.setList(list);
		
		return pageBean;
	}

	@Override
	public Customer findById(Long cust_id) {
		return customerDao.findById(cust_id);
	}

	@Override
	public void deleteCustomer(Customer customer) {
		customerDao.delete(customer);
	}

	@Override
	public void updateCustomer(Customer customer) {
		customerDao.update(customer);
	}
}
