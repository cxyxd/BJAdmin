//package com.model;
//
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.Id;
//import javax.persistence.Table;
//import javax.persistence.Transient;
//
//
//@Entity
//@Table(name = "APPCLIENT")
//public class APPClient {
//	/**
//	 * 
//	 */
//	
//	private int id;
//	private String name;
//	private String trueName;
//	private String password;
//	private String companyId;
//	
//	private String idCard;
//	private String phone;
//	private String address;
//	private String sex;
//	
//	////非表属性
//	
//	private String companyName;
//	
//	
//	@Id
//	@GeneratedValue
//	public int getId() {
//		return id;
//	}
//	public void setId(int id) {
//		this.id = id;
//	}
//	public String getName() {
//		return name;
//	}
//	public void setName(String name) {
//		this.name = name;
//	}
//	public String getTrueName() {
//		return trueName;
//	}
//	public void setTrueName(String trueName) {
//		this.trueName = trueName;
//	}
//	public String getPassword() {
//		return password;
//	}
//	public void setPassword(String password) {
//		this.password = password;
//	}
//	public String getCompanyId() {
//		return companyId;
//	}
//	public void setCompanyId(String companyId) {
//		this.companyId = companyId;
//	}
//	public String getIdCard() {
//		return idCard;
//	}
//	public void setIdCard(String idCard) {
//		this.idCard = idCard;
//	}
//	public String getPhone() {
//		return phone;
//	}
//	public void setPhone(String phone) {
//		this.phone = phone;
//	}
//	public String getAddress() {
//		return address;
//	}
//	public void setAddress(String address) {
//		this.address = address;
//	}
//	@Transient  
//	public String getCompanyName() {
//		return companyName;
//	}
//	public void setCompanyName(String companyName) {
//		this.companyName = companyName;
//	}
//	public String getSex() {
//		return sex;
//	}
//	public void setSex(String sex) {
//		this.sex = sex;
//	}
//	
//	
//
//}
