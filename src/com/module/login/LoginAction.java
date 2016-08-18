package com.module.login;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.http.client.ClientProtocolException;
import org.json.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.core.BaseAction;

import com.core.dao.UtilDAO;
import com.core.utils.MyHttpClient;
import com.model.User;

@Component
@Scope("prototype")
public class LoginAction extends BaseAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3848547849461135411L;

	private User user;
	
	@Resource
	private UtilDAO utilDAO;
	
	private String resultObj;
	
	@SuppressWarnings("unchecked")
	public String login(){
		try {
		//	yzm();
			List<User> users=(List<User>) utilDAO.findListByProperty("User", "userName", 
					user.getUserName(), "");
			System.out.println(user.getUserName()+"  ssss");
			if (users.size()==0) {
				System.out.println("用户名错误");
				writeJSON("300", "用户名错误",null);
			}
			else if (users.get(0).getPassword().equals(user.getPassword())) {
				user=users.get(0);
				visitRemote(); 

			}else {
				System.out.println("密码错误");
				writeJSON("300", "密码错误",null);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
	private void yzm() {
		 	String checkcode = (String) request.getSession().getAttribute("checkcode");//随机生成的
	        String checkcode2 = request.getParameter("checkcode");//获取输入的
	        
	        //如果验证码正确
	        if(checkcode.equals(checkcode2)) {
	           System.out.println("ok");
	        }else{
	           System.out.println("验证码错误");
	        }
		
	}

	public void visitRemote(){
		User u=null;
		try {
			System.out.println(user+"  not null");
			u=MyHttpClient.getUser(user.getCompanyId());
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			writeJSON("300", "系统异常 请重新登陆",null);
		}
		
		if (isEnd(u.getEnddate())) {
			System.out.println("账号过期");
			writeJSON("300", "账号过期",null);
		}else {
			getSession().put("user", u);
			getSession().put("branchCompany", user);
			System.out.println(u.getType()+"   type"+getSessionUser().getType());
			System.out.println("登陆成功");
			writeJSON("200", "登陆成功",user);
		}
	}
	public  boolean isEnd(String endDate) {
		Date enddate=null;
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		Date today=new Date();
		try {
			enddate = df.parse(endDate);
			today=df.parse(df.format(today));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int end=today.compareTo(enddate);
		if (end<0) {
			System.out.println("没过期");
			return false;
		}else {
			System.out.println("过期");
			return true;
		}
	}
	

	
	public void writeJSON(String code,String result,User client){
		net.sf.json.JSONObject joCode;
		if (client!=null) {
			joCode=net.sf.json.JSONObject.fromObject(client);
		}else {
			joCode=new net.sf.json.JSONObject();
		}
		try {
			joCode.put("resultcode", code);
			joCode.put("info", result);
			joCode.put("url", "../../BJAdmin/mainPage.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		resultObj=joCode.toString();
		System.out.println(resultObj+"  resultObj");
	}


	public String getResultObj() {
		return resultObj;
	}

	public void setResultObj(String resultObj) {
		this.resultObj = resultObj;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}


	
}
