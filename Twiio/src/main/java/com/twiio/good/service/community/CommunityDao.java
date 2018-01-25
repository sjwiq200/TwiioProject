package com.twiio.good.service.community;

import java.util.List;
import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Community;

public interface CommunityDao {
	public void addCommunity(Community community) throws Exception;
	public Community getCommunity(int communityNo) throws Exception;
	public void updateCommunity(Community community) throws Exception;
	public void deleteCommunity(int communityNo) throws Exception;
	public List<Community> listCommunity(Search search, String communityType) throws Exception;
	public int getTotalCount(String communityType) throws Exception;
	public void getBestTripReview() throws Exception;
}
