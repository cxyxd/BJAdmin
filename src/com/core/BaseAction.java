package com.core;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;


import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;



/**
 * 所有Action从本类继承，在本类中提供一些常用内置对象及方法便于在子类中直接使用
 * 
 * @author ibangbang
 * @version 1.0
 */
public class BaseAction extends ActionSupport implements ServletRequestAware,
		ServletResponseAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2986152232558888323L;

	/**
	 * 便于在Action类中可以直接使用request对象
	 */
	protected HttpServletRequest request;
	

	/**
	 * 便于在Action类中可以直接使用response对象
	 */
	protected HttpServletResponse response;

	/**
	 * 获得Session
	 * 
	 * @return the session object
	 */
	protected Map<String, Object> getSession() {
		return ActionContext.getContext().getSession();
	}

	/**
	 * 获得session中的user对象
	 * 
	 * @return the user object
	 */
	protected User getSessionUser() {
		return (User) this.getSession().get("user");
	}
	
	/**
	 * 获得session中的Branch对象
	 * 
	 * @return the user object
	 */
	protected User getSessionBranch() {
		return (User) this.getSession().get("branchCompany");
	}
	

	/**
	 * @param request
	 *            the request to set
	 */
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	/**
	 * @param response
	 *            the response to set
	 */
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	/**
	 * 处理文本中的单引号
	 * 
	 * @param text
	 * @return 处理后的文本
	 */
	protected String disposeQuote(String text) {
		int i = text.indexOf("'");
		if (i < 0)
			return text;

		// 对单引号进行转义
		StringBuffer sb = new StringBuffer(text);
		do {
			sb.insert(i, '\'');
			i = sb.indexOf("'", i + 2);
		} while (i >= 0);

		return sb.toString();

	}

}
