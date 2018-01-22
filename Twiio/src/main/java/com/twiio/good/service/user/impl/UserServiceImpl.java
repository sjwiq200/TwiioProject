package com.twiio.good.service.user.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.domain.UserEval;
import com.twiio.good.service.user.UserDao;
import com.twiio.good.service.user.UserService;


//==> 회원관리 서비스 구현
@Service("userServiceImpl")
public class UserServiceImpl implements UserService{
	
	///Field
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	

	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addUser(User user) throws Exception {
		userDao.addUser(user);
	}

	@Override
	public User getUser(String userId) throws Exception {
		// TODO Auto-generated method stub
		return userDao.getUser(userId);
	}

	@Override
	public Map<String, Object> listUser(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateUser(User user) throws Exception {
		// TODO Auto-generated method stub
		userDao.updateUser(user);
	}

	@Override
	public void delectUser(User user) throws Exception {
		// TODO Auto-generated method stub
		userDao.delectUser(user);
	}

	@Override
	public void addEvalUser(UserEval tagetUser, User evalUser, String scheduleNo) throws Exception {
		userDao.addEvalUser(tagetUser, evalUser, scheduleNo);
	}

	@Override
	public List getStarEvalHost(User user) throws Exception {
		return userDao.getStarEvalHost(user);
	}

	@Override
	public Map listBestHost(User user) throws Exception {
		return null;
	}

	@Override
	public String getEvalUser(String userId) throws Exception {
		return userDao.getEvalUser(userId);
	}

	@Override
	public String getEvalHost(String userId) throws Exception {
		return userDao.getEvalHost(userId);
	}

	@Override
	public boolean checkDuplication(String userId) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
