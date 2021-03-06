package com.twiio.good.service.dailyplan;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.twiio.good.service.domain.DailyPlan;
import com.twiio.good.service.domain.PlanContent;

public interface DailyPlanService {
	
	public void addDailyPlan(DailyPlan dailyPlan) throws Exception;
	
	
	public DailyPlan getDailyPlan(int dailyPlanNo) throws Exception;
	
	public List<DailyPlan> getDailyPlanList(int mainPlanNo) throws Exception;
	
	public List<DailyPlan> listPlanForFixedSchedule(DailyPlan dailyPlan) throws Exception;
	
	public void updateDailyPlan(DailyPlan dailyPlan) throws Exception;
	
	public void deleteDailyPlan(int mainPlanNo) throws Exception;
	
	//////////////////////////////////////////////////////////////////////////////
	
	public List<PlanContent> getPlanContentList(int dailyPlanNo) throws Exception;
	
	public int getPlanContentCount(int dailyPlanNo) throws Exception;
	
	public void addPlanContent(PlanContent planContent) throws Exception;
	
	public void deletePlanContent(int dailyPlanNo) throws Exception;
	
	public void deletePlanContentEach(int contentNo) throws Exception;
	
	//friend_recommendation///////////////////////////////////////////////////
	
	public List<DailyPlan> listFriendRec(DailyPlan dailyPlan) throws Exception;
}
