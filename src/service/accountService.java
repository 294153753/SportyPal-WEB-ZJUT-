package service;

import java.util.ArrayList;
import java.util.List;

import po.account;
import po.account_detail;
import po.add_friend;
import po.friend;

import dao.accountDAOInterface;

public class accountService implements accountServiceInterface {
	accountDAOInterface accountDAO;
	public accountDAOInterface getAccountDAO() {
		return accountDAO;
	}
	public void setAccountDAO(accountDAOInterface accountDAO) {
		this.accountDAO = accountDAO;
	}
	public boolean login(account acc) {
		List rst;
		String hql  = "from account as obj where obj.username='" + acc.getUsername()
				+ "' and obj.password='" + acc.getPassword() + "'";
		try{
			rst = accountDAO.findByHql(hql);
		}
		catch(Exception e){
			return false;
		}
		if(rst.isEmpty()){
			return false;
		}
		else return true;
	}
	public boolean register(account acc, account_detail accd){
		String hql  = "from account as obj where obj.username='" + acc.getUsername() + "'";
		List rst = accountDAO.findByHql(hql);
		if(rst.isEmpty()){
			try{
				accountDAO.register(acc, accd);
				return true;
			} catch(Exception e){
				return false;
			}
		}
		else return false;
	}
	public boolean checkExist(String username) {
		List rst;
		String hql  = "from account as obj where obj.username='" + username
				+ "'";
		try{
			rst = accountDAO.findByHql(hql);
		}
		catch(Exception e){
			return false;
		}
		if(rst.isEmpty()){
			return true;
		}
		else return false;
	}
	public account_detail showInfo(String username){
		List rst;
		String hql  = "from account_detail as obj where obj.username='" + username
				+ "'";
		rst = accountDAO.findByHql(hql);
		return (account_detail)(rst.get(0));
	}
	public boolean changePassword(String username, String password){
		String hql = "update account obj set obj.password='"+password+"'"+
				" where obj.username='"+username+"'";
		try{
			accountDAO.update(hql);
			return true;
		}catch(Exception e){
			return false;
		}
	}
	public boolean changeDetail(account_detail accd){
		String hql = "update account_detail obj set obj.city='"+accd.getCity()+
				"',obj.email='"+accd.getEmail()+"',obj.IDCard='"+accd.getIDCard()+
				"',obj.name='"+accd.getName()+"',obj.phone='"+accd.getPhone()+
				"',obj.picture='"+accd.getPicture()+"',obj.province='"+accd.getProvince()+
				"',obj.sex='"+accd.getSex()+"' where obj.username='"+accd.getUsername()+"'";
		try{
			accountDAO.update(hql);
			return true;
		}catch(Exception e){
			return false;
		}
	}
	public List showFriends(String username){
		List rst;
		String hql = "select accd from account_detail as accd,friend as f" +
				" where f.fri_username=accd.username and f.username='" + username+"'";
		rst = accountDAO.findByHql(hql);
		return rst;
	}
	public void deleteFriend(String username, String fri_username){
		String hql = "delete friend obj where username='" + username +"'" +
				" and fri_username='"+ fri_username +"'";
		try{
			accountDAO.update(hql);
		}catch(Exception e){
			System.out.println("Function deleteFriend Error!");
		}
	}
	public List search(String u, String username, String province, String city){
		List rst;
		String hql = "from account_detail as obj where obj.username!='" + u +"'";
		if(username != null || !"".equals(username)){
			hql = hql + " and ";
			hql = hql + "obj.username like '%" + username + "%'";
		}
		if(!"".equals(province)){
			hql = hql + " and ";
			hql = hql + "obj.province='" + province + "'";
		}
		if(!"".equals(city)){
			hql = hql + " and ";
			hql = hql + "obj.city='" + city + "'";
		}
		rst = accountDAO.findByHql(hql);
		return rst;
	}
	public boolean checkFriend(String username, String fri_username){ //检查是否已为好友
		List rst;
		String hql  = "from friend as obj where obj.username='" + username
				+ "' and obj.fri_username='"+ fri_username +"'";
		try{
			rst = accountDAO.findByHql(hql);
		}
		catch(Exception e){
			return false;
		}
		if(rst.isEmpty()){
			return true;	
		}
		else return false;
	}
	public boolean addFriend(add_friend fri){
		List rst;
		String hql  = "from add_friend as obj where obj.username='" + fri.getUsername()
				+ "' and obj.fri_username='"+ fri.getFri_username() +"' and rst='"+ fri.getRst() +"'";
		try{
			rst = accountDAO.findByHql(hql);
			if(rst.size() == 0){
				accountDAO.addFriend(fri);
			}
			return true;
		} catch(Exception e){
			return false;
		}
	}
	public List search(String username, String message){
		List rst;
		String hql  = "from add_friend as obj where obj.fri_username='" + username
				+"' and rst='"+ message +"'";
		rst = accountDAO.findByHql(hql);
		return rst;
	}
	public List searchRst(String username, String message){
		List rst;
		String hql  = "from add_friend as obj where username='" + username
				+"' and rst='"+ message +"'";
		rst = accountDAO.findByHql(hql);
		return rst;
	}
	public boolean addFriend(friend fri){
		try{
			accountDAO.addFriend(fri);
			return true;
		} catch(Exception e){
			return false;
		}
	}
	public boolean deleteReq(String username, String fri_username, String msg){
		String hql = "delete add_friend obj where username='" + username +"'" +
				" and fri_username='"+ fri_username +"' and rst='" + msg + "'";
		if("等待验证".equals(msg)){
			hql = "delete add_friend obj where username='" + fri_username +"'" +
					" and fri_username='"+ username +"' and rst='" + msg + "'";
		}
		try{
			accountDAO.update(hql);
			return true;
		}catch(Exception e){
			return false;
		}
	}
	public boolean changeAddFriRst(String username, String fri_username, String msg){
		String hql = "update add_friend obj set obj.rst='"+ msg +"' where obj.username='"+ fri_username + "'"
				+" and obj.fri_username='"+ username +"' and obj.rst='等待验证'";
		try{
			accountDAO.update(hql);
			return true;
		}catch(Exception e){
			return false;
		}
	}
}
