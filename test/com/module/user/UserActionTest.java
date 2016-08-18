package com.module.user;

import javax.annotation.Resource;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import org.junit.Ignore;
import org.junit.Test;

import com.model.User;


@ContextConfiguration(locations = { "classpath:resources/applicationContext.xml" })
public class UserActionTest  extends AbstractJUnit4SpringContextTests {
	
	@Resource
	private UserAction userAction;
	
	
	@Ignore
	public void testInsert() {
		userAction.getAllUser();
	}
	@Test
	public void testUpdate(){
		User user=new User();
		user.setId(11);
		user.setEnddate("2015-05-22");
		userAction.setUser(user);
		userAction.update();
	}

}
