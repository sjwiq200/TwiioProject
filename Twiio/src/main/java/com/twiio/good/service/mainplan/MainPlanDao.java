package com.twiio.good.service.mainplan;

import java.util.List;

import com.twiio.good.service.domain.MainPlan;

public interface MainPlanDao {

	public void addMainPlan(MainPlan mainPlan);
	
	public MainPlan getMainPlan(int mainPlanNo);
	
	public void updateMainPlan(MainPlan mainPlanNo);

	public List<MainPlan> getMainPlanList(MainPlan mainPlanNo);

	public void deleteMainPlan(int mainPlanNo);
}
