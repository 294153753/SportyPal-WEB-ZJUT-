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
	public List search(String u, String username, String province, String city);//��ѯ����
	public boolean checkFriend(String username, String fri_username); //����Ƿ���Ϊ����
	public boolean addFriend(add_friend fri);//��������
	public List search(String username, String message); //����ӷ���ѯ��������
	public boolean addFriend(friend fri);//��Ӻ���
	public boolean deleteReq(String username, String fri_username, String msg); //ɾ����Ӻ�������
	public boolean changeAddFriRst(String username, String fri_username, String msg); //�޸ĺ�������rst
	public List searchRst(String username, String message); //��ӷ���ѯ��������
	
}
