package com.twiio.good.service.domain;

public class Room {
	
	private String _id;
	private String roomName;
	private String key;
	private String type; //말머리
	private String country;
	private String city;
	private String region;
	private int headCount;
	private String date;

	public Room() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass().getName());
	}

	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public int getHeadCount() {
		return headCount;
	}

	public void setHeadCount(int headCount) {
		this.headCount = headCount;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Room [_id=" + _id + ", roomName=" + roomName + ", key=" + key + ", type=" + type + ", country="
				+ country + ", city=" + city + ", region=" + region + ", headCount=" + headCount + ", date=" + date
				+ "]";
	}


	

}
