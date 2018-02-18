package com.twiio.good.service.room.impl;

import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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
	public Map<String, Object> listRoom(Search search) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(this.getClass()+".listRoom()");
		System.out.println("roomDaoImpl == >" +search);
		Map<String, Object> map = new HashMap<>();
		List<Room> list;
		Query query = new Query();
		
		if(search.getSearchCondition() == null) {
			System.out.println("this is null");
			query.addCriteria(Criteria.where("open").is(true));
		}else if(search.getSearchCondition().equals("0")) {
			System.out.println("SearchCondition 0");
			query.addCriteria(Criteria.where("open").is(true).where("roomName").regex(search.getSearchKeyword(),"i"));
			
		}else if(search.getSearchCondition().equals("1")) {
			System.out.println("SearchCondition 1");
			query.addCriteria(Criteria.where("open").is(true).where("country").regex(search.getSearchKeyword(),"i"));
			
		}else if(search.getSearchCondition().equals("2")) {
			System.out.println("SearchCondition 2");
			query.addCriteria(Criteria.where("open").is(true).where("city").regex(search.getSearchKeyword(),"i"));
			
		}
		
		
		
		query.with(new Sort(Sort.Direction.DESC,"_id"));
		
		query.skip(search.getStartRowNum()-1); //start Num
		query.limit(search.getEndRowNum()); //end Num
//		Pageable pageable = new PageRequest(search.getStartRowNum(),search.getEndRowNum());
		
//		query.with(pageable);
		list = mongoTemplate.find(query, Room.class, "rooms");
		System.out.println("daoImpl ==>" + list);
		map.put("list", list);
		int totalCount = (int)mongoTemplate.count(query, Room.class,"rooms");
		map.put("totalCount", totalCount);

		return map;

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
	public Map<String, Object> listMyRoom(Search search, int userNo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(this.getClass()+"listMyRoom()");
		
		Map<String, Object> map = new HashMap<>();

		Criteria criteria = new Criteria("userNo");
		criteria.is(userNo);

		Query query = new Query(criteria);
		
		
		query.with(new Sort(Sort.Direction.DESC,"_id"));
		
		query.skip(search.getStartRowNum()-1); //start Num
		query.limit(search.getEndRowNum()); //end Num
		
		System.out.println("mongotemplate list ==>"+mongoTemplate.find(query, RoomUser.class, "roomUser"));
		List<RoomUser> list =mongoTemplate.find(query, RoomUser.class, "roomUser"); 
		
		List<Room> listRoom = new Vector<Room>();
		
		int totalCount = 0;
		
		for (RoomUser roomUser : list) {
			Criteria innerCriteria = new Criteria("roomKey");
			innerCriteria.is(roomUser.getRoomKey());

			Query innerQuery = new Query(innerCriteria);

			listRoom.add(mongoTemplate.findOne(innerQuery, Room.class, "rooms"));
		}
		
		List<Room> searchRoom = new Vector<>();
		for (Room room : listRoom) {
			if(search.getSearchCondition() == null) {
				searchRoom.add(room);
			}else if(search.getSearchCondition().equals("0")) {
				System.out.println("SearchCondition 0 roomName");
				if(room.getRoomName().toLowerCase().contains(search.getSearchKeyword().toLowerCase())) {
					searchRoom.add(room);
				}
				
			}else if(search.getSearchCondition().equals("1")) {
				System.out.println("SearchCondition 1 country");
				if(room.getCountry().toLowerCase().contains(search.getSearchKeyword().toLowerCase())) {
					searchRoom.add(room);
				}
				
			}else if(search.getSearchCondition().equals("2")) {
				if(room.getCity().toLowerCase().contains(search.getSearchKeyword().toLowerCase())) {
					searchRoom.add(room);
				}
			}
		}
		if(search.getSearchCondition() == null) {
			totalCount = (int)mongoTemplate.count(query, RoomUser.class,"roomUser");
		}else {
			totalCount = searchRoom.size();
		}
		
////////////////////////////////
		map.put("list", searchRoom);
		map.put("totalCount", totalCount);
		
		return map;
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

	@Override
	public void deleteRoomUser(String roomKey,int userNo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(this.getClass()+".deleteRoomUser()");
		
		Criteria criteria = new Criteria("roomKey");
		criteria.is(roomKey);
		Query query = new Query(criteria);
		
		query.addCriteria(Criteria.where("roomKey").is(roomKey).where("userNo").is(userNo));
		
		WriteResult roomUserResult = mongoTemplate.remove(query,"roomUser");
		System.out.println("delete roomUserResult"+roomUserResult.getN());
		
	}

	@Override
	public void updateRoomOpen(Room room) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(this.getClass()+".updateRoomOpen()");
		
		Criteria criteria = new Criteria("roomKey");
		criteria.is(room.getRoomKey());
		Query query = new Query(criteria);
		
		Update update = new Update();
		update.set("open", room.isOpen());

		mongoTemplate.updateFirst(query, update ,RoomUser.class, "rooms");
		
	}
	
	

}
