package com.twiio.good.service.room;

import java.util.List;
import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Room;
import com.twiio.good.service.domain.RoomUser;
import com.twiio.good.service.domain.User;


public interface RoomDao {

	public Map<String, Object> listRoom(Search search) throws Exception;

	public void addRoom(Room room) throws Exception;

	public void addRoomUser(String roomKey, int userNo) throws Exception;

	public Map<String, Object> listMyRoom(Search search, int userNo) throws Exception;

	public Room getRoom(String roomKey) throws Exception;

	public List<RoomUser> listRoomUser(String roomKey) throws Exception;
	
	public void updateRoom(Room room) throws Exception;
	
	public void deleteRoom(Room room) throws Exception;
	
	public void deleteRoomUser(String roomKey) throws Exception;
	
	public void updateRoomOpen(Room room) throws Exception;

}
