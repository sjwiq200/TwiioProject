package com.twiio.good.service.room.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Room;
import com.twiio.good.service.domain.RoomUser;
import com.twiio.good.service.room.RoomDao;
import com.twiio.good.service.room.RoomService;


@Service("roomServiceImpl")
public class RoomServiceImpl implements RoomService {

	@Autowired
	@Qualifier("roomDaoImpl")
	private RoomDao roomDao;

	public void setRoomDao(RoomDao roomDao) {
		this.roomDao = roomDao;
	}

	public RoomServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addRoom(Room room) throws Exception {
		// TODO Auto-generated method stub
		roomDao.addRoom(room);

	}

	@Override
	public List<Room> listRoom(Search search) throws Exception {
		// TODO Auto-generated method stub
		return roomDao.listRoom(search);

	}

	@Override
	public void addRoomUser(String roomKey, int userNo) throws Exception {
		// TODO Auto-generated method stub
		roomDao.addRoomUser(roomKey,userNo);

	}

	@Override
	public List<RoomUser> listMyRoom(int userNo) throws Exception {
		// TODO Auto-generated method stub
		return roomDao.listMyRoom(userNo);
	}

	@Override
	public Room getRoom(String roomKey) throws Exception {
		// TODO Auto-generated method stub
		return roomDao.getRoom(roomKey);
	}

	@Override
	public List<RoomUser> listRoomUser(String roomKey) throws Exception {
		// TODO Auto-generated method stub
		return roomDao.listRoomUser(roomKey);
	}

	@Override
	public void updateRoom(Room room) throws Exception {
		// TODO Auto-generated method stub
		roomDao.updateRoom(room);
		
	}

	@Override
	public void deleteRoom(Room room) throws Exception {
		// TODO Auto-generated method stub
		roomDao.deleteRoom(room);
	}

}
