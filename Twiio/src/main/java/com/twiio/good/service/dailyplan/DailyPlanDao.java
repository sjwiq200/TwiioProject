package com.twiio.good.service.dailyplan;

import java.util.List;

import com.twiio.good.service.domain.DailyPlan;
import com.twiio.good.service.domain.PlanContent;

public interface DailyPlanDao {

	public void addDailyPlan(DailyPlan dailyPlan);
	
	public DailyPlan getDailyPlan(int dailyPlanNo);
	
	public void updateDailyPlan(DailyPlan dailyPlan);

	public List<DailyPlan> getDailyPlanList(int mainPlanNo);
	
	public void deleteDailyPlan(int mainPlanNo);

	//plan_content/////////////////////////////////////////////////////////////
	
	public List<PlanContent> getPlanContentList(int dailyPlanNo);
	
	public PlanContent getPlanContent(int dailyPlanNo);
	
	public int getPlanContentCount(int dailyPlanNo);
	
	public void addPlanContent(PlanContent planContent);
	
}
