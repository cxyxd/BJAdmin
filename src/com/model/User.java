package com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "USER")
public class User  {
	/**
	 * 
	 */
	private int id;
	private String password;
	private String userName;
	
	private String companyName;
	private String companyMsg;
	
	private Integer appCount;
	private Integer usedCount;
	private String enddate;
	private String address;
	private String phone;

	

	private String trueName;
	private Integer branchId;  //分公司id
				
	private Integer companyId; //总公司id
	private String idCard;
	private String sex;
	
	private Integer type;   //1代表业务员  2代表分公司  3代表总公司
	private String area;
	
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyMsg() {
		return companyMsg;
	}
	public void setCompanyMsg(String companyMsg) {
		this.companyMsg = companyMsg;
	}
	public Integer getAppCount() {
		return appCount;
	}
	public void setAppCount(Integer appCount) {
		this.appCount = appCount;
	}
	public Integer getUsedCount() {
		return usedCount;
	}
	public void setUsedCount(Integer usedCount) {
		this.usedCount = usedCount;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTrueName() {
		return trueName;
	}
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	/**
	 * 获得用户所处的分公司id
	 * @return
	 */
	public Integer getBranchId() {
		return branchId;
	}
	public void setBranchId(Integer branchId) {
		this.branchId = branchId;
	}
	/**
	 * 获得用户的总公司id
	 * @return
	 */
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	/**
	 * 获得用户级别
	 * 1代表业务员
	 * 2代表分公司
	 * 3代表总公司
	 * @return
	 */
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	/**
	 * @return the area
	 */
	public String getArea() {
		return area;
	}
	/**
	 * @param area the area to set
	 */
	public void setArea(String area) {
		this.area = area;
	}


	
}
