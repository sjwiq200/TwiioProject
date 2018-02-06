package com.twiio.good.service.domain;

import java.sql.Date;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Report
{
  private int reportNo;
  private int userNo;
  private String reportContent;
  private String reportTitle;
  private Date reportRegDate;
  private int targetUserNo;
  private String targetRoomKey;
  private int targetReplyNo;
  private int targetCommunityNo;
  
  

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





public Date getReportRegDate() {
	return reportRegDate;
}





public void setReportRegDate(Date reportRegDate) {
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


@Override
public String toString() {
	return "Report [reportNo=" + reportNo + ", userNo=" + userNo + ", reportContent=" + reportContent + ", reportTitle="
			+ reportTitle + ", reportRegDate=" + reportRegDate + ", targetUserNo=" + targetUserNo + ", targetRoomKey="
			+ targetRoomKey + ", targetReplyNo=" + targetReplyNo + ", targetCommunityNo=" + targetCommunityNo + "]";
}







  
}