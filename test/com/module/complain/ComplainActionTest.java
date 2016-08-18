package com.module.complain;

import javax.annotation.Resource;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import org.junit.Ignore;
import org.junit.Test;

import com.model.Customer;


@ContextConfiguration(locations = { "classpath:resources/applicationContext.xml" })
public class ComplainActionTest  extends AbstractJUnit4SpringContextTests {
	
	@Resource
	private ComplainAction complainAction;
	
	
	//@Test
	public void testShowComplainAndroid() {
		complainAction.showComplainAndroid();
	}
	
	@Test
	public void testShowComplainPC() {
		complainAction.showComplainPC();
	}

}
