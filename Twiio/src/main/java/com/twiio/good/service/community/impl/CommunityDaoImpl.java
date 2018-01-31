package com.twiio.good.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


import com.twiio.good.common.Search;
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
	public void addCommunity(Community community) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Daoimpl :: "+community);
		sqlSession.insert("CommunityMapper.addCommunity",community);
	}

	@Override
	public Community getCommunity(int communityNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CommunityMapper.getCommunity", communityNo);
	}

	@Override
	public void updateCommunity(Community community) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("CommunityMapper.updateCommunity",community);
	}

	@Override
	public void deleteCommunity(int communityNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("CommunityMapper.deleteCommunity",communityNo);
	}

	@Override
	public List<Community> listCommunity(Search search, String communityType) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String , Object>  map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("communityType", communityType);
		
		System.out.println("여기까지왔니 ??");
		System.out.println("coummnityType :: "+communityType);
		System.out.println("Search :: "+search);
		System.out.println("제발 나와라 ㅠㅠ :: "+sqlSession.selectList("CommunityMapper.listCommunity", map));
		List<Community> list = sqlSession.selectList("CommunityMapper.listCommunity", map);
//		for (int i = 0; i < list.size(); i++) {
//			list.get(i).setBuyer((User)sqlSession.selectOne("UserMapper.getUser", list.get(i).getBuyer().getUserId()));
//		}
		System.out.println("나오니??");
		System.out.println("list :: "+list);
		return list;
	}


	@Override
	public int getTotalCount(String communityType) throws Exception {
		System.out.println("totalcount 시작");
		return sqlSession.selectOne("CommunityMapper.getTotalCount", communityType);
	}
	
	@Override
	public void getBestTripReview() throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
}
