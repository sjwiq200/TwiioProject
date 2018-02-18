package com.twiio.good.service.domain;

public class UserEval {

	private int userNo;
	private int targetNo;
	private int profileTnF;
	private int attendanceTnF;
	private String scheduleNo;
	private int userEvalNo;
	
	public UserEval() {
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getTargetNo() {
		return targetNo;
	}

	public void setTargetNo(int targetNo) {
		this.targetNo = targetNo;
	}

	public int getProfileTnF() {
		return profileTnF;
	}

	public void setProfileTnF(int profileTnF) {
		this.profileTnF = profileTnF;
	}

	public int getAttendanceTnF() {
		return attendanceTnF;
	}

	public void setAttendanceTnF(int attendanceTnF) {
		this.attendanceTnF = attendanceTnF;
	}

	public String getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(String scheduleNo) {
		this.scheduleNo = scheduleNo;
	}
	
	public int getUserEvalNo() {
		return userEvalNo;
	}

	public void setUserEvalNo(int userEvalNo) {
		this.userEvalNo = userEvalNo;
	}

	@Override
	public String toString() {
		return "UserEval [userNo=" + userNo + ", targetNo=" + targetNo + ", profileTnF=" + profileTnF
				+ ", attendanceTnF=" + attendanceTnF + ", scheduleNo=" + scheduleNo + ", userEvalNo=" + userEvalNo
				+ "]";
	}
	
	
	
	
	
}
