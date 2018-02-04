package com.twiio.good.service.schedule;

import java.util.List;

import com.twiio.good.service.domain.Schedule;

public interface ScheduleService {
	
	public void addSchedule(Schedule schedule) throws Exception;
	
	public List<Schedule> listSchedule(int userNo) throws Exception;
	
	public void updateSchedule(Schedule schedule) throws Exception;
	
	public Schedule getSchedule(String roomKey) throws Exception;

}
