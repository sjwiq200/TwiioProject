package com.twiio.good.service.mypage.impl;

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
import com.twiio.good.service.domain.Message;
import com.twiio.good.service.mypage.MyPageDao;
import com.twiio.good.service.mypage.MyPageService;

@Service("mypageServiceImpl")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	@Qualifier("mypageDaoImpl")
	private MyPageDao mypageDao;
	
	public void setMyPageDao(MyPageDao mypageDao) {
		this.mypageDao = mypageDao;
	}
	
	
	public MyPageServiceImpl() {
		System.out.println(this.getClass());
	}
	
	
	
	public void addMessage(Message Message) throws Exception{
		mypageDao.addMessage(Message);
	}
	
	
	public Message getMessage(int messageNo) throws Exception{
		
		return mypageDao.getMessage(messageNo);
	}
	
	
	public void deleteMessage(int messageNo) throws Exception{
		mypageDao.deleteMessage(messageNo);
	}
	
	
	public Map<String, Object> listMessage(Search search, int userNo) throws Exception{
		System.out.println("ServiceImpl listCommunity 리스트 검색  시작");
		List<Message> list= mypageDao.listMessage(search, userNo);
		System.out.println("ServiceImpl listCommunity 리스트 검색 종료");
		
		System.out.println("ServiceImpl listCommunity totalcount 시작");
		int totalCount = mypageDao.getTotalCountMessage(userNo);
		System.out.println("ServiceImpl listCommunity totalcount 종료");
		System.out.println("totalCount :: "+totalCount);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount",totalCount);
		return map;
	}
}
