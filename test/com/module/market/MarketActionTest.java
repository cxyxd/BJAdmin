package com.module.market;

import javax.annotation.Resource;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import org.junit.Test;

import com.model.User;


@ContextConfiguration(locations = { "classpath:resources/applicationContext.xml" })
public class MarketActionTest  extends AbstractJUnit4SpringContextTests {
	
	@Resource
	private MarketAction marketAction;
	
	
	//@Test
	public void testInsert() {
		marketAction.getMarketByPage();
	}
	
	//@Test
	public void testShow(){
		marketAction.show();
	}
	
	@Test
	public void testGetMarketByPage(){
		marketAction.getMarketByPage();
	}

}
