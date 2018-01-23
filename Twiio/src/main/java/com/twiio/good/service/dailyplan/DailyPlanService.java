package com.twiio.good.service.dailyplan;

import java.util.List;

import com.twiio.good.service.domain.DailyPlan;

public interface DailyPlanService {
	
	public void addDailyPlan(DailyPlan dailyPlan) throws Exception;
	
	
	public DailyPlan getDailyPlan(int dailyPlanNo) throws Exception;
	
	public List<DailyPlan> getDailyPlanList(DailyPlan dailyPlan) throws Exception;
	
	public void updateDailyPlan(DailyPlan dailyPlan) throws Exception;
	
	public void deleteDailyPlan(int dailyPlanNo) throws Exception;
	

}
