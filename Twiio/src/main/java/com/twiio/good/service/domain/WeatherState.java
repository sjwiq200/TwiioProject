package com.twiio.good.service.domain;


public class WeatherState {
	
	private String icon;
	private String description;
	private String main;
	private String id;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMain() {
		return main;
	}
	public void setMain(String main) {
		this.main = main;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	@Override
	public String toString() {
		return "WeatherState [id=" + id + ", main=" + main + ", description=" + description + ", icon=" + icon + "]";
	}
	

	
}