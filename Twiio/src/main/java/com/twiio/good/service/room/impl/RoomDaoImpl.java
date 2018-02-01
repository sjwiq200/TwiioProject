package com.twiio.good.service.room.impl;

import java.security.MessageDigest;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Room;
import com.twiio.good.service.domain.RoomUser;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.room.RoomDao;


@Repository("roomDaoImpl")
public class RoomDaoImpl implements RoomDao {
	
	@Autowired
	@Qualifier("mongoTemplate")
	private MongoTemplate mongoTemplate;
	
	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
	}

	public RoomDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<Room> listRoom(Search search) throws Exception {
		// TODO Auto-generated method stub
		
//		Query query = new Query(new Criteria("roomname").all("nice"));
//		System.out.println(mongoTemplate.find(query, Room.class, "rooms"));
		List<Room> list = mongoTemplate.findAll(Room.class,"rooms");
		for (Room messenger : list) {
			System.out.println(messenger);
		}
		
		System.out.println(list);
	
		return mongoTemplate.findAll(Room.class,"rooms");
		
	}

	@Override
	public void addRoom(Room room) throws Exception {
		// TODO Auto-generated method stub
		
		//SHA-1 encrypto
				MessageDigest md = MessageDigest.getInstance("SHA-1");
				
				String mill = System.currentTimeMillis()/1000+"";
				System.out.println("second"+mill);
				md.update(mill.getBytes());
				
				byte byteData[] = md.digest();
				 
		        StringBuffer sb = new StringBuffer(); 
		        for(int i=0; i<byteData.length; i++) {
		            sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
		        }

		        String retVal = sb.toString().substring(0,6);
		        System.out.println(retVal);
		        ////////////////////////////////////////////////////////////////////////
		        room.setKey(retVal);
		        
		        
		        System.out.println("ROOMDAO"+room);
		        
		        
		        
				mongoTemplate.insert(room,"rooms");
				mongoTemplate.createCollection("chat"+retVal);
		
	}

	@Override
	public void addRoomUser(String roomKey, int userNo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("addRoomUser()");
		
		boolean flag = false;
		
		
		RoomUser roomUser = new RoomUser();
		roomUser.setRoomKey(roomKey);
		roomUser.setUserNo(userNo);
		
		
		Criteria criteria = new Criteria("userNo");
		criteria.is(userNo);
		
		Query query = new Query(criteria);
		
		List<RoomUser> list = mongoTemplate.find(query, RoomUser.class,"roomUser");
		
		
		for (RoomUser roomUserList : list) {
			System.out.println("roomUserList.getRoomKey()==>"+roomUserList.getRoomKey());
			if(roomUserList.getRoomKey().equals(roomKey)) {
				flag = true;
				break;
			}
		}
		
		if(!flag) {
			mongoTemplate.insert(roomUser,"roomUser");
		}
		
	}

	@Override
	public List<RoomUser> listMyRoom(int userNo) throws Exception {
		// TODO Auto-generated method stub
		
		Criteria criteria = new Criteria("userNo");
		criteria.is(userNo);
		 
				
		Query query = new Query(criteria);
		System.out.println(mongoTemplate.find(query, RoomUser.class, "roomUser"));
		return mongoTemplate.find(query, RoomUser.class, "roomUser");
	}

	@Override
	public Room getRoom(String roomKey) throws Exception {
		// TODO Auto-generated method stub
		
		Criteria criteria = new Criteria("key");
		criteria.is(roomKey);
		 
		Query query = new Query(criteria);
		
		
		return mongoTemplate.findOne(query, Room.class, "rooms");
	}
	
	
	
	
	
	
	
	
	

}
