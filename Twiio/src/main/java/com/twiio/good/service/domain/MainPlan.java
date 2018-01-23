package com.twiio.good.service.domain;

import java.sql.Date;

public class MainPlan {

	public MainPlan() {
		// TODO Auto-generated constructor stub
	}
	
	private int mainPlanNo;
	private User user;
	private Date departureDate;
	private Date arrivalDate;
	private String country;
	private String city;
	private String planTitle;
	private String mainThumbnail;
	
	private int startClick;
	private int endClick;
	
	////////////////////클릭수에 따른 메인 섬네일 개수 표헌////
	
	
	public int getStartClick() {
		return startClick;
	}
	public void setStartClick(int startClick) {
		this.startClick = startClick;
	}
	public int getEndClick() {
		return endClick;
	}
	public void setEndClick(int endClick) {
		this.endClick = endClick;
	}
	
	///////////////////////////////////////////////////////////
	public int getMainPlanNo() {
		return mainPlanNo;
	}
	public void setMainPlanNo(int mainPlanNo) {
		this.mainPlanNo = mainPlanNo;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(Date departureDate) {
		this.departureDate = departureDate;
	}
	public Date getArrivalDate() {
		return arrivalDate;
	}
	public void setArrivalDate(Date arrivalDate) {
		this.arrivalDate = arrivalDate;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPlanTitle() {
		return planTitle;
	}
	public void setPlanTitle(String planTitle) {
		this.planTitle = planTitle;
	}
	public String getMainThumbnail() {
		return mainThumbnail;
	}
	public void setMainThumbnail(String mainThumbnail) {
		this.mainThumbnail = mainThumbnail;
	}
	@Override
	public String toString() {
		return "MainPlan [mainPlanNo=" + mainPlanNo + ", user=" + user + ", departureDate=" + departureDate
				+ ", arrivalDate=" + arrivalDate + ", country=" + country + ", city=" + city + ", planTitle="
				+ planTitle + ", mainThumbnail=" + mainThumbnail + ", startClick=" + startClick + ", endClick="
				+ endClick + "]";
	}
	
	

}
