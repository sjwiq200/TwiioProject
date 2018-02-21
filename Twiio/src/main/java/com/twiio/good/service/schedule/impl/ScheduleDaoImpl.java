package com.twiio.good.service.schedule.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.twiio.good.common.Search;
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
		
		Criteria criteria = new Criteria("roomKey");
		criteria.is(schedule.getRoomKey());

		Query query = new Query(criteria);
		System.out.println(mongoTemplate.find(query, Schedule.class, "schedules"));
		Schedule existSchedule = mongoTemplate.findOne(query, Schedule.class, "schedules");
		
		if(existSchedule == null) {
			
			mongoTemplate.insert(schedule,"schedules");
			//Oracle DB
			sqlSession.insert("ScheduleMapper.addSchedule",schedule);
			
		}
		
	}

	public Map<String, Object> listSchedule(Search search, int userNo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(this.getClass()+"listSchedule()");
		
		System.out.println("userNo"+userNo);
		Query query = new Query();
		query.addCriteria(Criteria.where("userNo").all(userNo));
		
		if(search.getSearchCondition() == null) {
			System.out.println("this is null");
		}else if(search.getSearchCondition().equals("0")) {
			System.out.println("SearchCondition 0");
			query.addCriteria(Criteria.where("scheduleDate").regex(search.getSearchKeyword(),"i"));
			
		}else if(search.getSearchCondition().equals("1")) {
			System.out.println("SearchCondition 1");
			query.addCriteria(Criteria.where("country").regex(search.getSearchKeyword(),"i"));
			
		}else if(search.getSearchCondition().equals("2")) {
			System.out.println("SearchCondition 2");
			query.addCriteria(Criteria.where("city").regex(search.getSearchKeyword(),"i"));
			
		}
		
		
		query.with(new Sort(Sort.Direction.DESC,"_id"));
		
		query.skip(search.getStartRowNum()-1);
		query.limit(search.getEndRowNum());
		
		Map<String, Object> map = new HashMap<>();
		
		System.out.println("listSchedule Result = >"+mongoTemplate.find(query, Schedule.class,"schedules"));
		int totalCount = (int)mongoTemplate.count(query, Schedule.class,"schedules");
		map.put("totalCount", totalCount);
		map.put("list", mongoTemplate.find(query, Schedule.class,"schedules"));
		return map;
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
		update.set("mapImg", schedule.getMapImg());

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



	@Override
	public Map<String, Object> listScheduleAll() throws Exception {
		// TODO Auto-generated method stub
		List<Schedule> list = sqlSession.selectList("ScheduleMapper.listSchedule");
		int totalCount = sqlSession.selectOne("ScheduleMapper.getTotalCount");
		Map<String, Object> map = new HashMap<>();
		
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
