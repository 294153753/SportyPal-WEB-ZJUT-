package dao;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import po.account;
import po.account_detail;
import po.add_friend;
import po.friend;

public class accountDAO extends BaseHibernateDAO implements accountDAOInterface{
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
	public void register(account acc, account_detail accd){
		Session session = getSession();
		Transaction tran = session.beginTransaction();
		try {
			session.save(acc);
			session.save(accd);
			tran.commit();
		} catch (RuntimeException re) {
			if(tran != null) tran.rollback();
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
	public void addFriend(add_friend fri){
		Session session = getSession();
		Transaction tran = session.beginTransaction();
		try {
			session.save(fri);
			tran.commit();
		} catch (RuntimeException re) {
			if(tran != null) tran.rollback();
			throw re;
		}
		finally{
			session.close();
		}
	}
	public void addFriend(friend fri){
		Session session = getSession();
		Transaction tran = session.beginTransaction();
		try {
			session.save(fri);
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
