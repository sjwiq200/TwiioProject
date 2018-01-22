package com.twiio.good.service.domain;

import java.sql.Date;

public class TotalSearch {
	private String keyword;
	private Room room;
	private Community community;
	private Weather weather;
	private Product product;
	private NightLife nightlife;
	private UnsafeRegion unsafeRegion;
	private Currency currency;
	
	
	public TotalSearch() {
	}


	


	public String getKeyword() {
		return keyword;
	}





	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}





	public Room getRoom() {
		return room;
	}





	public void setRoom(Room room) {
		this.room = room;
	}





	public Community getCommunity() {
		return community;
	}





	public void setCommunity(Community community) {
		this.community = community;
	}





	public Weather getWeather() {
		return weather;
	}





	public void setWeather(Weather weather) {
		this.weather = weather;
	}





	public Product getProduct() {
		return product;
	}





	public void setProduct(Product product) {
		this.product = product;
	}





	public NightLife getNightlife() {
		return nightlife;
	}





	public void setNightlife(NightLife nightlife) {
		this.nightlife = nightlife;
	}





	public UnsafeRegion getUnsafeRegion() {
		return unsafeRegion;
	}





	public void setUnsafeRegion(UnsafeRegion unsafeRegion) {
		this.unsafeRegion = unsafeRegion;
	}





	public Currency getCurrency() {
		return currency;
	}





	public void setCurrency(Currency currency) {
		this.currency = currency;
	}





	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "TotalSearch [keyword=" + keyword + ", room=" + room + ", community=" + community + ", weather="
				+ weather + ", product=" + product + ", nightlife=" + nightlife + ", unsafeRegion=" + unsafeRegion
				+ ", currency=" + currency+" ]";
	}
	
}
