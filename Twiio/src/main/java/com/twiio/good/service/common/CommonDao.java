package com.twiio.good.service.common;

import java.util.List;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Friend;
import com.twiio.good.service.domain.Reply;
import com.twiio.good.service.domain.Report;

public interface CommonDao
{
  public void addReport(Report report) throws Exception;

  public void addReply(Reply reply) throws Exception;

  public void addFriend(Friend friend) throws Exception;

  public List<Report> listReport(Search search) throws Exception;

  public List<Reply> listReply(Search search, String targetType, int codeNo) throws Exception;

  public List<Friend> listFriend(Search search, int userNo) throws Exception;
  
  public List<Friend> listFriendOnly(int userNo) throws Exception;

  public void deleteFriend(int no) throws Exception;

  public void deleteReply(int replyNo) throws Exception;

  public void updateReply(Reply reply) throws Exception;

  public Report getReport(int reportNo) throws Exception;
  
  public int getTotalCountReport() throws Exception;
  
  public int getTotalCountReply(String targetType, int codeNo) throws Exception;
  
  public int getTotalCountFriend(int userNo) throws Exception;
  
  public void searchKeyword() throws Exception;
  
  public void listSearch() throws Exception;
}