package com.twiio.good.service.room;

import java.util.List;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Room;
import com.twiio.good.service.domain.RoomUser;
import com.twiio.good.service.domain.User;


public interface RoomDao {
	
	public List<Room> listRoom(Search search) throws Exception;
	
	public void addRoom(Room room) throws Exception;
	
	public void addRoomUser(String roomKey, int userNo) throws Exception;
	
	public List<RoomUser> listMyRoom(int userNo) throws Exception;
	
	public Room getRoom(String roomKey) throws Exception;

}
