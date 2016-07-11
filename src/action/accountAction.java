package action;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.accountDAO;

import po.account;
import po.account_detail;
import po.add_friend;
import po.friend;
import service.accountServiceInterface;
import service.trendServiceInterface;

public class accountAction extends ActionSupport {
	private String username;
	private String password;
	private String message;
	private List friends = new ArrayList();//保存好友信息结果
	private List rst = new ArrayList();//保存查询好友结果
	private List addRst = new ArrayList();//好友请求消息
	private List agreeRst = new ArrayList();//同意好友请求消息
	private List refuseRst = new ArrayList();//拒绝好友请求消息
	private static int addRstSize;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public List getFriends() {
		return friends;
	}
	public void setFriends(List friends) {
		this.friends = friends;
	}
	public List getRst() {
		return rst;
	}
	public void setRst(List rst) {
		this.rst = rst;
	}
	public List getAddRst() {
		return addRst;
	}
	public void setAddRst(List addRst) {
		this.addRst = addRst;
	}
	public List getAgreeRst() {
		return agreeRst;
	}
	public void setAgreeRst(List agreeRst) {
		this.agreeRst = agreeRst;
	}
	public List getRefuseRst() {
		return refuseRst;
	}
	public void setRefuseRst(List refuseRst) {
		this.refuseRst = refuseRst;
	}
	public int getAddRstSize() {
		return addRstSize;
	}
	public void setAddRstSize(int addRstSize) {
		this.addRstSize = addRstSize;
	}
	private account account;
	private account_detail account_detail;
	private List contentList;
	private accountServiceInterface accountService;
	private trendServiceInterface trendService;
	private Map session = ActionContext.getContext().getSession();
	public account getAccount() {
		return account;
	}

	public void setAccount(account account) {
		this.account = account;
	}
	public account_detail getAccount_detail() {
		return account_detail;
	}
	
	public List getContentList() {
		return contentList;
	}
	public void setContentList(List contentList) {
		this.contentList = contentList;
	}
	
	public void setAccount_detail(account_detail account_detail) {
		this.account_detail = account_detail;
	}

	public accountServiceInterface getAccountService() {
		return accountService;
	}
	public void setAccountService(accountServiceInterface accountService) {
		this.accountService = accountService;
	}
	
	public trendServiceInterface getTrendService() {
		return trendService;
	}
	public void setTrendService(trendServiceInterface trendService) {
		this.trendService = trendService;
	}
	
	public String login(){ //登录
		if(accountService.login(account)){
			session.put("login", account.getUsername());
			messageSize();
			return "success";
		}
		else {
			addActionMessage("用户名或密码错误！");
			return "fail";
		}
	}

	public String logout(){ //登出
		session.put("login", null);
		return "success";
	}

	public String register(){ //注册
		account_detail.setUsername(account.getUsername());
		if(accountService.register(account,  account_detail)){
			return "success";
		}
		else {
			return "fail";
		}
	}

	public String checkExist(){//检查用户是否已存在
		if(accountService.checkExist(username)){
			message = "success";
		}
		else message = "fail";
		return "jsonmsg";
	}

	public String showInfo(){//显示账户信息
		String u = (session.get("login")).toString();//当前登录用户名
		messageSize();
		if(!accountService.checkExist(u)){
			account_detail = accountService.showInfo(u);
			return "success";
		}
		return null;
	}

	public String changePassword(){//修改密码
		String u = (session.get("login")).toString();//当前登录用户名
		String password = account.getPassword();
		accountService.changePassword(u, password);
		addActionMessage("修改成功，请重新登录！");
		session.put("login", null);
		return "success";
	}

	public String changeDetail(){//修改详细资料
		String u = (session.get("login")).toString();//当前登录用户名
		account_detail accd = accountService.showInfo(u);
		account_detail.setUsername(u);
		if("请选择".equals(account_detail.getCity())){
			account_detail.setCity(accd.getCity());
		}
		if("请选择".equals(account_detail.getProvince())){
			account_detail.setProvince(accd.getProvince());
		}
		if("".equals(account_detail.getSex()) || account_detail.getSex() == null){
			account_detail.setSex(accd.getSex());
		}
		if("".equals(account_detail.getEmail()) || account_detail.getEmail() == null){
			account_detail.setEmail(accd.getEmail());
		}
		if("".equals(account_detail.getIDCard()) || account_detail.getIDCard() == null){
			account_detail.setIDCard(accd.getIDCard());
		}
		if("".equals(account_detail.getName()) || account_detail.getName() == null){
			account_detail.setName(accd.getName());
		}
		if("".equals(account_detail.getPhone()) || account_detail.getPhone() == null){
			account_detail.setPhone(accd.getPhone());
		}
		if("".equals(account_detail.getPicture()) || account_detail.getPicture() == null){
			account_detail.setPicture(accd.getPicture());
		}
		if(accountService.changeDetail(account_detail)){
			return "success";
		}
		return null;
	}

	public String showFriends(){ //显示所有好友
		String u = (session.get("login")).toString();//当前登录用户名
		friends = accountService.showFriends(u);
		return "success";
	}

