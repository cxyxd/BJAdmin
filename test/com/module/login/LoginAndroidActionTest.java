//package com.module.login;
//
//import javax.annotation.Resource;
//
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
//
//import org.junit.Test;
//
//import com.model.APPClient;
//import com.model.User;
//
//
//@ContextConfiguration(locations = { "classpath:resources/applicationContext.xml" })
//public class LoginAndroidActionTest  extends AbstractJUnit4SpringContextTests {
//	
//	@Resource
//	private LoginAndroidAction loginAndroidAction ;
//		
//	@Test
//	public void testInsert() {
//		APPClient user=new APPClient();
//		user.setPassword("123123");
//		user.setName("xxx");
//		loginAndroidAction.setAppClient(user);
//		loginAndroidAction.login();
//	}
//
//}
