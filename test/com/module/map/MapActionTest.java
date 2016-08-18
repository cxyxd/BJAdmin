package com.module.map;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;


@ContextConfiguration(locations = { "classpath:resources/applicationContext.xml" })
public class MapActionTest  extends AbstractJUnit4SpringContextTests { 
	
	@Resource
	private MapAction mapAction;
	
	@Test
	public void testGetAllCustomer(){
		mapAction.getAllVisit();
	}

}
