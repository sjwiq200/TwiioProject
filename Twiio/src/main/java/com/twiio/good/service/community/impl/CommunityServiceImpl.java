package com.twiio.good.service.community.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


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
	
	public void addCommunity() {
		
	}
	
	
	public Community getCommunity() {
		Community community = null;
		return community;
	}
	
	
	public void updateCommunity() {
		
	}
	
	
	public void deleteCommunity() {
		
	}
	
	
	public Map<String, Object> listCommunity() {
		Map<String, Object> map = new HashMap<String, Object>();
		return map;
	}
	
	
	public void getBestTripReview() {
		
	}

}
