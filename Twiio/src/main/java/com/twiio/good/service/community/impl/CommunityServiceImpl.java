package com.twiio.good.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


import com.twiio.good.common.Search;
import com.twiio.good.service.common.CommonDao;
import com.twiio.good.service.community.CommunityDao;
import com.twiio.good.service.community.CommunityService;
import com.twiio.good.service.domain.Community;

@Service("communityServiceImpl")
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	@Qualifier("communityDaoImpl")
	private CommunityDao communityDao;
	
	@Autowired
	@Qualifier("commonDaoImpl")
	private CommonDao commonDao;
	
	public void setCommunityDao(CommunityDao communityDao) {
		this.communityDao = communityDao;
	}
	
	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}
	
	
	public CommunityServiceImpl() {
		System.out.println(this.getClass());
	}
	
	public void addCommunity(Community community) throws Exception{
			System.out.println("serviceImpl :: "+community);
			communityDao.addCommunity(community);
	}
	
	
	public Community getCommunity(int communityNo) throws Exception{
		//List<Reply> list = commonDao.listReply(search, targetType, codeNo);
		Community community = communityDao.getCommunity(communityNo);
		System.out.println("serviceImpl 전 :: "+community.getViewCount());
		communityDao.updateViewCommunity(community);
		System.out.println("serviceImpl 후 :: "+community.getViewCount());
		System.out.println("serviceImpl 업데이트 :: "+community.getViewCount());
		return community;
	}
	
	
	public void updateCommunity(Community community) throws Exception{
		communityDao.updateCommunity(community);
	}
	
	
	public void deleteCommunity(int communityNo) throws Exception{
		communityDao.deleteCommunity(communityNo);
	}
	
	
	public Map<String, Object> listCommunity(Search search, String communityType) throws Exception{
		System.out.println("ServiceImpl listCommunity 리스트 검색  시작");
		List<Community> list= communityDao.listCommunity(search, communityType);
		System.out.println("ServiceImpl listCommunity 리스트 검색 종료");
		
		System.out.println("ServiceImpl listCommunity totalcount 시작");
		int totalCount = communityDao.getTotalCount(search,communityType);
		System.out.println("ServiceImpl listCommunity totalcount 종료");
		System.out.println("totalCount :: "+totalCount);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount",totalCount);
		return map;
	}
	
	
	public void getBestTripReview() throws Exception{
		
	}

}
