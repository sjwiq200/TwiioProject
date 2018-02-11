package com.twiio.good.service.domain;

import java.sql.Date;
import java.util.Arrays;

public class MainPlan {

	public MainPlan() {
		// TODO Auto-generated constructor stub
	}
	
	private int mainPlanNo;
	private User user;
	private Date departureDate;
	private Date arrivalDate;
	private String country;
	private String[] cityList;
	private String[] countryList;
	private String city;
	private String planTitle;
	private String mainThumbnail;
	private int endClick;
	
	////////////////////Ŭ������ ���� ���� ������ ���� ǥ��////

	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
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
	public String[] getCityList() {
		return cityList;
	}
	public void setCityList(String[] cityList) {
		this.cityList = cityList;
	}
	
	public String[] getCountryList() {
		return countryList;
	}
	public void setCountryList(String[] countryList) {
		this.countryList = countryList;
	}
	@Override
	public String toString() {
		return "MainPlan [mainPlanNo=" + mainPlanNo + ", user=" + user + ", departureDate=" + departureDate
				+ ", arrivalDate=" + arrivalDate + ", country=" + country + ", cityList=" + Arrays.toString(cityList)
				+ ", countryList=" + Arrays.toString(countryList) + ", city=" + city + ", planTitle=" + planTitle
				+ ", mainThumbnail=" + mainThumbnail + ", endClick=" + endClick + "]";
	}
	
	

}
