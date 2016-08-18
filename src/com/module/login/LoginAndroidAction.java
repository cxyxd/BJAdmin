//package com.module.login;
//
//import java.util.List;
//
//import javax.annotation.Resource;
//
//import org.springframework.context.annotation.Scope;
//import org.springframework.stereotype.Component;
//
//import com.core.BaseAction;
//import com.core.dao.UtilDAO;
//import com.core.utils.DateConvert;
//import com.model.APPClient;
//
//
//@Component
//@Scope("prototype")
//public class LoginAndroidAction  extends BaseAction{
//	/**
//	 * 
//	 */
//	private static final long serialVersionUID = 3146704855824091635L;
//
//	private APPClient appClient;
//	
//	@Resource
//	private UtilDAO utilDAO;
//	
//	private String resultObj;
//	
//	
//	@SuppressWarnings("unchecked")
//	public String login(){
//		List<APPClient> appClientList=(List<APPClient>) utilDAO.findListByProperty("APPClient", "name", appClient.getName(), "");
//		
//		String nowDate=DateConvert.getDate();
//		if (appClientList.size()==0) {
//			System.out.println("用户名错误");
//			writeJSON("300", "用户名错误",null);
//		
//		}else if (appClientList.get(0).getPassword().equals(appClient.getPassword())) {
//			
//			if (utilDAO.findListByProperty("User","id", Integer.valueOf(appClientList.get(0).getCompanyId()),
//					 " and enddate>'"+nowDate+"'").size()==0) {
//				System.out.println("用户名过期");
//				writeJSON("300", "用户名过期",null);
//				return SUCCESS;
//			}
//			getSession().put("client", appClientList.get(0));
//			System.out.println(getSession().get("client")+"   client");
//			
//			System.out.println("登陆成功");
//			writeJSON("200", "登陆成功",appClientList.get(0));
//			
//		}else {
//			System.out.println("密码错误");
//			writeJSON("300", "密码错误",null);
//		
//		}
//		return SUCCESS;
//	}
//	
//	public void writeJSON(String code,String result,APPClient client){
//		net.sf.json.JSONObject joCode;
//		if (client!=null) {
//			joCode=net.sf.json.JSONObject.fromObject(client);
//		}else {
//			joCode=new net.sf.json.JSONObject();
//		}
//		try {
//			joCode.put("resultcode", code);
//			joCode.put("info", result);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		resultObj=joCode.toString();
//		System.out.println(resultObj+"  resultObj");
//	}
//
//	public String getResultObj() {
//		return resultObj;
//	}
//
//	public void setResultObj(String resultObj) {
//		this.resultObj = resultObj;
//	}
//
//
//	public UtilDAO getUtilDao() {
//		return utilDAO;
//	}
//
//	public void setUtilDao(UtilDAO utilDao) {
//		this.utilDAO = utilDao;
//	}
//
//	public APPClient getAppClient() {
//		return appClient;
//	}
//
//	public void setAppClient(APPClient appClient) {
//		this.appClient = appClient;
//	}
//
//
//	
//	
//}
