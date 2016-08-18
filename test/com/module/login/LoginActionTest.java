package com.module.login;

import javax.annotation.Resource;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import org.junit.Test;

import com.model.User;


@ContextConfiguration(locations = { "classpath:resources/applicationContext.xml" })
public class LoginActionTest  extends AbstractJUnit4SpringContextTests {
	
	@Resource
	private LoginAction loginAction;
		
	@Test
	public void testInsert() {
		User user=new User();
		user.setPassword("123123");
		user.setUserName("460795365@qq.com");
		loginAction.setUser(user);
		loginAction.login();
	}

}
