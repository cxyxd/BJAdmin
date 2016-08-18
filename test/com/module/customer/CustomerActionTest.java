package com.module.customer;

import javax.annotation.Resource;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import org.junit.Ignore;
import org.junit.Test;

import com.model.Customer;


@ContextConfiguration(locations = { "classpath:resources/applicationContext.xml" })
public class CustomerActionTest  extends AbstractJUnit4SpringContextTests {
	
	@Resource
	private CustomerAction customerAction;
	
	
	@Ignore
	public void testInsert() {
		Customer customer= new Customer();
		customer.setName("dlf22");
		customer.setAddress("实验楼");
		customerAction.setCustomer(customer);
		customerAction.insert();
	}
	
	@Test
	public void testGetCustomerByPage(){
//		customerAction.setCurrentPage(1);
//		customerAction.getCustomerByPage();
	}

}
