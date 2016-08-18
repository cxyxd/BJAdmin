package com.core.utils;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 核心拦截器（作用：1、检查用户是否登录；2、捕获到异常后统一输出日志；3、统一错误显示页面）
 * 
 * @author ibangbang
 * @version 1.0
 */
public class TimeInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7067918101672572737L;


	/**
	 * 拦截方法
	 */
	@Override
	public String intercept(ActionInvocation invocation) {


		String currentAction = invocation.getProxy().getActionName();

		String result="";
		long start =System.currentTimeMillis();
		try {
			result = invocation.invoke();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long end =System.currentTimeMillis();
		System.out.println(currentAction+" 耗时--"+(end-start)+"毫秒");

		return result;
	}



}
