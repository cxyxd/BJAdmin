package com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;



@Entity
@Table(name = "CUSTOMER")
public class Customer {
	private int id;
	
	private String type;
	private String name;
	private String address;
	
	//集团用户
	private String landline;  //固定电话
	
	private String leader1_info;
	private String leader2_info;
	private String leader3_info;

	
	//个人用户
	private String phone1;
	private String phone2;
	
	private String level;

	private String status;  //合作状态
	
	private String clientId;
	private String clientName;
	
	private String record;
	
	//非表属性
	private String companyName;
	
	private String email;
	private String postalCode;
	private String cus_desc;


	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getLandline() {
		return landline;
	}

	public void setLandline(String landline) {
		this.landline = landline;
	}

	

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getCus_desc() {
		return cus_desc;
	}

	public void setCus_desc(String cus_desc) {
		this.cus_desc = cus_desc;
	}

	public String getRecord() {
		return record;
	}
	public void setRecord(String record) {
		this.record = record;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	@Transient
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getLeader2_info() {
		return leader2_info;
	}

	public void setLeader2_info(String leader2_info) {
		this.leader2_info = leader2_info;
	}

	public String getLeader3_info() {
		return leader3_info;
	}

	public void setLeader3_info(String leader3_info) {
		this.leader3_info = leader3_info;
	}

	public String getLeader1_info() {
		return leader1_info;
	}

	public void setLeader1_info(String leader1_info) {
		this.leader1_info = leader1_info;
	}

	

}
