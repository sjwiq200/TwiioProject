package com.twiio.good.service.dailyplan.impl;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.twiio.good.service.dailyplan.DailyPlanDao;
import com.twiio.good.service.dailyplan.DailyPlanService;
import com.twiio.good.service.domain.DailyPlan;
import com.twiio.good.service.domain.PlanContent;

@Service("dailyPlanServiceImpl")
public class DailyPlanServiceImpl implements DailyPlanService{
	
	@Autowired
	@Qualifier("dailyPlanDaoImpl")
	private DailyPlanDao dailyPlanDao;
	
	public DailyPlanServiceImpl() {
	}

	@Override
	public void addDailyPlan(DailyPlan dailyPlan) throws Exception {
		dailyPlanDao.addDailyPlan(dailyPlan);
	}

	@Override
	public DailyPlan getDailyPlan(int dailyPlanNo) throws Exception {
		return dailyPlanDao.getDailyPlan(dailyPlanNo);
	}

	@Override
	public List<DailyPlan> getDailyPlanList(int mainPlanNo) throws Exception {
		return dailyPlanDao.getDailyPlanList(mainPlanNo);
	}

	@Override
	public void updateDailyPlan(DailyPlan dailyPlan) throws Exception {
		dailyPlanDao.updateDailyPlan(dailyPlan);
	}

	@Override
	public void deleteDailyPlan(int mainPlanNo) throws Exception {
		dailyPlanDao.deleteDailyPlan(mainPlanNo);
	}

	@Override
	public List<PlanContent> getPlanContentList(int dailyPlanNo) throws Exception {
		return dailyPlanDao.getPlanContentList(dailyPlanNo);
	}

	@Override
	public int getPlanContentCount(int dailyPlanNo) throws Exception {
		return dailyPlanDao.getPlanContentCount(dailyPlanNo);
	}

	@Override
	public void addPlanContent(PlanContent planContent) throws Exception {
		dailyPlanDao.addPlanContent(planContent);
	}

	@Override
	public void deletePlanContent(int dailyPlanNo) throws Exception {
		dailyPlanDao.deletePlanContent(dailyPlanNo);
	}

	@Override
	public void deletePlanContentEach(int contentNo) throws Exception {
		dailyPlanDao.deletePlanContentEach(contentNo);
	}
	
	//friend_recommendation///////////////////////////////////////////////////
	
	@Override
	public List<DailyPlan> listFriendRec(DailyPlan dailyPlan) throws Exception {
		return dailyPlanDao.listFriendRec(dailyPlan);
	}

	@Override
	public List<DailyPlan> listPlanForFixedSchedule(DailyPlan dailyPlan) throws Exception {
		return dailyPlanDao.listPlanForFixedSchedule(dailyPlan);
	}

}
