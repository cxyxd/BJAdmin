package com.core.utils;

import java.util.Map;

import org.apache.log4j.Logger;

import com.model.User;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 核心拦截器（作用：1、检查用户是否登录；2、捕获到异常后统一输出日志；3、统一错误显示页面）
 * 
 * @author ibangbang
 * @version 1.0
 */
public class CoreInterceptor extends AbstractInterceptor {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7867946246032570492L;

	/**
	 * 忽略的action名字集合，用逗号隔开
	 */
	private String ignoreActions;

	/**
	 * log4j输出
	 */
	private static Logger logger = Logger.getLogger(CoreInterceptor.class);

	/**
	 * 拦截方法
	 */
	@Override
	public String intercept(ActionInvocation invocation) {
	//	logger.info("Core Interceptor executed ...");
		ActionContext ctx = invocation.getInvocationContext();
		Map<String, Object> session = ctx.getSession();

		Object user=null;
		if (session.get("user")!=null) {
			user = (User) session.get("user");
		}

		boolean ignore = false;

		String currentAction = invocation.getProxy().getActionName();
		String[] actions = ignoreActions.split(",");

		// 判断要调用的action是否在忽略的action的集合中
		for (String action : actions) {
			if (action.trim().equals(currentAction)) {
				ignore = true;
				break;
			}
		}

		String result;

		if (user != null || ignore == true) {
			try {
				// 调用action
				result = invocation.invoke();
			} catch (Exception e) {
				e.printStackTrace(); // for debug
				logger.error(e.toString());
				result = "exception";
			}

		} else { // 用户未登录或者session过期
			result = Action.LOGIN;
		}

		return result;
	}

	/**
	 * @return the ignoreActions
	 */
	public String getIgnoreActions() {
		return ignoreActions;
	}

	/**
	 * @param ignoreActions
	 *            the ignoreActions to set
	 */
	public void setIgnoreActions(String ignoreActions) {
		this.ignoreActions = ignoreActions;
	}

}
