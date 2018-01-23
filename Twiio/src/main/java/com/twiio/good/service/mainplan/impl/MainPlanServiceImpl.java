package com.twiio.good.service.mainplan.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.twiio.good.service.domain.MainPlan;
import com.twiio.good.service.domain.Scrap;
import com.twiio.good.service.mainplan.MainPlanDao;
import com.twiio.good.service.mainplan.MainPlanService;

@Service("mainPlanServiceImpl")
public class MainPlanServiceImpl implements MainPlanService {
	
	///Field
	@Autowired
	@Qualifier("mainPlanDaoImpl")
	private MainPlanDao mainPlanDao;
	
	///Constructor
	public MainPlanServiceImpl() {
	}
	
	///Method
	@Override
	public void addMainPlan(MainPlan mainPlan) throws Exception {
		mainPlanDao.addMainPlan(mainPlan);
	}

	@Override
	public MainPlan getMainPlan(int mainPlanNo) throws Exception {
		return mainPlanDao.getMainPlan(mainPlanNo);
	}

	@Override
	public List<MainPlan> getMainPlanList(MainPlan mainPlan) throws Exception {
		return mainPlanDao.getMainPlanList(mainPlan);
	}

	@Override
	public void updateMainPlan(MainPlan mainPlan) throws Exception {
		mainPlanDao.updateMainPlan(mainPlan);
	}

	@Override
	public void deleteMainPlan(int mainPlanNo) throws Exception {
		mainPlanDao.deleteMainPlan(mainPlanNo);
	}

	@Override
	public void addScrap(Scrap scrap) throws Exception {
		mainPlanDao.addScrap(scrap);
	}

	@Override
	public Scrap getScrap(int scrapNo) throws Exception {
		return mainPlanDao.getScrap(scrapNo);
	}

	@Override
	public List<Scrap> getScrapList(Scrap scrap) throws Exception {
		return mainPlanDao.getScrapList(scrap);
	}

	@Override
	public void deleteScrap(int scrapNo) throws Exception {
		mainPlanDao.deleteScrap(scrapNo);
	}

}
