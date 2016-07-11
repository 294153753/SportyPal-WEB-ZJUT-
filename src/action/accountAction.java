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
	private List friends = new ArrayList();//���������Ϣ���
	private List rst = new ArrayList();//�����ѯ���ѽ��
	private List addRst = new ArrayList();//����������Ϣ
	private List agreeRst = new ArrayList();//ͬ�����������Ϣ
	private List refuseRst = new ArrayList();//�ܾ�����������Ϣ
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
	
	public String login(){ //��¼
		if(accountService.login(account)){
			session.put("login", account.getUsername());
			messageSize();
			return "success";
		}
		else {
			addActionMessage("�û������������");
			return "fail";
		}
	}

	public String logout(){ //�ǳ�
		session.put("login", null);
		return "success";
	}

	public String register(){ //ע��
		account_detail.setUsername(account.getUsername());
		if(accountService.register(account,  account_detail)){
			return "success";
		}
		else {
			return "fail";
		}
	}

	public String checkExist(){//����û��Ƿ��Ѵ���
		if(accountService.checkExist(username)){
			message = "success";
		}
		else message = "fail";
		return "jsonmsg";
	}

	public String showInfo(){//��ʾ�˻���Ϣ
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		messageSize();
		if(!accountService.checkExist(u)){
			account_detail = accountService.showInfo(u);
			return "success";
		}
		return null;
	}

	public String changePassword(){//�޸�����
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		String password = account.getPassword();
		accountService.changePassword(u, password);
		addActionMessage("�޸ĳɹ��������µ�¼��");
		session.put("login", null);
		return "success";
	}

	public String changeDetail(){//�޸���ϸ����
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		account_detail accd = accountService.showInfo(u);
		account_detail.setUsername(u);
		if("��ѡ��".equals(account_detail.getCity())){
			account_detail.setCity(accd.getCity());
		}
		if("��ѡ��".equals(account_detail.getProvince())){
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

	public String showFriends(){ //��ʾ���к���
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		friends = accountService.showFriends(u);
		return "success";
	}

	public String deleteFriend(){ // ɾ������
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		accountService.deleteFriend(u, username);
		return "success";
	}

	public String search(){ //���Һ���
		if("��ѡ��".equals(account_detail.getProvince()) || 
				"��ѡ������ʡ".equals(account_detail.getProvince())){
			account_detail.setProvince("");
		}
		if("��ѡ��".equals(account_detail.getCity()) ||
				"��ѡ�����ڳ���".equals(account_detail.getCity())){
			account_detail.setCity("");
		}
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		rst = accountService.search(u, account_detail.getUsername(), 
				account_detail.getProvince(), account_detail.getCity());
		if(rst.size() != 0){
			for(int i = 0; i < rst.size(); i++){
				if(accountService.checkFriend(u, ((account_detail)rst.get(i)).getUsername())){
					((account_detail)rst.get(i)).setSymbol("true"); //�����ں��ѹ�ϵ�������
				}
				else ((account_detail)rst.get(i)).setSymbol("false");
			}
			return "success";
		}
		else{
			addActionMessage("�޽����");
			return "fail";
		}
	}

	public String addFriend(){ //��Ӻ���
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		add_friend fri = new add_friend();
		fri.setUsername(u);
		fri.setFri_username(username);
		fri.setRst("�ȴ���֤");
		if(accountService.addFriend(fri)){
			message = "success";
		}
		else message = "fail";
		return "jsonmsg";
	}

	public String recommend(){ //�Ƽ�����
		String u = (session.get("login")).toString();//��ǰ��¼�û���
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
			List rr = new ArrayList(); //���������
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

	public void adfMessage(){ //��ʾ����������Ϣ
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		addRst = accountService.search(u, "�ȴ���֤");
	}
	
	public void agreeMessage(){ //��ʾͬ�����������Ϣ
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		agreeRst = accountService.searchRst(u, "ͬ��");
	}

	public void refuseMessage(){ //��ʾ�ܾ�����������Ϣ
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		refuseRst = accountService.searchRst(u, "�Է��ܾ�");
	}

	public void messageSize(){ //���󼰻ظ���Ϣ����
		adfMessage();
		agreeMessage();
		refuseMessage();
		addRstSize = addRst.size() + refuseRst.size() + agreeRst.size();
	}

	public String agreeAddFriend(){ //ͬ����Ӻ���
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		friend fri1 = new friend();
		fri1.setUsername(u);
		fri1.setFri_username(username);
		friend fri2 = new friend();
		fri2.setUsername(username);
		fri2.setFri_username(u);
		if(accountService.addFriend(fri1) && accountService.addFriend(fri2)){
			if(accountService.changeAddFriRst(u, username, "ͬ��")){
				message = "success";
				messageSize();
			}
		}
		else message = "fail";
		return "jsonmsg";
	}

	public String refuseAddFriend(){ //�ܾ���Ӻ���
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		if(accountService.changeAddFriRst(u, username, "�Է��ܾ�")){
			message = "success";
			messageSize();
		}
		else message = "fail";
		return "jsonmsg";
	}

	public String deleteRst(){ //ɾ��������Ϣ
		String u = (session.get("login")).toString();//��ǰ��¼�û���
		if(accountService.deleteReq(u, username, password)){ //�˴�����Ϣrst��ŵ�password�����ٱ�������
			message = "success";
			messageSize();
		}
		else message = "fail";
		return "jsonmsg";
	}
	
	public String accountInfo(){//��ʾ�����û���Ϣ
		messageSize();
		if(!accountService.checkExist(username)){
			account_detail = accountService.showInfo(username);
			contentList = trendService.showSptArts(username);
			return "success";
		}
		return null;
	}
}
