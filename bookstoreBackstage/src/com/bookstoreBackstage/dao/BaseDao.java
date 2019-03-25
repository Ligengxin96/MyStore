package com.bookstoreBackstage.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

public interface BaseDao<T>{
	
	/**
	 * 保存功能
	 * @param t 需要保存的对象实体
 	 */
	public void save(T t);
	
	/**
	 * 删除功能
	 * @param t 需要删除的对象实体
	 */
	public void delete(T t);

	/**
	 * 修改功能
	 * @param t 需要修改的对象实体
	 */
	public void update(T t);
	
	/**
	 * 查询所以对象的实体类
	 * @return 返回一个装有所有对象实体的list集合
	 */
	public List<T> findAll(DetachedCriteria criteria);

	/**
	 * 查询总记录数字
	 * @param criteria 查询条件
	 * @return 查询到的数据的总个数
	 */
	public Integer findCount(DetachedCriteria criteria);
	
	/**
	 * 分页查询对象实体的方法
	 * @param criteria 查询条件
	 * @param begin 起始页数
	 * @param pageSize 每页显示个数
	 * @return 一个被分页限制对象实体个数的list集合
	 */
	public List<T> findByPage(DetachedCriteria criteria, Integer begin, Integer pageSize);

	/**
	 * 根据id对象实体
	 * @param 实体的id
	 * @return 查找到的对象实体
	 */
	public T findById(Serializable id);
}
