package com.twiio.good.service.dailyplan;

import java.util.List;
import java.util.Map;

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
	
	public void deletePlanContent(int dailyPlanNo);
	
	public void deletePlanContentEach(int contentNo);
	
	//friend_recommendation///////////////////////////////////////////////////
	
	public List<DailyPlan> listFriendRec(DailyPlan dailyPlan);
	
}
