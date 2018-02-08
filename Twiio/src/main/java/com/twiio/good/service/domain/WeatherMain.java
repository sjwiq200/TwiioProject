package com.twiio.good.service.domain;
import java.sql.Date;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.springframework.web.multipart.MultipartFile;


@JsonIgnoreProperties(ignoreUnknown=true)
public class WeatherMain {
	
	private String temp;
	private String pressure;
	private String humidity;
	private String temp_min;
	private String temp_max;
	private String grnd_level;
	private String sea_level;
	
	public String getTemp() {
		return temp;
	}
	public void setTemp(String temp) {
		this.temp = temp;
	}
	public String getPressure() {
		return pressure;
	}
	public void setPressure(String pressure) {
		this.pressure = pressure;
	}
	public String getHumidity() {
		return humidity;
	}
	public void setHumidity(String humidity) {
		this.humidity = humidity;
	}
	public String getTemp_min() {
		return temp_min;
	}
	public void setTemp_min(String temp_min) {
		this.temp_min = temp_min;
	}
	public String getTemp_max() {
		return temp_max;
	}
	public void setTemp_max(String temp_max) {
		this.temp_max = temp_max;
	}
	
	public String getGrnd_level() {
		return grnd_level;
	}
	public void setGrnd_level(String grnd_level) {
		this.grnd_level = grnd_level;
	}
	public String getSea_level() {
		return sea_level;
	}
	public void setSea_level(String sea_level) {
		this.sea_level = sea_level;
	}
	@Override
	public String toString() {
		return "WeatherMain [temp=" + temp + ", pressure=" + pressure + ", humidity=" + humidity + ", temp_min="
				+ temp_min + ", temp_max=" + temp_max +", grnd_level=" + grnd_level + ", sea_level="+sea_level+ "]";
	}
	
	
	
	
	
	
}