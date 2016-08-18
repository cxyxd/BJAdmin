package com.module.step;

import java.util.Date;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.BaseAction;


@Controller()
@Scope("prototype")
public class StepOne extends BaseAction  {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4765544864968563763L;
	private String step1_name;
	
	public String execute() {
		System.out.println(step1_name);
		return SUCCESS;
	}

	public String show(){
		step1_name="step1_name"+new Date();
		System.out.println(step1_name);
		return SUCCESS;
	}
	public String getStep1_name() {
		return step1_name;
	}

	public void setStep1_name(String step1_name) {
		this.step1_name = step1_name;
	}

	
}
