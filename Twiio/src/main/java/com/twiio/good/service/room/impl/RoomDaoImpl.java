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
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.mongodb.WriteResult;
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
		System.out.println(this.getClass()+".listRoom()");
		List<Room> list = null;
		Query query = new Query();
		
		
		if(search.getSearchCondition().equals("0")) {
			query.addCriteria(Criteria.where("roomName").all(search.getSearchKeyword()));
		}else if(search.getSearchCondition().equals("1")) {
			query.addCriteria(Criteria.where("country").all(search.getSearchKeyword()));
		}else if(search.getSearchCondition().equals("2")) {
			query.addCriteria(Criteria.where("city").all(search.getSearchKeyword()));
		}else {
//			 list = mongoTemplate.findAll(Room.class,"rooms");
			query.addCriteria(Criteria.where("roomKey"));
		}
		list = mongoTemplate.find(query, Room.class, "rooms");

		return list;

	}

	@Override
	public void addRoom(Room room) throws Exception {
		// TODO Auto-generated method stub

		System.out.println(this.getClass()+".addRoom()");

		//SHA-1 encrypto
		MessageDigest md = MessageDigest.getInstance("SHA-1");

		String mill = System.currentTimeMillis()/1000+"";

		md.update(mill.getBytes());

		byte byteData[] = md.digest();

        StringBuffer sb = new StringBuffer();
        for(int i=0; i<byteData.length; i++) {
            sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
        }

        String retVal = sb.toString().substring(0,6); //encypto Key
        
        room.setRoomKey(retVal);

        //Add Room & Create Chat
		mongoTemplate.insert(room,"rooms");
		mongoTemplate.createCollection("chat"+retVal);
		
		//Add RoomUser
		RoomUser roomUser = new RoomUser();
		roomUser.setRoomKey(retVal);
		roomUser.setUserNo(room.getUserNo());
		mongoTemplate.insert(roomUser,"roomUser");

	}

	@Override
	public void addRoomUser(String roomKey, int userNo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(this.getClass()+"addRoomUser()");

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
		System.out.println(this.getClass()+"listMyRoom()");

		Criteria criteria = new Criteria("userNo");
		criteria.is(userNo);

		Query query = new Query(criteria);
		System.out.println(mongoTemplate.find(query, RoomUser.class, "roomUser"));
		return mongoTemplate.find(query, RoomUser.class, "roomUser");
	}

	@Override
	public Room getRoom(String roomKey) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(this.getClass()+".getRoom()");

		Criteria criteria = new Criteria("roomKey");
		criteria.is(roomKey);

		Query query = new Query(criteria);


		return mongoTemplate.findOne(query, Room.class, "rooms");
	}

	@Override
	public List<RoomUser> listRoomUser(String roomKey) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(this.getClass()+".listRoomUser()");

		Criteria criteria = new Criteria("roomKey");
		criteria.is(roomKey);

		Query query = new Query(criteria);

		return mongoTemplate.find(query, RoomUser.class, "roomUser");
	}

	@Override
	public void updateRoom(Room room) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(this.getClass()+".updateRoom()");
		
		Criteria criteria = new Criteria("roomKey");
		criteria.is(room.getRoomKey());

		Query query = new Query(criteria);
		
		Update update = new Update();
		update.set("roomName", room.getRoomName());
		update.set("type", room.getType());
		update.set("region", room.getRegion());
		update.set("headCount", room.getHeadCount());
		update.set("date", room.getDate());

		mongoTemplate.updateFirst(query, update ,RoomUser.class, "rooms");
		
		
		
	}

	@Override
	public void deleteRoom(Room room) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(this.getClass()+".deleteRoom()");
		
		
		// drop of rooms
		Criteria criteria = new Criteria("roomKey");
		criteria.is(room.getRoomKey());
		Query query = new Query(criteria);
		
		WriteResult roomResult = mongoTemplate.remove(query, "rooms");
		
		System.out.println("delete roomResult"+roomResult.getN());
		
		// drop chat collection
		mongoTemplate.dropCollection("chat"+room.getRoomKey());
		
		//drop of roomUser
		WriteResult roomUserResult = mongoTemplate.remove(query, "roomUser");
		System.out.println("delete roomUserResult"+roomUserResult.getN());
		
		
	}
	
	
	
	


}
