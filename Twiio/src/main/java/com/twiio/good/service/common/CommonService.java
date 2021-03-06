package com.twiio.good.service.common;

import java.util.List;
import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Friend;
import com.twiio.good.service.domain.Reply;
import com.twiio.good.service.domain.Report;

public interface CommonService
{
  public void addReport(Report report) throws Exception;

  public void addReply(Reply reply) throws Exception;

  public void addFriend(Friend friend) throws Exception;

  public Map<String,Object> listReport(Search search) throws Exception;

  public Map<String,Object> listReply(Search search, String targetType, int codeNo) throws Exception;

  public Map<String,Object> listFriend(Search search, int userNo) throws Exception;
  
  public List<Friend> listFriendOnly(int userNo) throws Exception;
  
  public Map<String,Object> listRefund(Search search) throws Exception;

  public void deleteFriend(int no) throws Exception;

  public void deleteReply(int replyNo) throws Exception;

  public void updateReply(Reply reply) throws Exception;

  public Report getReport(int reportNo) throws Exception;
  
  public Friend getFriend(Friend friend) throws Exception;
  
  public int getTotalCountReply(String targetType, int codeNo) throws Exception;
  
  public Report updateReport(int reportNo) throws Exception;
  
  ///////////////////////잘모르겠습니다.///////////////////////////
  public void searchKeyword() throws Exception;
  
  public void listSearch() throws Exception;
  
  
}