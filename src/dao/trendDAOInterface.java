package dao;

import java.util.List;

import po.comment;
import po.content;
import po.content_statistics;
import po.likes;

public interface trendDAOInterface {
	public List findByHql(String hql);
	public void update(String hql);
	public void release(content content);
	public void insertLikes(likes obj);
	public void insertComment(comment obj);
}
