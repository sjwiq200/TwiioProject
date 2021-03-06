package com.twiio.good.service.domain;

import java.util.Date;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Message {
	private int messageNo;
	private int toUserNo;
	private int fromUserNo;
	private String messageContent;
	private String messageRegDate;
	private String messageType;
	private String messageTitle;
	private int productNo;
	private String targetUserName;
	private String userName;
	
	public int getMessageNo() {
		return messageNo;
	}
	
	public String getTargetUserName() {
		return targetUserName;
	}

	public void setTargetUserName(String targetUserName) {
		this.targetUserName = targetUserName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	
	public int getToUserNo() {
		return toUserNo;
	}
	
	public void setToUserNo(int toUserNo) {
		this.toUserNo = toUserNo;
	}
	
	public int getFromUserNo() {
		return fromUserNo;
	}
	
	public void setFromUserNo(int fromUserNo) {
		this.fromUserNo = fromUserNo;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public String getMessageRegDate() {
		return messageRegDate;
	}
	public void setMessageRegDate(String messageRegDate) {
		this.messageRegDate = messageRegDate;
	}
	public String getMessageType() {
		return messageType;
	}
	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}
	public String getMessageTitle() {
		return messageTitle;
	}
	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Message : [ messageNo : "+messageNo+", toUserNo : "+toUserNo+", fromUserNo : "+fromUserNo
				+", messageContent : "+messageContent+", messageRegDate : "+messageRegDate+", messageType : "+messageType
				+", messageTitle : "+messageTitle+", productNo : "+productNo+", userName : "+userName+", targetUserName : "+targetUserName+"]";
	}
	
	
}
