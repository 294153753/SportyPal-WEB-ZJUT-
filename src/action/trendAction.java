package action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import service.trendServiceInterface;
import service.accountServiceInterface;
import com.opensymphony.xwork2.ActionContext;

import po.account_detail;
import po.content;
import po.comment;
import po.content_statistics;

public class trendAction {
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //��ʽ��ʱ��
	private List contentList;
	private List reCommentList;
	private content content;
	private comment comment;
	private String message;
	JSONArray jsonMessage;
	private int id;
	private int commentid;
	private int content_id;
	private int symbol;//po.comment
	private String commentString;
	public List getContentList() {
		return contentList;
	}
	public void setContentList(List contentList) {
		this.contentList = contentList;
	}
	public List getReCommentList() {
		return reCommentList;
	}
	public void setReCommentList(List reCommentList) {
		this.reCommentList = reCommentList;
	}
	public content getContent() {
		return content;
	}
	public void setContent(content content) {
		this.content = content;
	}
	public comment getComment() {
		return comment;
	}
	public void setComment(comment comment) {
		this.comment = comment;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public JSONArray getJsonMessage() {
		return jsonMessage;
	}
	public void setJsonMessage(JSONArray jsonMessage) {
		this.jsonMessage = jsonMessage;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCommentid() {
		return commentid;
	}
	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}
	public int getContent_id() {
		return content_id;
	}
	public void setContent_id(int content_id) {
		this.content_id = content_id;
	}
	public int getSymbol() {
		return symbol;
	}
	public void setSymbol(int symbol) {
		this.symbol = symbol;
	}
	public String getCommentString() {
		return commentString;
	}
	public void setCommentString(String commentString) {
		this.commentString = commentString;
	}

	private trendServiceInterface trendService;
	private accountServiceInterface accountService;
	private Map session = ActionContext.getContext().getSession();
	public trendServiceInterface getTrendService() {
		return trendService;
	}
	public void setTrendService(trendServiceInterface trendService) {
		this.trendService = trendService;
	}
	public accountServiceInterface getAccountService() {
		return accountService;
	}
	public void setAccountService(accountServiceInterface accountService) {
		this.accountService = accountService;
	}

	public String release(){ //������̬
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		if(!"".equals(content.getContent())){
			content.setTime(df.format(new Date()));
			account_detail accd = new account_detail();
			accd.setUsername(u);
			content_statistics cs = new content_statistics();
			cs.setComment(0);
			cs.setForward(0);
			cs.setLikes(0);
			content.setContent_statistics(cs);
			content.setAccount_detail(accd);
			trendService.release(content);
		}
		return "success";
	}

	public String showTrend(){ //��ʾ��̬��Ϣ
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		contentList = trendService.showTrend(u);
		for(int i = 0; i < contentList.size(); i++){
			List temp = trendService.showComment(((content)contentList.get(i)).getId());
			((content)(contentList.get(i))).setCommentList(temp);
			if(trendService.checkLikes(u, ((content)contentList.get(i)).getId())){
				((content)contentList.get(i)).setSymbol("true"); //���Ե���
			}
			else ((content)contentList.get(i)).setSymbol("false");
		}
		return "success";
	}
	
	public String showSptArts(){ //�ҵ��˶���־
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		contentList = trendService.showSptArts(u);
		return "success";
	}

	public String checkLikes(){ //�ж��Ƿ��ѵ���
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		if(trendService.checkLikes(u, id)){
			message = "success";
		}
		else message = "fail";
		return "jsonmsg";
	}

	public String insertLikes(){ //����
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		if(trendService.checkLikes(u, id)){
			trendService.insertLikes(u, id);
			message = "success";
		}
		else message = "fail";
		return "jsonmsg";
	}

	public String deleteLikes(){ //ȡ������
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		if(!trendService.checkLikes(u, id)){
			trendService.deleteLikes(u, id);
			message = "success";
		}
		else message = "fail";
		return "jsonmsg";
	}

	public String forward(){ //ת��
		content = trendService.searchTrendById(content.getId());
		trendService.insertForward(content.getId()); //�޸�content_statistics��forward����
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		content_statistics content_sta = new content_statistics();
		account_detail accd = new account_detail();
		accd.setUsername(u);
		content.setAccount_detail(accd);
		content.setTime(df.format(new Date()));
		content.setContent_statistics(content_sta);
		if(!comment.getComment().equals("")){
			comment.setAccount_detail(accd);
			comment.setContent_id(content.getId());
			comment.setParent_id(0);
			comment.setTime(df.format(new Date()));
			trendService.insertComment(comment);
		}
		trendService.release(content);
		return "success";
	}

	public String comment(){ //����
		account_detail accd = new account_detail();
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		accd.setUsername(u);
		comment tempComment = new comment();
		tempComment.setContent_id(commentid);
		tempComment.setParent_id(0);
		tempComment.setTime(df.format(new Date()));
		tempComment.setComment(commentString);
		tempComment.setAccount_detail(accd);
		trendService.insertComment(tempComment);
		message = "success";
		return "jsonmsg";
	} 

	public String statistic(){ //���ݷ���
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		List temp = trendService.showSportsData(u);
		JSONArray jsarry = JSONArray.fromObject(temp);
		jsonMessage = jsarry;
		return "success";
	}

	public String reComment(){ //��ʾ�ظ�
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		List temp = trendService.reComment(symbol, content_id);
		JSONArray jsarry = JSONArray.fromObject(temp);
		jsonMessage = jsarry;
		return "success";
	}
	public String rrecomment(){ //�ظ�
		account_detail accd = new account_detail();
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		accd.setUsername(u);
		comment tempComment = new comment();
		tempComment.setContent_id(content_id);
		tempComment.setParent_id(0);
		tempComment.setTime(df.format(new Date()));
		tempComment.setComment(commentString);
		tempComment.setAccount_detail(accd);
		tempComment.setSymbol(symbol);
		tempComment.setParent_id(1);
		trendService.insertComment(tempComment);
		message = "success";
		return "jsonmsg";
	}
}
