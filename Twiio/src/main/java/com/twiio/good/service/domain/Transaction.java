package com.twiio.good.service.domain;

import java.sql.Date;

public class Transaction {
	
	private int tranNo;
	private Product tranPro;
	private String requirement;
	private int totalPrice;
	private Date tripDate;
	private Date regDate;
	private int buyerNo;
	private int paymentType;
	private int count;
	private String refundCode;
	private int starEvalProduct;
	private String reviewProduct;
	private int starEvalHost;
	private String reviewHost;
	private Date payToHostDate;
	private int evalProduct;
	private int evalHost;
	private String userName;
	private String hostName;

	public Transaction() {
		// TODO Auto-generated constructor stub
	}

	public int getTranNo() {
		return tranNo;
	}

	public void setTranNo(int tranNo) {
		this.tranNo = tranNo;
	}

	public Product getTranPro() {
		return tranPro;
	}

	public void setTranPro(Product tranPro) {
		this.tranPro = tranPro;
	}

	public String getRequirement() {
		return requirement;
	}

	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getTripDate() {
		return tripDate;
	}

	public void setTripDate(Date tripDate) {
		this.tripDate = tripDate;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public int getBuyerNo() {
		return buyerNo;
	}

	public void setBuyerNo(int buyerNo) {
		this.buyerNo = buyerNo;
	}

	public int getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(int paymentType) {
		this.paymentType = paymentType;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getRefundCode() {
		return refundCode;
	}

	public void setRefundCode(String refundCode) {
		this.refundCode = refundCode;
	}

	public int getStarEvalProduct() {
		return starEvalProduct;
	}

	public void setStarEvalProduct(int starEvalProduct) {
		this.starEvalProduct = starEvalProduct;
	}

	public String getReviewProduct() {
		return reviewProduct;
	}

	public void setReviewProduct(String reviewProduct) {
		this.reviewProduct = reviewProduct;
	}

	public int getStarEvalHost() {
		return starEvalHost;
	}

	public void setStarEvalHost(int starEvalHost) {
		this.starEvalHost = starEvalHost;
	}

	public String getReviewHost() {
		return reviewHost;
	}

	public void setReviewHost(String reviewHost) {
		this.reviewHost = reviewHost;
	}

	public Date getPayToHostDate() {
		return payToHostDate;
	}

	public void setPayToHostDate(Date payToHostDate) {
		this.payToHostDate = payToHostDate;
	}

	public int getEvalProduct() {
		return evalProduct;
	}

	public void setEvalProduct(int evalProduct) {
		this.evalProduct = evalProduct;
	}

	public int getEvalHost() {
		return evalHost;
	}

	public void setEvalHost(int evalHost) {
		this.evalHost = evalHost;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getHostName() {
		return hostName;
	}

	public void setHostName(String hostName) {
		this.hostName = hostName;
	}

	@Override
	public String toString() {
		return "Transaction [tranNo=" + tranNo + ", tranPro=" + tranPro + ", requirement=" + requirement
				+ ", totalPrice=" + totalPrice + ", tripDate=" + tripDate + ", regDate=" + regDate + ", buyerNo="
				+ buyerNo + ", paymentType=" + paymentType + ", count=" + count + ", refundCode=" + refundCode
				+ ", starEvalProduct=" + starEvalProduct + ", reviewProduct=" + reviewProduct + ", starEvalHost="
				+ starEvalHost + ", reviewHost=" + reviewHost + ", payToHostDate=" + payToHostDate + ", evalProduct="
				+ evalProduct + ", evalHost=" + evalHost + ", userName=" + userName + ", hostName=" + hostName + "]";
	}		

}
