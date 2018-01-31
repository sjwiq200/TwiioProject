package com.twiio.good.service.domain;

import java.sql.Date;

public class Reply {
	private int replyNo;
	private int userNo;
	private String userId;
	private String replyContent;
	private Date replyRegDate;
	private int productNo;
	private int communityNo;
	private String targetType;
	
	public Reply() {
	}


		





	public String getUserId() {
		return userId;
	}








	public void setUserId(String userId) {
		this.userId = userId;
	}








	public String getTargetType() {
		return targetType;
	}








	public void setTargetType(String targetType) {
		this.targetType = targetType;
	}








	public int getReplyNo() {
		return replyNo;
	}




	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}




	public int getUserNo() {
		return userNo;
	}




	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}




	public String getReplyContent() {
		return replyContent;
	}




	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}




	public Date getReplyRegDate() {
		return replyRegDate;
	}




	public void setReplyRegDate(Date replyRegDate) {
		this.replyRegDate = replyRegDate;
	}




	public int getProductNo() {
		return productNo;
	}




	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}




	public int getCommunityNo() {
		return communityNo;
	}




	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}




	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Reply [replyNo=" + replyNo + ", userNo=" + userNo + ", replyContent=" + replyContent + ", replyRegDate="
		+ replyRegDate + ", productNo=" + productNo + ", communityNo=" + communityNo + " ]";
	}
	
	

	
}
