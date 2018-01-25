package com.twiio.good.service.dailyplan.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.twiio.good.service.dailyplan.DailyPlanDao;
import com.twiio.good.service.domain.DailyPlan;

@Repository("dailyPlanDaoImpl")
public class DailyPlanDaoImpl implements DailyPlanDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public DailyPlanDaoImpl() {
		
	}
	
	@Override
	public void addDailyPlan(DailyPlan dailyPlan) {
		sqlSession.insert("DailyPlanMapper.addDailyPlan",dailyPlan);
	}

	@Override
	public DailyPlan getDailyPlan(int dailyPlanNo) {
		return sqlSession.selectOne("DailyPlanMapper.getDailyPlan",dailyPlanNo);
	}

	@Override
	public void updateDailyPlan(DailyPlan dailyPlan) {
		sqlSession.update("DailyPlanMapper.updateDailyPlan",dailyPlan);
	}

	@Override
	public List<DailyPlan> getDailyPlanList(int mainPlanNo) {
		return sqlSession.selectList("DailyPlanMapper.getDailyPlanList", mainPlanNo);
	}

	@Override
	public void deleteDailyPlan(int mainPlanNo) {
		sqlSession.delete("DailyPlanMapper.deleteDailyPlan",mainPlanNo);
	}
	

}
