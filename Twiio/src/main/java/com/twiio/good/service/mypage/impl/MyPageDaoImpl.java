package com.twiio.good.service.mypage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Message;
import com.twiio.good.service.mypage.MyPageDao;

@Service("mypageDaoImpl")
public class MyPageDaoImpl implements MyPageDao{
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public MyPageDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addMessage(Message message) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("messageDaoImpl :: "+message);
		sqlSession.insert("MyPageMapper.addMessage",message);
	}

	@Override
	public Message getMessage(int messageNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MyPageMapper.getMessage",messageNo);
	}

	@Override
	public void deleteMessage(int messageNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("MyPageMapper.deleteMessage",messageNo);
	}

	@Override
	public List<Message> listMessage(Search search, int userNo) throws Exception {
		// TODO Auto-generated method stub
		Map<String , Object>  map = new HashMap<String, Object>();		
		map.put("search", search);
		map.put("userNo", userNo);
		List<Message> list = sqlSession.selectList("MyPageMapper.listMessage", map);
		return list;
	}

	@Override
	public int getTotalCountMessage(int userNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MyPageMapper.getTotalCountMessage",userNo);
	}
}
