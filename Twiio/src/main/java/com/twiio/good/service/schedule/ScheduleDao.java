package com.twiio.good.service.schedule;

import java.util.List;

import com.twiio.good.service.domain.Schedule;

public interface ScheduleDao {
	
	public void addSchedule(Schedule schedule) throws Exception;
	
	public List<Schedule> listSchedule(int userNo) throws Exception;
	

}