	public String deleteFriend(){ // 删除好友
		String u = (session.get("login")).toString();//当前登录用户名
		accountService.deleteFriend(u, username);
		return "success";
	}

	public String search(){ //查找好友
		if("请选择".equals(account_detail.getProvince()) || 
				"请选择所在省".equals(account_detail.getProvince())){
			account_detail.setProvince("");
		}
		if("请选择".equals(account_detail.getCity()) ||
				"请选择所在城市".equals(account_detail.getCity())){
			account_detail.setCity("");
		}
		String u = (session.get("login")).toString();//当前登录用户名
		rst = accountService.search(u, account_detail.getUsername(), 
				account_detail.getProvince(), account_detail.getCity());
		if(rst.size() != 0){
			for(int i = 0; i < rst.size(); i++){
				if(accountService.checkFriend(u, ((account_detail)rst.get(i)).getUsername())){
					((account_detail)rst.get(i)).setSymbol("true"); //不存在好友关系，可添加
				}
				else ((account_detail)rst.get(i)).setSymbol("false");
			}
			return "success";
		}
		else{
			addActionMessage("无结果！");
			return "fail";
		}
	}

	public String addFriend(){ //添加好友
		String u = (session.get("login")).toString();//当前登录用户名
		add_friend fri = new add_friend();
		fri.setUsername(u);
		fri.setFri_username(username);
		fri.setRst("等待验证");
		if(accountService.addFriend(fri)){
			message = "success";
		}
		else message = "fail";
		return "jsonmsg";
	}

	public String recommend(){ //推荐好友
		String u = (session.get("login")).toString();//当前登录用户名
		account_detail myInfo = accountService.showInfo(u);
		rst = accountService.search(u, "", myInfo.getProvince(), myInfo.getCity());
		for(int i = 0; i < rst.size(); i++){
			if((((account_detail)rst.get(i)).getUsername()).equals(u)){
				rst.remove(i);
				i = i - 1;
			}
			else if(!accountService.checkFriend(u, ((account_detail)rst.get(i)).getUsername())){
				rst.remove(i);
				i = i - 1;
			}
		}
		if(rst.size() < 6){
			rst = accountService.search(u, "", myInfo.getProvince(), "");
			for(int i = 0; i < rst.size(); i++){
				if((((account_detail)rst.get(i)).getUsername()).equals(u)){
					rst.remove(i);
					i = i - 1;
				}
				else if(!accountService.checkFriend(u, ((account_detail)rst.get(i)).getUsername())){
					rst.remove(i);
					i = i - 1;
				}
			}
		}
		if(rst.size() > 6) {
			List rr = new ArrayList(); //保存随机数
			int i;
			Random  r = new Random();
			while(rr.size() < 6){
				i = r.nextInt(rst.size());
				if(!rr.contains(i)){
					rr.add(i);
				}
			}
			List f = new ArrayList();
			for(int j = 0; j < rr.size(); j++){
				f.add(rst.get((Integer)(rr.get(j))));
			}
			rst = f;
		}
		return "success";
	}

	public void adfMessage(){ //显示好友请求消息
		String u = (session.get("login")).toString();//当前登录用户名
		addRst = accountService.search(u, "等待验证");
	}
	
	public void agreeMessage(){ //显示同意好友请求消息
		String u = (session.get("login")).toString();//当前登录用户名
		agreeRst = accountService.searchRst(u, "同意");
	}

	public void refuseMessage(){ //显示拒绝好友请求消息
		String u = (session.get("login")).toString();//当前登录用户名
		refuseRst = accountService.searchRst(u, "对方拒绝");
	}

	public void messageSize(){ //请求及回复消息数量
		adfMessage();
		agreeMessage();
		refuseMessage();
		addRstSize = addRst.size() + refuseRst.size() + agreeRst.size();
	}

	public String agreeAddFriend(){ //同意添加好友
		String u = (session.get("login")).toString();//当前登录用户名
		friend fri1 = new friend();
		fri1.setUsername(u);
		fri1.setFri_username(username);
		friend fri2 = new friend();
		fri2.setUsername(username);
		fri2.setFri_username(u);
		if(accountService.addFriend(fri1) && accountService.addFriend(fri2)){
			if(accountService.changeAddFriRst(u, username, "同意")){
				message = "success";
				messageSize();
			}
		}
		else message = "fail";
		return "jsonmsg";
	}

	public String refuseAddFriend(){ //拒绝添加好友
		String u = (session.get("login")).toString();//当前登录用户名
		if(accountService.changeAddFriRst(u, username, "对方拒绝")){
			message = "success";
			messageSize();
		}
		else message = "fail";
		return "jsonmsg";
	}

	public String deleteRst(){ //删除请求消息
		String u = (session.get("login")).toString();//当前登录用户名
		if(accountService.deleteReq(u, username, password)){ //此处将消息rst存放到password，减少变量数量
			message = "success";
			messageSize();
		}
		else message = "fail";
		return "jsonmsg";
	}
	
	public String accountInfo(){//显示其他用户信息
		messageSize();
		if(!accountService.checkExist(username)){
			account_detail = accountService.showInfo(username);
			contentList = trendService.showSptArts(username);
			return "success";
		}
		return null;
	}
}
