package com.learnjava.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.learnjava.domain.Customer;
import com.learnjava.domain.PageBean;

public interface CustomerService {

	/**
	 * 保存客户
	 * @param customer 客户对象
	 */
	public void saveCustomer(Customer customer);

	/**
	 * 查询所以客户
	 * @param criteria 查询条件
	 * @return 返回一个装有所有客户的list集合
	 */
	public List<Customer> findAllCustomers(DetachedCriteria criteria);
	
	/**
	 * 分页查询客户的方法
	 * @param criteria 查询条件
	 * @param currPage 当前页数
	 * @param pageSize 每页显示的个数
	 * @return 一个装有pageBean对象(里面装有Customer对象)的list集合
	 */
	public PageBean<Customer> findByPage(DetachedCriteria criteria, Integer currPage, Integer pageSize);

	/**
	 * 根据客户id查找客户
	 * @param cust_id 客户对象的id
	 * @return 查找到的客户实体
	 */
	public Customer findById(Long cust_id);

	/**
	 * 删除客户
	 * @param customer 客户对象
	 */
	public void deleteCustomer(Customer customer);

	/**
	 * 修改客户信息
	 * @param customer 客户对象
	 */
	public void updateCustomer(Customer customer);

}
