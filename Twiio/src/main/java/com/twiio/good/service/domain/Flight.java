package com.twiio.good.service.domain;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Flight {
	
	private String departure;
	private String arrival;
	private String departureDate;
	private String arrivalDate;
	private String headCount;
	private String travellersType;
	private String flightType;
	private String way;
	private String cabinClass;
	private int price;
	private String departureTime;
	private String arrivalTime;
	private String takeTime;
	private String airline;
	private String airplane;
	private String travleAgency;
	

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


	public String getTravellersType() {
		return travellersType;
	}


	public void setTravellersType(String travellersType) {
		this.travellersType = travellersType;
	}


	public String getFlightType() {
		return flightType;
	}


	public void setFlightType(String flightType) {
		this.flightType = flightType;
	}


	public String getWay() {
		return way;
	}


	public void setWay(String way) {
		this.way = way;
	}


	public String getCabinClass() {
		return cabinClass;
	}


	public void setCabinClass(String cabinClass) {
		this.cabinClass = cabinClass;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getDepartureTime() {
		return departureTime;
	}


	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}


	public String getArrivalTime() {
		return arrivalTime;
	}


	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}


	public String getTakeTime() {
		return takeTime;
	}


	public void setTakeTime(String takeTime) {
		this.takeTime = takeTime;
	}


	public String getAirline() {
		return airline;
	}


	public void setAirline(String airline) {
		this.airline = airline;
	}


	public String getAirplane() {
		return airplane;
	}


	public void setAirplane(String airplane) {
		this.airplane = airplane;
	}


	public String getTravleAgency() {
		return travleAgency;
	}


	public void setTravleAgency(String travleAgency) {
		this.travleAgency = travleAgency;
	}


	@Override
	public String toString() {
		return "Flight [departure=" + departure + ", arrival=" + arrival + ", departureDate=" + departureDate
				+ ", arrivalDate=" + arrivalDate + ", headCount=" + headCount + ", travellersType=" + travellersType
				+ ", flightType=" + flightType + ", way=" + way + ", cabinClass=" + cabinClass + ", price=" + price
				+ ", departureTime=" + departureTime + ", arrivalTime=" + arrivalTime + ", takeTime=" + takeTime
				+ ", airline=" + airline + ", airplane=" + airplane + ", travleAgency=" + travleAgency + "]";
	}
	
	

}
