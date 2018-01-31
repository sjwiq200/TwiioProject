package com.twiio.good.service.mainplan;

import java.util.List;

import com.twiio.good.service.domain.MainPlan;
import com.twiio.good.service.domain.Scrap;

public interface MainPlanDao {

	public void addMainPlan(MainPlan mainPlan);
	
	public MainPlan getMainPlan(int mainPlanNo);
	
	public void updateMainPlan(MainPlan mainPlanNo);

	public List<MainPlan> getMainPlanList(MainPlan mainPlan);

	public void deleteMainPlan(int mainPlanNo);
	
	///////////////////scrap/////////////////
	
	public void addScrap(Scrap scrap);
	
	public Scrap getScrap(int scrapNo);
	
	public List<Scrap> listScrap(int userNo);
	
	public void deleteScrap(int scrapNo);
	
}
