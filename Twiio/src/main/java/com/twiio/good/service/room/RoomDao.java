package com.twiio.good.service.room;

import java.util.List;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Room;
import com.twiio.good.service.domain.User;


public interface RoomDao {
	
public List<Room> getRoomList(Search search) throws Exception;
	
	public void addRoom(Room room) throws Exception;

}
