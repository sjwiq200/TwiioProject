package com.twiio.good.service.room;

import java.util.List;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Room;
import com.twiio.good.service.domain.RoomUser;

public interface RoomService {

	public void addRoom(Room room) throws Exception;

	public List<Room> listRoom(Search search) throws Exception;

	public void addRoomUser(String roomKey, int userNo) throws Exception;

	public List<RoomUser> listMyRoom(int userNo) throws Exception;

	public Room getRoom(String roomKey) throws Exception;

	public List<RoomUser> listRoomUser(String roomKey) throws Exception;
	
	public void updateRoom(Room room) throws Exception;
	
	public void deleteRoom(Room room) throws Exception;
	
	public void deleteRoomUser(String roomKey) throws Exception;

}
