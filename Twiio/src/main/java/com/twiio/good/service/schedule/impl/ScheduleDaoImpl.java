package com.twiio.good.service.schedule.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.twiio.good.service.domain.RoomUser;
import com.twiio.good.service.domain.Schedule;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.schedule.ScheduleDao;

@Repository("scheduleDaoImpl")
public class ScheduleDaoImpl implements ScheduleDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Autowired
	@Qualifier("mongoTemplate")
	private MongoTemplate mongoTemplate;
	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
	}
	
	

	public ScheduleDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addSchedule(Schedule schedule) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(this.getClass()+"addSchedule()");
		
		System.out.println("==>"+schedule);
		
		Criteria criteria = new Criteria("roomKey");
		criteria.is(schedule.getRoomKey());


		Query query = new Query(criteria);
		System.out.println(mongoTemplate.find(query, Schedule.class, "schedules"));
		Schedule existSchedule = mongoTemplate.findOne(query, Schedule.class, "schedules");
		System.out.println("1234==>"+existSchedule);
		if(existSchedule == null) {
			mongoTemplate.insert(schedule,"schedules");
			sqlSession.insert("ScheduleMapper.addSchedule",schedule);
		}
		
	}

	@Override
	public List<Schedule> listSchedule(int userNo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(this.getClass()+"listSchedule()");
		

		Query query = new Query();
		query.addCriteria(Criteria.where("userNo").all(userNo));
		
		System.out.println("listSchedule Result = >"+mongoTemplate.find(query, Schedule.class,"schedules"));
		return mongoTemplate.find(query, Schedule.class,"schedules");
	}

	@Override
	public void updateSchedule(Schedule schedule) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(this.getClass()+".updateSchedule()");
		
		Criteria criteria = new Criteria("roomKey");
		criteria.is(schedule.getRoomKey());

		Query query = new Query(criteria);
		
		Update update = new Update();
		update.set("scheduleTitle", schedule.getScheduleTitle());
		update.set("scheduleDate", schedule.getScheduleDate());
		update.set("scheduleAddress", schedule.getScheduleAddress());

		mongoTemplate.updateFirst(query, update ,Schedule.class, "schedules");
		sqlSession.update("ScheduleMapper.updateSchedule", schedule);
			
		
	}

	@Override
	public Schedule getSchedule(String roomKey) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(this.getClass()+"getSchedule()");
		
		Criteria criteria = new Criteria("roomKey");
		criteria.is(roomKey);

		Query query = new Query(criteria);
		
		System.out.println(mongoTemplate.findOne(query, Schedule.class, "schedules"));;
		return mongoTemplate.findOne(query, Schedule.class, "schedules");
	}
	
	
	
	
	
	
	
	
	

}
