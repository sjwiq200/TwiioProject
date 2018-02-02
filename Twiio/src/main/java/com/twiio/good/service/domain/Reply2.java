package com.twiio.good.service.domain;

import java.sql.Date;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
@JsonIgnoreProperties(ignoreUnknown=true)
public class Reply2 {
	
	private String userNo;
	private String userName;
	private String replyContent;
	private String communityNo;
	
	
	public Reply2() {
	}

	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}












	public String getUserNo() {
		return userNo;
	}




	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}




	public String getReplyContent() {
		return replyContent;
	}




	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}







	public String getCommunityNo() {
		return communityNo;
	}




	public void setCommunityNo(String communityNo) {
		this.communityNo = communityNo;
	}




	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Reply ";
	}
	

	
}
