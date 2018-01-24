package com.twiio.good.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


import com.twiio.good.common.Search;
import com.twiio.good.service.community.CommunityDao;
import com.twiio.good.service.community.CommunityService;
import com.twiio.good.service.domain.Community;

@Service("communityServiceImpl")
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	@Qualifier("communityDaoImpl")
	private CommunityDao communityDao;
	
	public void setCommunityDao(CommunityDao communityDao) {
		this.communityDao = communityDao;
	}
	
	
	public CommunityServiceImpl() {
		System.out.println(this.getClass());
	}
	
	public void addCommunity(Community community) throws Exception{
			communityDao.addCommunity(community);
	}
	
	
	public Community getCommunity(int communityNo) throws Exception{
		
		return communityDao.getCommunity(communityNo);
	}
	
	
	public void updateCommunity(Community community) throws Exception{
		communityDao.updateCommunity(community);
	}
	
	
	public void deleteCommunity(int communityNo) throws Exception{
		communityDao.deleteCommunity(communityNo);
	}
	
	
	public Map<String, Object> listCommunity(Search search, int communityType) throws Exception{
		
		List<Community> list= communityDao.listCommunity(search, communityType);
		int totalCount = communityDao.getTotalCount(communityType);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount",totalCount);
		return map;
	}
	
	
	public void getBestTripReview() throws Exception{
		
	}

}
