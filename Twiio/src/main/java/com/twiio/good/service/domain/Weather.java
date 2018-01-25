package com.twiio.good.service.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;


public class Weather {
	

	private Coord coord;
	private WeatherState weather;
	private String base;
	private WeatherMain main;
	private String visibility;
	private Wind wind;
	private Clouds clouds;
	private String dt;
	private Sys sys;
	private String id;
	private String name;
	private String cod;
	
	
	
	public Coord getCoord() {
		return coord;
	}
	public void setCoord(Coord coord) {
		this.coord = coord;
	}
	
	public WeatherState getWeather() {
		return weather;
	}
	public void setWeather(WeatherState weather) {
		this.weather = weather;
	}
	public String getBase() {
		return base;
	}
	public void setBase(String base) {
		this.base = base;
	}
	public WeatherMain getMain() {
		return main;
	}
	public void setMain(WeatherMain main) {
		this.main = main;
	}
	public String getVisibility() {
		return visibility;
	}
	public void setVisibility(String visibility) {
		this.visibility = visibility;
	}

	
	public String getDt() {
		return dt;
	}
	public void setDt(String dt) {
		this.dt = dt;
	}
	
	public Wind getWind() {
		return wind;
	}
	public void setWind(Wind wind) {
		this.wind = wind;
	}
	public Clouds getClouds() {
		return clouds;
	}
	public void setClouds(Clouds clouds) {
		this.clouds = clouds;
	}
	public Sys getSys() {
		return sys;
	}
	public void setSys(Sys sys) {
		this.sys = sys;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCod() {
		return cod;
	}
	public void setCod(String cod) {
		this.cod = cod;
	}
	
	@Override
	public String toString() {
		return "Weather [coord=" + coord + ", weather=" + weather + ", base=" + base + ", main=" + main
				+ ", visibility=" + visibility + ", wind=" + wind + ", clouds=" + clouds + ", dt=" + dt + ", sys=" + sys
				+ ", id=" + id + ", name=" + name + ", cod=" + cod + "]";
	}
	
	public class WeatherMain {
		
		private String temp;
		private String pressure;
		private String humidity;
		private String temp_min;
		private String temp_max;
		
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
		
		@Override
		public String toString() {
			return "WeatherMain [temp=" + temp + ", pressure=" + pressure + ", humidity=" + humidity + ", temp_min="
					+ temp_min + ", temp_max=" + temp_max + "]";
		}
		
		
		
		
		
		
	}
	
	
	
	/////////////
	
	public class WeatherState {
		
		private String id;
		private String main;
		private String description;
		private String icon;
		
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
	//////////
	
	public class Coord{
		private String lon;
		private String lat;
		public String getLon() {
			return lon;
		}
		public void setLon(String lon) {
			this.lon = lon;
		}
		public String getLat() {
			return lat;
		}
		public void setLat(String lat) {
			this.lat = lat;
		}
		
	}
	
	public class Wind{
		
		private String speed;
		private String deg;
		public String getSpeed() {
			return speed;
		}
		public void setSpeed(String speed) {
			this.speed = speed;
		}
		public String getDeg() {
			return deg;
		}
		public void setDeg(String deg) {
			this.deg = deg;
		}
		
		
	}
	
	public class Clouds{
		
		private String all;

		public String getAll() {
			return all;
		}

		public void setAll(String all) {
			this.all = all;
		}
		
		
		
		
	}
	
	public class Sys{
		private String type;
		private String id;
		private String message;
		private String country;
		private String sunrise;
		private String sunset;
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		public String getCountry() {
			return country;
		}
		public void setCountry(String country) {
			this.country = country;
		}
		public String getSunrise() {
			return sunrise;
		}
		public void setSunrise(String sunrise) {
			this.sunrise = sunrise;
		}
		public String getSunset() {
			return sunset;
		}
		public void setSunset(String sunset) {
			this.sunset = sunset;
		}
		
		
		
	}
	
}