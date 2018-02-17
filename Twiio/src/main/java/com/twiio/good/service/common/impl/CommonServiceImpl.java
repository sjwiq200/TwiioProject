package com.twiio.good.service.common.impl;

import com.twiio.good.common.Search;
import com.twiio.good.service.common.CommonDao;
import com.twiio.good.service.common.CommonService;
import com.twiio.good.service.domain.Friend;
import com.twiio.good.service.domain.Reply;
import com.twiio.good.service.domain.Report;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("commonServiceImpl")
public class CommonServiceImpl implements CommonService {

	@Autowired
	@Qualifier("commonDaoImpl")
	private CommonDao commonDao;

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public CommonServiceImpl() {
		System.out.println(getClass());
	}

	public void addReport(Report report) throws Exception {
		commonDao.addReport(report);
	}

	public void addReply(Reply reply) throws Exception {
		System.out.println("들어오니 replyServiceImpl");
		commonDao.addReply(reply);
		System.out.println("나오니 replyServiceImpl");
	}

	public void addFriend(Friend friend) throws Exception {
		commonDao.addFriend(friend);
	}

	public Map<String, Object> listReport(Search search) throws Exception {
		int totalCountReport = commonDao.getTotalCountReport(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("totalCountReport", totalCountReport);
		map.put("list", commonDao.listReport(search));
		return map;
	}

	public Map<String, Object> listReply(Search search, String targetType, int codeNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("totalCountReply", commonDao.getTotalCountReply(targetType, codeNo));
		map.put("list", commonDao.listReply(search, targetType, codeNo));
		map.put("codeNo", codeNo);
		System.out.println("나왔니???");
		return map;
	}

	public Map<String, Object> listFriend(Search search, int userNo) throws Exception {
		int totalCountFriend = commonDao.getTotalCountFriend(userNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("totalCountFriend", totalCountFriend);
		map.put("list", commonDao.listFriend(search, userNo));
		map.put("userNo", userNo);
		return map;
	}
	
	public Map<String, Object> listRefund(Search search) throws Exception {
		int totalCountRefund = commonDao.getTotalCountRefund(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("totalCountFriend", totalCountRefund);
		map.put("list", commonDao.listRefund(search));
		return map;
	}

	@Override
	public int getTotalCountReply(String targetType, int codeNo) throws Exception {
		return commonDao.getTotalCountReply(targetType, codeNo);
	}

	public void deleteFriend(int no) throws Exception {
		commonDao.deleteFriend(no);
	}

	public void deleteReply(int replyNo) throws Exception {
		commonDao.deleteReply(replyNo);
	}

	public void updateReply(Reply reply) throws Exception {
		commonDao.updateReply(reply);
	}

	public Report getReport(int reportNo) throws Exception {
		return commonDao.getReport(reportNo);
	}
	


	@Override
	public Friend getFriend(Friend friend) throws Exception {
		// TODO Auto-generated method stub
		return commonDao.getFriend(friend);
	}

	
	public void searchKeyword() throws Exception{
		
	}
	  
	public void listSearch() throws Exception{
		
	}

	@Override
	public List<Friend> listFriendOnly(int userNo) throws Exception {
		return commonDao.listFriendOnly(userNo);
	}

	@Override
	public Report updateReport(int reportNo) throws Exception {
		return commonDao.updateReport(reportNo);
	}
}