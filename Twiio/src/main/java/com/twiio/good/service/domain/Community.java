package com.twiio.good.service.domain;

import java.sql.Date;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.springframework.web.multipart.MultipartFile;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Community {
	private int communityNo;
	private String communityTitle;
	private int userNo;
	private Date regDate;
	private int viewCount;
	private String communitySubTitle;
	private String communityType;
	private String communityContent;
	private String userName;
	private String targetUserName;
	private String thumbnail;
	private MultipartFile file;
	
	
	public Community() {
	}

	public String getUserName() {
		return userName;
	}

	public String getTargetUserName() {
		return targetUserName;
	}

	public void setTargetUserName(String targetUserName) {
		this.targetUserName = targetUserName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getCommunityNo() {
		return communityNo;
	}

	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}


	public String getCommunityTitle() {
		return communityTitle;
	}


	public void setCommunityTitle(String communityTitle) {
		this.communityTitle = communityTitle;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public int getViewCount() {
		return viewCount;
	}


	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}


	public String getCommunitySubTitle() {
		return communitySubTitle;
	}


	public void setCommunitySubTitle(String communitySubTitle) {
		this.communitySubTitle = communitySubTitle;
	}


	public String getCommunityType() {
		return communityType;
	}


	public void setCommunityType(String communityType) {
		this.communityType = communityType;
	}


	public String getCommunityContent() {
		return communityContent;
	}


	public void setCommunityContent(String communityContent) {
		this.communityContent = communityContent;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Community [communityNo=" + communityNo + ", communityTitle=" + communityTitle + ", userNo=" + userNo + ", regDate="
				+ regDate + ", viewCount=" + viewCount + ", communitySubTitle=" + communitySubTitle + ", communityType=" + communityType
				+ ", communityContent=" + communityContent+", userName="+userName+" ]";
	}
	
}
