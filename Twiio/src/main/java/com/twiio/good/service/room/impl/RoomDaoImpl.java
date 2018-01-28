package com.twiio.good.service.room.impl;

import java.security.MessageDigest;
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
	public List<Room> getRoomList(Search search) throws Exception {
		// TODO Auto-generated method stub
		
		
		Query query = new Query(new Criteria("roomname").all("nice"));
		System.out.println(mongoTemplate.find(query, Room.class, "rooms"));
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
	
	

}
