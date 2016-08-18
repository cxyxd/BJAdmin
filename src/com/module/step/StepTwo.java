package com.module.step;

import java.util.Date;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.BaseAction;



@Controller()
@Scope("prototype")
public class StepTwo extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4765544864968563763L;
	private String step2_name;
	
	public String execute(){
		System.out.println(step2_name);
		return SUCCESS;
	}
	
	public String show(){
		step2_name="step2_name"+new Date();
		System.out.println(step2_name);
		return SUCCESS;
	}

	public String getStep2_name() {
		return step2_name;
	}

	public void setStep2_name(String step2_name) {
		this.step2_name = step2_name;
	}

	
}
