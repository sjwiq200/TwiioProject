package com.twiio.good.service.common.impl;

import com.twiio.good.common.Search;
import com.twiio.good.service.common.CommonDao;
import com.twiio.good.service.domain.Friend;
import com.twiio.good.service.domain.Reply;
import com.twiio.good.service.domain.Report;
import java.io.PrintStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("commonDaoImpl")
public class CommonDaoImpl
  implements CommonDao
{

  @Autowired
  @Qualifier("sqlSessionTemplate")
  private SqlSession sqlSession;

  public void setSqlSession(SqlSession sqlSession)
  {
    this.sqlSession = sqlSession;
  }

  public CommonDaoImpl() {
    System.out.println(getClass());
  }

  public void addReport(Report report) throws Exception {
    this.sqlSession.insert("", report);
  }
  public void addReply(Reply reply) throws Exception {
    this.sqlSession.insert("", reply);
  }
  public void addFriend(Friend friend) throws Exception {
    this.sqlSession.insert("", friend);
  }

  public List listReport(Search search, int reportNo) throws Exception {
    Map map = new HashMap();
    map.put("search", search);
    map.put("reportNo", Integer.valueOf(reportNo));
    return this.sqlSession.selectList("", map);
  }
  public List listReply(Search search, int replyNo) throws Exception {
    Map map = new HashMap();
    map.put("search", search);
    map.put("reportNo", Integer.valueOf(replyNo));
    return this.sqlSession.selectList("", map);
  }
  public List listFriend(Search search, int friendNo) throws Exception {
    Map map = new HashMap();
    map.put("search", search);
    map.put("reportNo", Integer.valueOf(friendNo));
    return this.sqlSession.selectList("", map);
  }

  public void deleteFriend() throws Exception {
    throw new Error("Unresolved compilation problem: \n\tSyntax error on token \",\", Expression expected after this token\n");
  }
  public void deleteReply() throws Exception {
    throw new Error("Unresolved compilation problem: \n\tSyntax error on token \",\", Expression expected after this token\n");
  }

  public void updateReply() throws Exception {
    throw new Error("Unresolved compilation problem: \n\tSyntax error on token \",\", Expression expected after this token\n");
  }
  public Report getReport() throws Exception {
    throw new Error("Unresolved compilation problems: \n\tThe return type is incompatible with CommonDao.getReport()\n\tSyntax error on token \",\", Expression expected after this token\n");
  }
}