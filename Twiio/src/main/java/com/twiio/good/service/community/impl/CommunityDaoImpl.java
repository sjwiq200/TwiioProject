package com.twiio.good.service.community.impl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.twiio.good.service.community.CommunityDao;
import com.twiio.good.service.domain.Community;

@Service("communityDaoImpl")
public class CommunityDaoImpl implements CommunityDao{
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public CommunityDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addCommunity() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Community getCommunity() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateCommunity() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCommunity() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> listCommunity() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void getBestTripReview() throws Exception {
		// TODO Auto-generated method stub
		
	}
}
