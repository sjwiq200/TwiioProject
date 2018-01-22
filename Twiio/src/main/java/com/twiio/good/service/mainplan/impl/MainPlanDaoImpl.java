package com.twiio.good.service.mainplan.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.twiio.good.service.domain.MainPlan;
import com.twiio.good.service.mainplan.MainPlanDao;

@Repository("mainPlanDaoImpl")
public class MainPlanDaoImpl implements MainPlanDao{

	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	
	public MainPlanDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addMainPlan(MainPlan mainPlan) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MainPlan getMainPlan(int mainPlanNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMainPlan(MainPlan mainPlanNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<MainPlan> getMainPlanList(MainPlan mainPlanNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteMainPlan(int mainPlanNo) {
		// TODO Auto-generated method stub
		
	}

}
