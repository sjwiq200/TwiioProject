package com.twiio.good.service.user;

import java.util.List;
import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.domain.UserEval;


public interface UserService {
	
	// ȸ������
	public void addUser(User user) throws Exception;
	
	// ������Ȯ�� / �α���
	public User getUser(String userId) throws Exception;
	
	// ȸ����������Ʈ 
	public Map<String , Object> listUser(Search search) throws Exception;
	
	// ȸ����������
	public void updateUser(User user) throws Exception;
	
	public void delectUser(User user) throws Exception;
	
	public void addEvalUser(UserEval tagetUser, User evalUser, String scheduleNo) throws Exception;
	
	public List getStarEvalHost(User user) throws Exception;
	
	public Map listBestHost(User user) throws Exception;
	
	//public void addStarEvalHost(Transaction transaction) throws Exception;
	
	public String  getEvalUser(String userId) throws Exception;
	
	public String  getEvalHost(String userId) throws Exception;
	
	// ȸ�� ID �ߺ� Ȯ��
	public boolean checkDuplication(String userId) throws Exception;

}
