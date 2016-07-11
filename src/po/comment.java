package po;

import java.util.List;

public class comment {
	private int id;
	private account_detail account_detail;
	private String time;
	private int content_id;
	private String comment;
	private int parent_id;
	private int symbol;
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
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getContent_id() {
		return content_id;
	}
	public void setContent_id(int content_id) {
		this.content_id = content_id;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getParent_id() {
		return parent_id;
	}
	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}
	public int getSymbol() {
		return symbol;
	}
	public void setSymbol(int symbol) {
		this.symbol = symbol;
	}
}
