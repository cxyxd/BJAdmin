package com.module.step;

import java.util.Date;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.BaseAction;



@Controller()
@Scope("prototype")
public class StepThree extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4765544864968563763L;
	private String step3_name;
	
	public String execute(){
		System.out.println(step3_name);
		return SUCCESS;
	}
	
	public String show(){
		step3_name="step3_name"+new Date();
		System.out.println(step3_name);
		return SUCCESS;
	}

	public String getStep3_name() {
		return step3_name;
	}

	public void setStep3_name(String step3_name) {
		this.step3_name = step3_name;
	}

	
}
