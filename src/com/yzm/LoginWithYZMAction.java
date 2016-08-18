package com.yzm;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.core.BaseAction;

@Component()
@Scope("prototype")
/*
 * 
 * http://ewf-momo.iteye.com/blog/1678220
 */
public class LoginWithYZMAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6017935779120138710L;


	private String name;
	private String code;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String execute() throws Exception {
		String sessionCode="";
		sessionCode = (String) getSession().get("sessionCode");
		System.out.println(request.getSession().getId());

		if (code.equals(sessionCode)) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}
}
