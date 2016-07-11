package po;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class content {
	private int id;
	private account_detail account_detail;;
	private content_statistics content_statistics;
	private String content;
	private String routeHref;
	private String time;
	private String symbol;
	private List commentList;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public account_detail getAccount_detail() {
		return account_detail;
	}
	public void setAccount_detail(account_detail account_detail) {
		this.account_detail = account_detail;
	}
	public content_statistics getContent_statistics() {
		return content_statistics;
	}
	public void setContent_statistics(content_statistics content_statistics) {
		this.content_statistics = content_statistics;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRouteHref() {
		return routeHref;
	}
	public void setRouteHref(String routeHref) {
		this.routeHref = routeHref;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSymbol() {
		return symbol;
	}
	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}
	public List getCommentList() {
		return commentList;
	}
	public void setCommentList(List commentList) {
		this.commentList = commentList;
	}
}
