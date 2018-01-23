package com.twiio.good.service.community;

import java.util.Map;

import com.twiio.good.service.domain.Community;

public interface CommunityDao {
	public void addCommunity() throws Exception;
	public Community getCommunity() throws Exception;
	public void updateCommunity() throws Exception;
	public void deleteCommunity() throws Exception;
	public Map<String, Object> listCommunity() throws Exception;
	public void getBestTripReview() throws Exception;
}
