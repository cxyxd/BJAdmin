package com.module.appclient;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.http.client.ClientProtocolException;
import org.json.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.core.BaseAction;
import com.core.dao.UtilDAO;
import com.core.utils.MyHttpClient;
import com.model.User;


@Component
@Scope("prototype")
public class AppClientAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5729590577573448284L;
	
	private User appClient;
	
	private List<User> list;
	
	private String resultObj;
	
	@Resource
	private UtilDAO utilDAO;
	
	@Resource
	private JdbcTemplate jdbcTemplate;
	
	private int id;
	
	private int branchId;
	
	
	int totalCount=0;
	int usedCount=0;
	
	public String insert(){
		checkCount();
		if (usedCount<totalCount) {
			appClient.setCompanyId(getSessionBranch().getCompanyId());
			appClient.setBranchId(getSessionBranch().getBranchId());
			appClient.setCompanyName(getSessionBranch().getCompanyName());
			utilDAO.saveOrUpdate(appClient);
			usedCount++;
			writeJSON("200", "移动端用户"+appClient.getUserName()+"注册成功   您一共可以注册"+totalCount+"个用户 "+  
			  "现在已经注册 "+usedCount+"个用户");
			String sql="update user set usedCount="+usedCount+" where id="+getSessionBranch().getId();
			jdbcTemplate.update(sql);
		}else {
			writeJSON("300", "您一共可以注册"+totalCount+"个用户 "+  
					  "现在已经注册 "+usedCount+"个用户  不能继续注册");
		}

		return SUCCESS;
	}
	
	public String insertBranch(){
		System.out.println("insert Branch");
		User remoteUser=null;
		try {
			remoteUser=MyHttpClient.getUser(getSessionUser().getCompanyId());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		if (remoteUser.getUsedCount()+appClient.getAppCount()>remoteUser.getAppCount()) {
			int count=remoteUser.getAppCount()-remoteUser.getUsedCount();
			writeJSON("300", "最多可分配"+count+"个账号");
			return SUCCESS;
		}
		utilDAO.save(appClient);
		appClient.setBranchId(appClient.getId());
		utilDAO.saveOrUpdate(appClient);
		
		//更新远程服务器
		remoteUser.setUsedCount(remoteUser.getUsedCount()+appClient.getAppCount());
		try {
			MyHttpClient.update(remoteUser);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSON("300", "添加成功");
		return SUCCESS;
	}
	
	
	@SuppressWarnings("unchecked")
	public String getById(){
		List<User> list=(List<User>) utilDAO.findListByProperty("User", "id", id, "");
		appClient=(User) list.get(0);
		return SUCCESS;
	}
	
	public void checkCount(){
		User user=(User) utilDAO.findListByProperty("User", "id", getSessionBranch().getId(),"").get(0);
				
		totalCount=user.getAppCount();
		usedCount=user.getUsedCount();

	}
	
	@SuppressWarnings("unchecked")
	public String getAllAppClent(){
		if (branchId==0) {
			branchId=getSessionBranch().getBranchId();
			list=(List<User>) utilDAO.findListByProperty("User","companyId",branchId,"and type=1");
		}else {
			list=(List<User>) utilDAO.findListByProperty("User","branchId",branchId,"and type=1");
		}
		
		return SUCCESS;
	}
	
 
	
	public void writeJSON(String code,String result){
		JSONObject joCode=new JSONObject();
		try {
			joCode.put("resultcode", code);
			joCode.put("info", result);
			joCode.put("url", "../../mainPage.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		resultObj=joCode.toString();
		System.out.println(resultObj+"  resultObj");
	}
	
	
	public User getAppClient() {
		return appClient;
	}
	public void setAppClient(User appClient) {
		this.appClient = appClient;
	}
	public String getResultObj() {
		return resultObj;
	}
	public void setResultObj(String resultObj) {
		this.resultObj = resultObj;
	}
	public UtilDAO getUtilDAO() {
		return utilDAO;
	}

	public void setUtilDAO(UtilDAO utilDAO) {
		this.utilDAO = utilDAO;
	}

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}

	public int getBranchId() {
		return branchId;
	}

	public void setBranchId(int branchId) {
		this.branchId = branchId;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getUsedCount() {
		return usedCount;
	}

	public void setUsedCount(int usedCount) {
		this.usedCount = usedCount;
	}
	
}
