package com.twiio.good.service.user;

import java.util.List;
import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.User;


public interface UserService {
	
	// ȸ������
	public void addUser(User user) throws Exception;
	
	// ������Ȯ�� / �α��� / ���̵� �ߺ�üũ 
	public User getUser(String userId) throws Exception;
	
	// ȸ����������Ʈ 
	public Map<String , Object> listUser(Search search) throws Exception;
	
	// ȸ����������
	public void updateUser(User user) throws Exception;
	
	// ȸ��Ż��ó��
	public void deleteUser(User user) throws Exception;
		
	// ȸ�� ���̵�ã��
	public User findId(User user) throws Exception;
	
	// ȸ�� ��й�ȣ ã��
	public void findPassword(User user) throws Exception;
	
	// īī�� �α���
	public User kakaoLogin(String access_token) throws Exception;
	
	// ���� �α���
	public User googleLogin(String code) throws Exception;	
	
	public void addEvalUser(User tagetUser, User evalUser, String scheduleNo) throws Exception;
	
	public List getStarEvalHost(User user) throws Exception;
	
	public Map listBestHost(User user) throws Exception;
	
	//public void addStarEvalHost(Transaction transaction) throws Exception;
	
	public String  getEvalUser(String userId) throws Exception;
	
	public String  getEvalHost(String userId) throws Exception;
		

}
