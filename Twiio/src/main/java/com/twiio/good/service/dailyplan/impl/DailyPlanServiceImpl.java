package com.twiio.good.service.dailyplan.impl;

import java.util.List;

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

}
