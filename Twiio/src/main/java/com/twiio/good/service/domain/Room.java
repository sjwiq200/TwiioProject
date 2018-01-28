package com.twiio.good.service.domain;

public class Room {
	
	private String _id;
	private String roomname;
	private String key;
	private String online;

	public Room() {
		// TODO Auto-generated constructor stub
	}

	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getOnline() {
		return online;
	}

	public void setOnline(String online) {
		this.online = online;
	}

	@Override
	public String toString() {
		return "Room [_id=" + _id + ", roomname=" + roomname + ", key=" + key + ", online=" + online + "]";
	}
	
	

}
