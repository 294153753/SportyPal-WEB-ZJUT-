package service;

import po.account;
import po.account_detail;
import po.add_friend;
import po.friend;

import java.util.List;

public interface accountServiceInterface {
	public boolean login(account acc);
	public boolean register(account acc, account_detail accd);
	public boolean checkExist(String username);
	public account_detail showInfo(String username);
	public boolean changePassword(String username,String password);
	public boolean changeDetail(account_detail accd);
	public List showFriends(String username);
	public void deleteFriend(String username, String fri_username); 
	public List search(String u, String username, String province, String city);//查询好友
	public boolean checkFriend(String username, String fri_username); //检查是否已为好友
	public boolean addFriend(add_friend fri);//好友请求
	public List search(String username, String message); //被添加方查询好友请求
	public boolean addFriend(friend fri);//添加好友
	public boolean deleteReq(String username, String fri_username, String msg); //删除添加好友请求
	public boolean changeAddFriRst(String username, String fri_username, String msg); //修改好友请求rst
	public List searchRst(String username, String message); //添加方查询好友请求
	
}
