package com.twiio.good.service.domain;

import java.sql.Date;

public class Refund {
	
	private int refundNo;
	private int tranNo;
	private String regDate;
	private String confirmDate;
	private int refundPrice;
	private String refundAccount;
	private String refundBank;
	private int userNo;
	private int hostNo;
	private String userType;
	private String userName;
	private String productName;
	private String refundCode;

	public Refund() {
		// TODO Auto-g onstructor stub
	}

	public int getRefundNo() {
		return refundNo;
	}

	public void setRefundNo(int refundNo) {
		this.refundNo = refundNo;
	}

	public int getTranNo() {
		return tranNo;
	}

	public void setTranNo(int tranNo) {
		this.tranNo = tranNo;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getConfirmDate() {
		return confirmDate;
	}

	public void setConfirmDate(String confirmDate) {
		this.confirmDate = confirmDate;
	}

	public int getRefundPrice() {
		return refundPrice;
	}

	public void setRefundPrice(int refundPrice) {
		this.refundPrice = refundPrice;
	}

	public String getRefundAccount() {
		return refundAccount;
	}

	public void setRefundAccount(String refundAccount) {
		this.refundAccount = refundAccount;
	}

	public String getRefundBank() {
		return refundBank;
	}

	public void setRefundBank(String refundBank) {
		this.refundBank = refundBank;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getHostNo() {
		return hostNo;
	}

	public void setHostNo(int hostNo) {
		this.hostNo = hostNo;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getRefundCode() {
		return refundCode;
	}

	public void setRefundCode(String refundCode) {
		this.refundCode = refundCode;
	}

	@Override
	public String toString() {
		return "Refund [refundNo=" + refundNo + ", tranNo=" + tranNo + ", regDate=" + regDate + ", confirmDate="
				+ confirmDate + ", refundPrice=" + refundPrice + ", refundAccount=" + refundAccount + ", refundBank="
				+ refundBank + ", userNo=" + userNo + ", hostNo=" + hostNo + ", userType=" + userType + "]";
	}

}
