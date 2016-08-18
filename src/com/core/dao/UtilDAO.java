package com.core.dao;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Component;

import com.model.User;


@Component
/**
 * 
 * @author dlf
 *
 */
public class UtilDAO extends HibernateDaoSupport {
	protected void initDao() {
		// do nothing
	}

	public void save(Object transientInstance) {
		try {
			getHibernateTemplate().save(transientInstance);
			// log.debug("save successful");
		} catch (RuntimeException re) {
			// log.error("save failed", re);
			throw re;
		}
	}
	
	public void update(Object transientInstance) {
		try {
			getHibernateTemplate().update(transientInstance);
			// log.debug("save successful");
		} catch (RuntimeException re) {
			// log.error("save failed", re);
			throw re;
		}
	}
	
	public void saveOrUpdate(Object transientInstance){
		try {
			getHibernateTemplate().saveOrUpdate(transientInstance);
			// log.debug("save successful");
		} catch (RuntimeException re) {
			// log.error("save failed", re);
			throw re;
		}
		
	}
	public List<?> findAllList(String entity){
		try {
			String queryString = null;
			queryString = "from "+entity+" order by id desc";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			// log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public void delete(Object transientInstance){
		try {
			getHibernateTemplate().delete(transientInstance);
			// log.debug("save successful");
		} catch (RuntimeException re) {
			// log.error("save failed", re);
			throw re;
		}
	}
	public List<?> findByMap(String entity,Map<?, ?> map) {
		String queryString="from "+entity +" where 1=1  ";
		Iterator<?> iterator = map.entrySet().iterator();
		while (iterator.hasNext()) {
			Entry<?, ?> entry=(Entry<?, ?>) iterator.next();
			queryString+="and ";
			queryString+=entry.getKey();
			queryString+="='";
			queryString+=entry.getValue()+"'";
		}
		return getHibernateTemplate().find(queryString);
		
	}
	
	
	public List<?> findListByProperty(String entity,String propertyName,String value,String other){
		try {
			String queryString = null;
			queryString = "from "+entity+" as model where "
					+ propertyName + " =? " +other;
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			// log.error("find by property name failed", re);
			throw re;
		}
	}
	public List<?> findListByProperty(String entity,String propertyName,int value,String other){
		try {
			String queryString = null;
			queryString = "from "+entity+" as model where "
					+ propertyName + " =? " +other;
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			// log.error("find by property name failed", re);
			throw re;
		}
	}
    /** 
     * ʹ��sql�����в�ѯ���� 
     * @param sql 
     * @return 
     */  
    @SuppressWarnings("rawtypes")
	public List queryWithSql(final String sql){  
        List list = getHibernateTemplate().executeFind(new HibernateCallback() {  
            public Object doInHibernate(Session session) throws HibernateException,  
                    SQLException {  
                Query query = session.createSQLQuery(sql);    
                List list = query.list();  
                return list;  
            }  
        });  
        return list;  
    }  
    
    @Resource
    public void setSessionFactory0(SessionFactory sessionFactory){  
    	super.setSessionFactory(sessionFactory);  
    }

	

}
