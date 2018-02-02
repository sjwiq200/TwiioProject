package com.twiio.good.service.schedule.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.twiio.good.service.domain.Schedule;
import com.twiio.good.service.schedule.ScheduleDao;
import com.twiio.good.service.schedule.ScheduleService;

@Service("scheduleServiceImpl")
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	@Qualifier("scheduleDaoImpl")
	private ScheduleDao scheduleDao;

	public ScheduleServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addSchedule(Schedule schedule) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(this.getClass()+"addSchedule()");
		scheduleDao.addSchedule(schedule);
		
	}
	
	public List<Schedule> listSchedule(int userNo) throws Exception{
		System.out.println(this.getClass()+"listSchedule()");
		
		return scheduleDao.listSchedule(userNo);
	}
	
	

}
