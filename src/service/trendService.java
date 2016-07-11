package service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import po.account_detail;
import po.comment;
import po.content;
import po.content_statistics;
import po.account_detail;
import po.distance;
import po.likes;
import dao.trendDAOInterface;

public class trendService implements trendServiceInterface{
	trendDAOInterface trendDAO;
	public trendDAOInterface getTrendDAO() {
		return trendDAO;
	}
	public void setTrendDAO(trendDAOInterface trendDAO) {
		this.trendDAO = trendDAO;
	}

	public void release(content content){
		trendDAO.release(content);
	}

	public List showTrend(String u){
		List rst;
		String hql = "select distinct con from content as con,friend as f,content_statistics as cs where (con.account_detail.username='"+ u 
				+ "' or (f.username='" + u 
				+ "' and con.account_detail.username=f.fri_username)) and cs.id=con.id"
				+  " order by time desc";
		rst = trendDAO.findByHql(hql);
		return rst;
	}
	public List showSptArts(String u){
		List rst;
		String hql = "from content as con where con.account_detail.username='"+ u
				+  "' and con.routeHref != NULL order by time desc";
		rst = trendDAO.findByHql(hql);
		return rst;
	}
	public boolean checkLikes(String username, int id){
		List rst;
		String hql = "from likes as obj where obj.username='" + username + "'"
				+ " and obj.id=" + id;
		rst = trendDAO.findByHql(hql);
		if(rst.isEmpty()){
			return true; //未点赞
		}
		else return false;
	}
	public void insertLikes(String username, int id){
		likes temp = new likes();
		temp.setId(id);
		temp.setUsername(username);
		trendDAO.insertLikes(temp);
		String hql = "update content_statistics obj set obj.likes=obj.likes+1 where obj.id=" + id;
		trendDAO.update(hql);
	}
	public void deleteLikes(String username, int id){
		String hql = "delete likes obj where obj.username='" + username + "'"
				+ " and obj.id=" + id;
		trendDAO.update(hql);
		hql = "update content_statistics obj set obj.likes=obj.likes-1 where obj.id=" + id;
		trendDAO.update(hql);
	}
	public content searchTrendById(int id){
		content rst;
		String hql = "from content as obj where obj.id=" + id;
		rst = (content)(trendDAO.findByHql(hql).get(0));
		return rst;
	}
	public void insertForward(int id){
		String hql = "update content_statistics obj set obj.forward=obj.forward+1 where obj.id=" + id;
		trendDAO.update(hql);
	}
	public void insertComment(comment comment){
		trendDAO.insertComment(comment);
	}
	public List showComment(int content_id){
		List rst;
		String hql = "from comment as obj where obj.content_id=" + content_id
				+"and parent_id=0 order by time desc";
		rst = trendDAO.findByHql(hql);
		return rst;
	}
	public List showSportsData(String u){
		SimpleDateFormat da = new SimpleDateFormat("yyyy-MM-dd"); //格式化时间
		Calendar c = Calendar.getInstance();
		String date = da.format(c.getTime());
		List rst = new ArrayList();
		for(int i = 0; i < 7; i++){
			distance temp = new distance();
			String hql = "from distance as obj where obj.date='" + date + "' and obj.username='" + u + "'";
			if(trendDAO.findByHql(hql).isEmpty()){
				temp.setDate(date);
				temp.setDistance(0);
			}
			else{
				temp = (distance)(trendDAO.findByHql(hql).get(0));
			}
			c.add(Calendar.DAY_OF_MONTH, -1);//取当前日期的前i天.
			date = da.format(c.getTime());
			rst.add(temp);
		}
		return rst;
	}
	public List reComment(int symbol, int content_id){
		List rst;
		String hql = "from comment as obj where obj.content_id=" + content_id
				+"and obj.symbol=" + symbol + " order by time desc";
		rst = trendDAO.findByHql(hql);
		return rst;
	}
}
