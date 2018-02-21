package com.twiio.good.service.domain;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Report
{
  private int reportNo;
  private int userNo;
  private String userName;
  private String reportContent;
  private String reportTitle;
  private String reportRegDate;
  private int targetUserNo;
  private String targetRoomKey;
  private int targetReplyNo;
  private int targetCommunityNo;
  private String targetUserName;
  private String targetUserId;
  private String reportState;
  
  

  public Report() {
  }


public void setTargetUserNo(int targetUserNo) {
	this.targetUserNo = targetUserNo;
}

public int getReportNo() {
	return reportNo;
}

public void setReportNo(int reportNo) {
	this.reportNo = reportNo;
}

public int getUserNo() {
	return userNo;
}

public void setUserNo(int userNo) {
	this.userNo = userNo;
}

public String getReportContent() {
	return reportContent;
}

public void setReportContent(String reportContent) {
	this.reportContent = reportContent;
}

public String getReportTitle() {
	return reportTitle;
}

public void setReportTitle(String reportTitle) {
	this.reportTitle = reportTitle;
}

public String getReportRegDate() {
	return reportRegDate;
}

public void setReportRegDate(String reportRegDate) {
	this.reportRegDate = reportRegDate;
}

public int getTargetUserNo() {
	return targetUserNo;
}


public String getTargetRoomKey() {
	return targetRoomKey;
}


public void setTargetRoomKey(String targetRoomKey) {
	this.targetRoomKey = targetRoomKey;
}


public int getTargetReplyNo() {
	return targetReplyNo;
}

public void setTargetReplyNo(int targetReplyNo) {
	this.targetReplyNo = targetReplyNo;
}

public int getTargetCommunityNo() {
	return targetCommunityNo;
}

public void setTargetCommunityNo(int targetCommunityNo) {
	this.targetCommunityNo = targetCommunityNo;
}


public String getTargetUserId() {
	return targetUserId;
}


public void setTargetUserId(String targetUserId) {
	this.targetUserId = targetUserId;
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


public String getReportState() {
	return reportState;
}


public void setReportState(String reportState) {
	this.reportState = reportState;
}


@Override
public String toString() {
	return "Report [reportNo=" + reportNo + ", userNo=" + userNo + ", userName=" + userName + ", reportContent="
			+ reportContent + ", reportTitle=" + reportTitle + ", reportRegDate=" + reportRegDate + ", targetUserNo="
			+ targetUserNo + ", targetRoomKey=" + targetRoomKey + ", targetReplyNo=" + targetReplyNo
			+ ", targetCommunityNo=" + targetCommunityNo + ", targetUserName=" + targetUserName + ", targetUserId="
			+ targetUserId + ", reportState=" + reportState + "]";
}

 
}