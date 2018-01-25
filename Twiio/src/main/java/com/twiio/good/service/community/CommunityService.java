package com.twiio.good.service.community;

import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Community;

public interface CommunityService {
	public void addCommunity(Community community) throws Exception;
	public Community getCommunity(int communityNo) throws Exception;
	public void updateCommunity(Community community) throws Exception;
	public void deleteCommunity(int communityNo) throws Exception;
	public Map<String, Object> listCommunity(Search search, String communityType) throws Exception;
	public void getBestTripReview() throws Exception;
}
