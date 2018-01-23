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
public class CommonDaoImpl implements CommonDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public CommonDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addReport(Report report) throws Exception {
		sqlSession.insert("CommonMapper.addReport", report);
	}

	@Override
	public void addReply(Reply reply) throws Exception {
		sqlSession.insert("CommonMapper.addReply", reply);
	}

	@Override
	public void addFriend(Friend friend) throws Exception {
		sqlSession.insert("CommonMapper.addFriend", friend);
	}

	@Override
	public List listReport(Search search) throws Exception {
		List<Report> list = sqlSession.selectList("CommonMapper.listReport", search);
		return list;
	}

	@Override
	public List listReply(Search search, int divCode, int codeNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("codeNo", codeNo);
		map.put("divCode", divCode);
		List<Reply> list = sqlSession.selectList("CommonMapper.listReply", map);

		return list;
	}

	@Override
	public List listFriend(Search search, int userNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("reportNo", userNo);
		List<Friend> list = sqlSession.selectList("CommonMapper.listFriend", map);
		return list;
	}

	@Override
	public void deleteFriend(int no) throws Exception {
		sqlSession.delete("CommonMapper.deleteFriend", no);
	}

	@Override
	public void deleteReply(int replyNo) throws Exception {
		sqlSession.delete("CommonMapper.deleteReply", replyNo);
	}

	@Override
	public void updateReply(Reply reply) throws Exception {
		sqlSession.update("CommonMapper.updateReply", reply);
	}

	@Override
	public Report getReport(int reportNo) throws Exception {
		return sqlSession.selectOne("CommonMapper.getReport",reportNo);
	}

	@Override
	public int getTotalCountReport() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CommonMapper.getTotalCountReport");
	}

	@Override
	public int getTotalCountReply(int divCode, int codeNo) throws Exception {
		Reply reply = null;
		reply.setDivCode(divCode);
		reply.setDivCode(codeNo);
		return sqlSession.selectOne("CommonMapper.getTotalCountReply", reply);
	}

	@Override
	public int getTotalCountFriend(int userNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CommonMapper.getTotalCountFriend", userNo);
	}

	@Override
	public void searchKeyword() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void listSearch() throws Exception {
		// TODO Auto-generated method stub
		
	}
	

}