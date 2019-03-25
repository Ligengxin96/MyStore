package com.bookstoreBackstage.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.bookstoreBackstage.dao.BaseDao;

public class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T> {

	/*方法1.提供构造器获取子类的对象的类型(get方法需要的参数)
	private Class clazz;
	public BaseDaoImpl(Class clazz) {
		this.clazz = clazz;
	}*/
	
	//方法2(不需要子类提供构造器)
	private Class clazz;
	
	public BaseDaoImpl() {
		// 反射：第一步获得Class
		Class clazz = this.getClass();// 正在被调用那个类的Class,CustomerDaoImpl或者LinkManDaoImpl。
		// 查看JDK的API
		Type type = clazz.getGenericSuperclass();// 参数化类型：BaseDaoImpl<Customer>，BaseDaoImpl<LinkMan>
		// 得到这个type就是一个参数化的类型， 将type强转成参数化的类型:
		ParameterizedType pType = (ParameterizedType) type;
		// 通过参数化类型获得实际类型参数:得到一个实际类型参数的数组？Map<String,Integer>.
		Type[] types = pType.getActualTypeArguments();
		// 只获得第一个实际类型参数即可。
		this.clazz = (Class) types[0];// 得到Customer、LinkMan、User
	}
	
	@Override
	public void save(T t) {
		this.getHibernateTemplate().save(t);
	}

	@Override
	public void delete(T t) {
		this.getHibernateTemplate().delete(t);
	}

	@Override
	public void update(T t) {
		this.getHibernateTemplate().update(t);
	}

	@Override
	public List<T> findAll(DetachedCriteria criteria) {
		return (List<T>) this.getHibernateTemplate().findByCriteria(criteria);
	}

	@Override
	public Integer findCount(DetachedCriteria criteria) {
		//设置统计查询条件
		criteria.setProjection(Projections.rowCount());
		List<Long> list = (List<Long>) this.getHibernateTemplate().findByCriteria(criteria);
		
		if(list.size()>0) {
			return list.get(0).intValue();
		}
		return null;
	}

	@Override
	public List<T> findByPage(DetachedCriteria criteria, Integer begin, Integer pageSize) {
		//清空查询条件
		criteria.setProjection(null);
		return (List<T>) this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
	}

	@Override
	public T findById(Serializable id) {
		return (T) this.getHibernateTemplate().get(clazz, id);
	}

}
