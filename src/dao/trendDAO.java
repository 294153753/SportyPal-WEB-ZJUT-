package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import po.comment;
import po.content;
import po.content_statistics;
import po.likes;

public class trendDAO extends BaseHibernateDAO implements trendDAOInterface {
	public List findByHql(String hql){
		Session session = null;
		try {
			session = getSession();
			Query queryObject = session.createQuery(hql);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
		finally{
			session.close();
		}
	}
	public void update(String hql){
		Session session = getSession();
		Transaction tran = session.beginTransaction();
		try{
			Query queryObject = session.createQuery(hql);
			queryObject.executeUpdate();
			tran.commit();
		}catch (RuntimeException re) {
			if(tran != null) tran.rollback();
			throw re;
		}
		finally{
			session.close();
		}
	}
	public void release(content content){
		Session session = getSession();
		Transaction tran = session.beginTransaction();
		try {
			session.save(content);
			tran.commit();
		} catch (RuntimeException re) {
			if(tran != null) tran.rollback();
			throw re;
		}
		finally{
			session.close();
		}
	}
	public void insertLikes(likes obj){
		Session session = getSession();
		Transaction tran = session.beginTransaction();
		try {
			session.save(obj);
			tran.commit();
		} catch (RuntimeException re) {
			if(tran != null) tran.rollback();
			throw re;
		}
		finally{
			session.close();
		}
	}
	public void insertComment(comment obj){
		Session session = getSession();
		Transaction tran = session.beginTransaction();
		try {
			session.save(obj);
			tran.commit();
		} catch (RuntimeException re) {
			if(tran != null) tran.rollback();
			throw re;
		}
		finally{
			session.close();
		}
	}
}
