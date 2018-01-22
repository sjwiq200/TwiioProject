package com.twiio.good.service.mainplan.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.twiio.good.service.domain.MainPlan;
import com.twiio.good.service.domain.Scrap;
import com.twiio.good.service.mainplan.MainPlanDao;
import com.twiio.good.service.mainplan.MainPlanService;

@Service("mainPlanServiceImpl")
public class MainPlanServiceImpl implements MainPlanService {
	
	@Autowired
	@Qualifier("mainPlanDaoImpl")
	private MainPlanDao mainPlanDao;
	
	public MainPlanServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addMainPlan(MainPlan mainPlan) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MainPlan getMainPlan(int mainPlanNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MainPlan getMainPlanList(MainPlan mainPlan) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMainPlan(int mainPlanNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMainPlan(int mainPlanNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addScrap(Scrap scrap) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Scrap getScrap(int scrapNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Scrap getScrapList(Scrap scrap) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteScrap(int scrapNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
