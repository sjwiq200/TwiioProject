package com.twiio.good.service.domain;

public class Hotel {
	
	private String city;
	private String checkIn;
	private String checkOut;
	private String keyword;
	private String headCount;
	

	public Hotel() {
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getCheckIn() {
		return checkIn;
	}


	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}


	public String getCheckOut() {
		return checkOut;
	}


	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public String getHeadCount() {
		return headCount;
	}


	public void setHeadCount(String headCount) {
		this.headCount = headCount;
	}


	@Override
	public String toString() {
		return "Hotel [city=" + city + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", keyword=" + keyword
				+ ", headCount=" + headCount + "]";
	}
	

}
