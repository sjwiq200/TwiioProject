package com.twiio.good.service.mainplan;

import com.twiio.good.service.domain.MainPlan;
import com.twiio.good.service.domain.Scrap;


public interface MainPlanService {

	///////////////////////mainPlan/////////////////////////
	
	public void addMainPlan(MainPlan mainPlan) throws Exception;
	
	public MainPlan getMainPlan(int mainPlanNo) throws Exception;
	
	public MainPlan getMainPlanList(MainPlan mainPlan) throws Exception;
	
	public void updateMainPlan(int mainPlanNo) throws Exception;
	
	public void deleteMainPlan(int mainPlanNo) throws Exception;
	
	///////////////////////scrap/////////////////////////
	
	public void addScrap(Scrap scrap) throws Exception;
	
	public Scrap getScrap(int scrapNo) throws Exception;
	
	public Scrap getScrapList(Scrap scrap) throws Exception;
	
	public void deleteScrap(int scrapNo) throws Exception;
	
	
}
