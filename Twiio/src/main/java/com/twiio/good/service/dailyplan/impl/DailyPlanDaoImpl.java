package com.twiio.good.service.dailyplan.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.twiio.good.service.dailyplan.DailyPlanDao;

//@Repository("dailyPlanDaoImpl")
public class DailyPlanDaoImpl implements DailyPlanDao{
	
	///Field
		@Autowired
		@Qualifier("sqlSessionTemplate")
		private SqlSession sqlSession;
		
		
	public DailyPlanDaoImpl() {
	}


	@Override
	public void addDailyPlan(DailyPlan dailyPlan) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public DailyPlan getDailyPlan(int dailyPlanNo) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void updateDailyPlan(DailyPlan dailyPlan) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public List<DailyPlan> getDailyPlanList(DailyPlan dailyPlan) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void DailyPlan(int dailyPlanNo) {
		// TODO Auto-generated method stub
		
	}

	

}
