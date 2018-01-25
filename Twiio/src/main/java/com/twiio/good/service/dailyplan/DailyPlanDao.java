package com.twiio.good.service.dailyplan;

import java.util.List;

import com.twiio.good.service.domain.DailyPlan;

public interface DailyPlanDao {

	public void addDailyPlan(DailyPlan dailyPlan);
	
	public DailyPlan getDailyPlan(int dailyPlanNo);
	
	public void updateDailyPlan(DailyPlan dailyPlan);

	public List<DailyPlan> getDailyPlanList(int mainPlanNo);

	public void deleteDailyPlan(int mainPlanNo);
}
