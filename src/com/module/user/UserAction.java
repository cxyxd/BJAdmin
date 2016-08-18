package com.module.user;

import java.util.List;

import javax.annotation.Resource;

import org.apache.jasper.xmlparser.UTF8Reader;
import org.json.JSONException;
import org.json.JSONObject;
import org.omg.CORBA.INTERNAL;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.core.BaseAction;
import com.core.dao.UtilDAO;
import com.model.User;


@Component
@Scope("prototype")
public class UserAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5593305488681708781L;
	
	private User user;
	
	@Resource
	private UtilDAO utilDAO;

	
	
	@Resource
	private JdbcTemplate jdbcTemplate;
	
	private String resultObj;
	
	private List<User> list;
	
	private int id;
	private int  count;
	
	public String getMy(){
		
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getById(){
		List<User> list=(List<User>) utilDAO.findListByProperty("User", "id", id, "");
		user=(User) list.get(0);
		return SUCCESS;
	}
	
	
	
	public String insert(){
		utilDAO.saveOrUpdate(user);
		JSONObject jo=new JSONObject();
		
		try {
			jo.put("resultcode", 200);
			jo.put("info", user.getUserName()+"添加成功");
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resultObj=jo.toString();
		return SUCCESS;
	}
	
	public String update(){
		String sql="update user set usedCount="+user.getUsedCount()+" where id="+user.getId();
		jdbcTemplate.update(sql);
		JSONObject jo=new JSONObject();
		try {
			jo.put("resultcode", 200);
			jo.put("info", "公司信息修改成功");
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resultObj=jo.toString();
		return SUCCESS;
	}
	public String totalUpdate(){
		if (user.getType()==2) {
			String sql="update user set userName=?,password=?,phone=?,companyName=?,appCount=? where id=?";
			jdbcTemplate.update(sql, new Object[]{user.getUserName(),user.getPassword(),user.getPhone(),
					user.getCompanyName(),user.getAppCount(),user.getId()});
		}
		
		if (user.getType()==1) {
			String sql="update user set userName=?,password=?,idCard=?,phone=?,trueName=?,sex=?,address=? where id=?";
			jdbcTemplate.update(sql, new Object[]{user.getUserName(),user.getPassword(),user.getIdCard(),
					user.getPhone(),user.getTrueName(),user.getSex(),user.getAddress(),user.getId()});
		}
		
		if (user.getType()==3) {
			String sql="update user set userName=?,password=? where id=?";
			jdbcTemplate.update(sql, new Object[]{user.getUserName(),user.getPassword(),user.getId()});
		}
		
	
		JSONObject jo=new JSONObject();
		try {
			jo.put("resultcode", 200);
			jo.put("info", "信息修改成功");
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resultObj=jo.toString();
		return SUCCESS;
		
	}
	
	@SuppressWarnings("unchecked")
	public String getAllUser(){
		list=(List<User>) utilDAO.findAllList("User");
		return SUCCESS;
	}
	
	public String getMyInfo(){
		user=(User) utilDAO.findListByProperty("User", "id", getSessionBranch().getId(), "").get(0);
		
		return SUCCESS;
	}
	
	/**
	 * 获得总公司的信息
	 * @return
	 */
	public String getCompanyInfo(){
		user=(User) utilDAO.findListByProperty("User", "id", getSessionUser().getId(), "").get(0);
		String sql=" select count(*) from user where type=2 and companyId= "+user.getId();
		count=jdbcTemplate.queryForInt(sql);
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAllAppClent(){
		

		if (getSessionBranch().getType()==3) {
			list=(List<User>) utilDAO.findListByProperty("User", "companyId", getSessionBranch().getCompanyId(), "and type=1");
		}
		if (getSessionBranch().getType()==2) {
			list=(List<User>) utilDAO.findListByProperty("User", "branchId", getSessionBranch().getBranchId(), "and type=1");
		}

		
		return SUCCESS; 
	}
	
	@SuppressWarnings("unchecked")
	public String getAllBranch(){
		if (getSessionBranch().getType()==3) {
			list=(List<User>) utilDAO.findListByProperty("User", "companyId", getSessionBranch().getCompanyId(), " and type=2");
		}
		if (getSessionBranch().getType()==2) {
			list=(List<User>) utilDAO.findListByProperty("User", "branchId", getSessionBranch().getBranchId(), " and type=2");
		}
		return SUCCESS;
	}
	
	


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UtilDAO getUtilDAO() {
		return utilDAO;
	}

	public void setUtilDAO(UtilDAO utilDAO) {
		this.utilDAO = utilDAO;
	}



	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public String getResultObj() {
		return resultObj;
	}

	public void setResultObj(String resultObj) {
		this.resultObj = resultObj;
	}

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the count
	 */
	public int getCount() {
		return count;
	}

	/**
	 * @param count the count to set
	 */
	public void setCount(int count) {
		this.count = count;
	}

}
