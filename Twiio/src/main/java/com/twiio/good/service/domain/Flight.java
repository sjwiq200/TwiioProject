package com.twiio.good.service.domain;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Flight {
	
	private String departure;
	private String arrival;
	private String departureDate;
	private String arrivalDate;
	private String headCount;
	private String flightType;
	private String returnInfo;
	private String returnType;
	private String returnPrice;
	private String clickNum;
	private String returnUrl;
	

	public Flight() {
		
	}


	public String getDeparture() {
		return departure;
	}


	public void setDeparture(String departure) {
		this.departure = departure;
	}


	public String getArrival() {
		return arrival;
	}


	public void setArrival(String arrival) {
		this.arrival = arrival;
	}


	public String getDepartureDate() {
		return departureDate;
	}


	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}


	public String getArrivalDate() {
		return arrivalDate;
	}


	public void setArrivalDate(String arrivalDate) {
		this.arrivalDate = arrivalDate;
	}


	public String getHeadCount() {
		return headCount;
	}


	public void setHeadCount(String headCount) {
		this.headCount = headCount;
	}


	public String getFlightType() {
		return flightType;
	}


	public void setFlightType(String flightType) {
		this.flightType = flightType;
	}


	public String getReturnInfo() {
		return returnInfo;
	}


	public void setReturnInfo(String returnInfo) {
		this.returnInfo = returnInfo;
	}


	public String getReturnType() {
		return returnType;
	}


	public void setReturnType(String returnType) {
		this.returnType = returnType;
	}


	public String getReturnPrice() {
		return returnPrice;
	}


	public void setReturnPrice(String returnPrice) {
		this.returnPrice = returnPrice;
	}
	
	public String getClickNum() {
		return clickNum;
	}


	public void setClickNum(String clickNum) {
		this.clickNum = clickNum;
	}


	public String getReturnUrl() {
		return returnUrl;
	}


	public void setReturnUrl(String returnUrl) {
		this.returnUrl = returnUrl;
	}


	@Override
	public String toString() {
		return "Flight [departure=" + departure + ", arrival=" + arrival + ", departureDate=" + departureDate
				+ ", arrivalDate=" + arrivalDate + ", headCount=" + headCount + ", flightType=" + flightType
				+ ", returnInfo=" + returnInfo + ", returnType=" + returnType + ", returnPrice=" + returnPrice
				+ ", clickNum=" + clickNum + ", returnUrl=" + returnUrl + "]";
	}




}
