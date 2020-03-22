package com.yzm;

import java.io.ByteArrayInputStream;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.core.BaseAction;


@Component
@Scope("prototype")
public class RandomAction extends BaseAction {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2703674182558208308L;

	private ByteArrayInputStream inputStream;
	
	public void setInputStream(ByteArrayInputStream inputStream) {
		this.inputStream = inputStream;
	}

	public ByteArrayInputStream getInputStream() {
		return inputStream;
	}

	public String execute() throws Exception {
		RandomNumUtil rdnu = RandomNumUtil.Instance();
		this.setInputStream(rdnu.getImage());// 取得带有随机字符串的图片
		System.out.println(rdnu.getString()+" lll");
		System.out.println(rdnu.getString()+" lll");
		getSession().put("sessionCode", rdnu.getString());// 取得随机字符串放入HttpSession
		request.getSession().setAttribute("sessionCode", rdnu.getString());
		return SUCCESS;
	}


}