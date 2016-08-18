package com.module.user;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.core.BaseAction;
import com.core.dao.UtilDAO;
import com.model.User;


@Component
@Scope("prototype")
public class RemoteUserAction extends BaseAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 274618961203791468L;

	private User user;
	
	@Resource
	private UtilDAO utilDAO;
	
	private String resultObj;
	
	
	public String getUserInfoJSON(){
		user=(User) utilDAO.findListByProperty("User", "id", user.getId(), "").get(0);
		net.sf.json.JSONObject jo= net.sf.json.JSONObject.fromObject(user);
		resultObj=jo.toString();
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


	public String getResultObj() {
		return resultObj;
	}


	public void setResultObj(String resultObj) {
		this.resultObj = resultObj;
	}

}
