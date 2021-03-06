package com.twiio.good.service.domain;



import java.sql.Date;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
@JsonIgnoreProperties(ignoreUnknown=true)
public class Reply {
	private int replyNo;
	private int userNo;
	private String userName;
	private String replyContent;
	private String replyRegDate;
	private int productNo;
	private int communityNo;
	private String targetType;
	private int currentPage;
	
	public Reply() {
	}
	
	

	public int getCurrentPage() {
		return currentPage;
	}



	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}



	public String getTargetType() {
		return targetType;
	}



	public void setTargetType(String targetType) {
		this.targetType = targetType;
	}



	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
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




	public String getReplyRegDate() {
		return replyRegDate;
	}




	public void setReplyRegDate(String replyRegDate) {
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
		+ replyRegDate + ", productNo=" + productNo + ", communityNo=" + communityNo + ",userName="+userName+" ]";
	}
	
	

	
}
