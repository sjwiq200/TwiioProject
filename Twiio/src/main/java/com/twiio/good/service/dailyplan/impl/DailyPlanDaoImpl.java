package com.twiio.good.service.dailyplan.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.twiio.good.service.dailyplan.DailyPlanDao;
import com.twiio.good.service.domain.DailyPlan;
import com.twiio.good.service.domain.PlanContent;

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
	
	////plan_content/////////////////////////////////////////////////////////////////////

	@Override
	public List<PlanContent> getPlanContentList(int dailyPlanNo) {
		return sqlSession.selectList("PlanContentMapper.getPlanContentList",dailyPlanNo);
	}

	@Override
	public PlanContent getPlanContent(int dailyPlanNo) {
		return sqlSession.selectOne("PlanContentMapper.getPlanContent",dailyPlanNo);
	}

	@Override
	public int getPlanContentCount(int dailyPlanNo) {
		return sqlSession.selectOne("PlanContentMapper.getPlanContentCount",dailyPlanNo);
	}

	@Override
	public void addPlanContent(PlanContent planContent) {
		sqlSession.insert("PlanContentMapper.addPlanContent", planContent);
	}

	@Override
	public void deletePlanContent(int dailyPlanNo) {
		sqlSession.delete("PlanContentMapper.deletePlanContent",dailyPlanNo);
	}
	
	@Override
	public void deletePlanContentEach(int contentNo) {
		sqlSession.delete("PlanContentMapper.deletePlanContentEach",contentNo);
	}
	
	//friend_recommendation///////////////////////////////////////////////////
	@Override
	public List<DailyPlan> listFriendRec(DailyPlan dailyPlan) {
		return sqlSession.selectList("DailyPlanMapper.listFriendRec", dailyPlan);
	}


}
