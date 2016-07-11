package dao;
import java.util.List;

import po.account;
import po.account_detail;
import po.add_friend;
import po.friend;

public interface accountDAOInterface {
	public List findByHql(String hql);
	public void register(account acc, account_detail accd);
	public void update(String hql);
	public void addFriend(add_friend fri);
	public void addFriend(friend fri);
}
