package com.twiio.good.service.dailyplan.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.twiio.good.service.dailyplan.DailyPlanDao;
import com.twiio.good.service.dailyplan.DailyPlanService;
import com.twiio.good.service.domain.DailyPlan;

public class DailyPlanServiceImpl implements DailyPlanService{
	
	@Autowired
	@Qualifier("dailyPlanDaoImpl")
	private DailyPlanDao dailyPlanDao;
	
	public DailyPlanServiceImpl() {
		// TODO Auto-generated constructor stub
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
	public List<DailyPlan> getDailyPlanList(DailyPlan dailyPlan) throws Exception {
		return dailyPlanDao.getDailyPlanList(dailyPlan);
	}

	@Override
	public void updateDailyPlan(DailyPlan dailyPlan) throws Exception {
		dailyPlanDao.updateDailyPlan(dailyPlan);
	}

	@Override
	public void deleteDailyPlan(int dailyPlanNo) throws Exception {
		dailyPlanDao.deleteDailyPlan(dailyPlanNo);
	}

}
