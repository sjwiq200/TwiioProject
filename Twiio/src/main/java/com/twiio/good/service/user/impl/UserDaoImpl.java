package com.twiio.good.service.user.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Properties;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.domain.UserEval;
import com.twiio.good.service.user.UserDao;

	//==> 회원관리 DAO CRUD 구현
	@Repository("userDaoImpl")
	public class UserDaoImpl implements UserDao{
		
		///Field
		@Autowired
		@Qualifier("sqlSessionTemplate")
		private SqlSession sqlSession;
		
		public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
		}
			
		public UserDaoImpl() {
			System.out.println(this.getClass());
		}
	
		@Override
		public void addUser(User user) throws Exception {
			sqlSession.insert("UserMapper.addUser", user);
		}
	
		@Override
		public User getUser(String userId) throws Exception {
			return  sqlSession.selectOne("UserMapper.getUser", userId);
		}
	
		@Override
		public List<User> listUser(Search search) throws Exception {
			return sqlSession.selectList("UserMapper.getUserList", search);
		}
	
		@Override
		public void updateUser(User user) throws Exception {
			sqlSession.update("UserMapper.updateUser", user);
		}
	
		@Override
		public void deleteUser(User user) throws Exception {
			sqlSession.update("UserMapper.delectUser", user);
		}
	

		public User findId(User user) throws Exception {
			// TODO Auto-generated method stub
			return  sqlSession.selectOne("UserMapper.findId", user);
		}

		@Override
		public void findPassword(User user) throws Exception {
			sqlSession.update("UserMapper.findPassword", user);
			
		}		

		@Override
		public void addEvalUser(UserEval tagetUser, User evalUser, String scheduleNo) throws Exception {
			
			Map map = new HashMap();
			map.put("tagetUser", tagetUser);
			map.put("evalUser", evalUser);
			map.put("scheduleNo", scheduleNo);
			
			sqlSession.update("UserMapper.addEvalUser", map);
		}
	
		@Override
		public List getStarEvalHost(User user) throws Exception {
			// TODO Auto-generated method stub
			return null;
		}
	
		@Override
		public List listBestHost(User user) throws Exception {
			// TODO Auto-generated method stub
			return null;
		}
	
		@Override
		public void addStarEvalHost(User user) throws Exception {
			// TODO Auto-generated method stub
			
		}
	
		@Override
		public String getEvalUser(String userId) throws Exception {
			// TODO Auto-generated method stub
			return null;
		}
	
		@Override
		public String getEvalHost(String userId) throws Exception {
			
			return null;
		}
	
		@Override
		public int getTotalCount(Search search) throws Exception {
			return sqlSession.selectOne("UserMapper.getTotalCount", search);
		}
		
	}
