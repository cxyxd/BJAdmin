package com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;



@Entity
@Table(name = "MARKET")
public class Market {
	
	private int id;
	private int opponentId;
	
	private String productName;
	private String leaveFacPrice;  //出厂价格
	private String freight;        //运费
	private String truePrice;      //落地价格
	private String sellPrice;      //终端销售价格
	private String distance;
	private String clientId;
	private String clientName;
	
	private String policy;  //营销政策
	
	//非表属性
	private String opponentName;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOpponentId() {
		return opponentId;
	}
	public void setOpponentId(int opponentId) {
		this.opponentId = opponentId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getLeaveFacPrice() {
		return leaveFacPrice;
	}
	public void setLeaveFacPrice(String leaveFacPrice) {
		this.leaveFacPrice = leaveFacPrice;
	}
	public String getFreight() {
		return freight;
	}
	public void setFreight(String freight) {
		this.freight = freight;
	}
	public String getTruePrice() {
		return truePrice;
	}
	public void setTruePrice(String truePrice) {
		this.truePrice = truePrice;
	}
	public String getSellPrice() {
		return sellPrice;
	}
	public void setSellPrice(String sellPrice) {
		this.sellPrice = sellPrice;
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
	public String getOpponentName() {
		return opponentName;
	}
	public void setOpponentName(String opponentName) {
		this.opponentName = opponentName;
	}
	public String getPolicy() {
		return policy;
	}
	public void setPolicy(String policy) {
		this.policy = policy;
	}
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}

	

}
