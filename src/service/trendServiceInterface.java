package service;

import java.util.List;

import po.comment;
import po.content;
import po.content_statistics;

public interface trendServiceInterface {
	public void release(content content);
	public List showTrend(String u);
	public List showSptArts(String u);
	public boolean checkLikes(String username, int id);
	public void insertLikes(String username, int id);
	public void deleteLikes(String username, int id);
	public content searchTrendById(int id);
	public void insertForward(int id);
	public void insertComment(comment comment);
	public List showComment(int content_id);
	public List showSportsData(String u);
	public List reComment(int symbol, int content_id);
}
