package com.twiio.good.service.domain;

import java.util.Date;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Message {
	private int messageNo;
	private int toUserNo;
	private int fromUserNo;
	private String messageContent;
	private Date messageRegDate;
	private char messageType;
	private String messageTitle;
	private int productNo;
	public int getMessageNo() {
		return messageNo;
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
	public Date getMessageRegDate() {
		return messageRegDate;
	}
	public void setMessageRegDate(Date messageRegDate) {
		this.messageRegDate = messageRegDate;
	}
	public char getMessageType() {
		return messageType;
	}
	public void setMessageType(char messageType) {
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
				+", messageTitle : "+messageTitle+", productNo : "+productNo+" ]";
	}
	
	
}
