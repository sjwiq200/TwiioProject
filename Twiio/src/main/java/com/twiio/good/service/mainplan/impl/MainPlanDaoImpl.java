package com.twiio.good.service.mainplan.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.twiio.good.service.domain.MainPlan;
import com.twiio.good.service.domain.Scrap;
import com.twiio.good.service.mainplan.MainPlanDao;

@Repository("mainPlanDaoImpl")
public class MainPlanDaoImpl implements MainPlanDao{

	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	///Constructor
	public MainPlanDaoImpl() {
	}

	///Method
	@Override
	public void addMainPlan(MainPlan mainPlan) {
		sqlSession.insert("MainPlanMapper.addMainPlan",mainPlan);
	}

	@Override
	public MainPlan getMainPlan(int mainPlanNo) {
		return sqlSession.selectOne("MainPlanMapper.getMainPlan",mainPlanNo);
	}

	@Override
	public void updateMainPlan(MainPlan mainPlan) {
		sqlSession.update("MainPlanMapper.updateMainPlan",mainPlan);
	}

	@Override
	public List<MainPlan> getMainPlanList(MainPlan mainPlan) {
		return sqlSession.selectList("MainPlanMapper.getMainPlanList",mainPlan);
	}

	@Override
	public void deleteMainPlan(int mainPlanNo) {
		sqlSession.delete("MainPlanMapper.deleteMainPlan",mainPlanNo);
	}

	@Override
	public void addScrap(Scrap scrap) {
		sqlSession.insert("ScrapMapper.addScrap",scrap);
	}

	@Override
	public Scrap getScrap(int scrapNo) {
		return sqlSession.selectOne("ScrapMapper.getScrap", scrapNo);
	}

	@Override
	public List<Scrap> listScrap(int userNo) {
		return sqlSession.selectList("ScrapMapper.listScrap", userNo);
	}

	@Override
	public void deleteScrap(int scrapNo) {
		sqlSession.delete("ScrapMapper.deleteScrap",scrapNo);
	}

}
