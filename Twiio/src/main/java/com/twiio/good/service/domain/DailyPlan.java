package com.twiio.good.service.domain;

import java.sql.Date;

public class DailyPlan {

	public DailyPlan() {
		// TODO Auto-generated constructor stub
	}
	
	private int dailyPlanNo;
	private MainPlan mainPlan;
	private User user;
	private int day;
	private Date dailyDate;
	private String dailyCity;
	private String dailyCountry;
	
	
	
	public int getDailyPlanNo() {
		return dailyPlanNo;
	}
	public void setDailyPlanNo(int dailyPlanNo) {
		this.dailyPlanNo = dailyPlanNo;
	}
	public MainPlan getMainPlan() {
		return mainPlan;
	}
	public void setMainPlan(MainPlan mainPlan) {
		this.mainPlan = mainPlan;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public Date getDailyDate() {
		return dailyDate;
	}
	public void setDailyDate(Date dailyDate) {
		this.dailyDate = dailyDate;
	}
	public String getDailyCity() {
		return dailyCity;
	}
	public void setDailyCity(String dailyCity) {
		this.dailyCity = dailyCity;
	}
	public String getDailyCountry() {
		return dailyCountry;
	}
	public void setDailyCountry(String dailyCountry) {
		this.dailyCountry = dailyCountry;
	}
	
	@Override
	public String toString() {
		return "DailyPlan [dailyPlanNo=" + dailyPlanNo + ", mainPlan=" + mainPlan + ", user=" + user + ", day=" + day
				+ ", dailyDate=" + dailyDate + ", dailyCity=" + dailyCity + ", dailyCountry=" + dailyCountry + "]";
	}

	
}
