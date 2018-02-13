package com.twiio.good.service.schedule;

import java.util.List;
import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Schedule;

public interface ScheduleService {
	
	public void addSchedule(Schedule schedule) throws Exception;
	
	public Map<String, Object> listSchedule(Search search,int userNo) throws Exception;
	
	public void updateSchedule(Schedule schedule) throws Exception;
	
	public Schedule getSchedule(String roomKey) throws Exception;
	
	public Map<String, Object> listScheduleAll() throws Exception;

}
