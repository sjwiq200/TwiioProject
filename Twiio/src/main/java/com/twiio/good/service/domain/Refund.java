package com.twiio.good.service.domain;

import java.sql.Date;

public class Refund {
	
	private int refundNo;
	private int tranNo;
	private Date regDate;
	private Date confirmDate;
	private int refundPrice;
	private String refundAccount;
	private String refundBank;

	public Refund() {
		// TODO Auto-generated constructor stub
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getConfirmDate() {
		return confirmDate;
	}

	public void setConfirmDate(Date confirmDate) {
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

	@Override
	public String toString() {
		return "Refund [refundNo=" + refundNo + ", tranNo=" + tranNo + ", regDate=" + regDate + ", confirmDate="
				+ confirmDate + ", refundPrice=" + refundPrice + ", refundAccount=" + refundAccount + ", refundBank="
				+ refundBank + "]";
	}

}
