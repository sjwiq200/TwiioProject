package com.twiio.good.service.schedule.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.twiio.good.service.domain.Schedule;
import com.twiio.good.service.schedule.ScheduleDao;

@Repository("scheduleDaoImpl")
public class ScheduleDaoImpl implements ScheduleDao {
	
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
	
	
	
	

}
