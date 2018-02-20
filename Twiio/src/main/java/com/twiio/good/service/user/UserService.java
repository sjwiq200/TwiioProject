package com.twiio.good.service.user;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Transaction;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.domain.UserEval;


public interface UserService {
	
	// ȸ������
	public void addUser(User user) throws Exception;
	
	// �α��� / ���̵� �ߺ�üũ 
	public User getUser(String userId) throws Exception;
	
	//������Ȯ�� 
	public User getUserInNo(int userNo) throws Exception;
	
	// ȸ����������Ʈ 
	public Map<String , Object> listUser(Search search) throws Exception;
	
	public List<User> listUserForSharedMainPlan(int mainPlanNo) throws Exception;
	
	// ȸ����������
	public void updateUser(User user) throws Exception;
	
	// �÷���������
	public void updateSharedPlan(int userNo,String mainPlanNo) throws Exception;
	
	// ȸ��Ż��ó��
	public void deleteUser(User user) throws Exception;
		
	// ȸ�� ���̵�ã��
	public String findId(User user) throws Exception;
	
	// ȸ�� ��й�ȣ ã��
	public void findPassword(User user) throws Exception;
	
	// īī�� �α���
	public User kakaoLogin(String access_token) throws Exception;
	
	// ���� �α���
	public User googleLogin(String code) throws Exception;
	
	// ���� ���ν�
	public Map<String , Object> detectFace(User user) throws Exception, IOException;
	
	// ���̵� �ߺ�üũ
	public boolean checkDuplication(String userId) throws Exception;
	
	public void addEvalUser(UserEval tagetUser) throws Exception;
	
	public int addEvalUserCheck(UserEval userEval) throws Exception;
	
	public Map<String, Object> listStarEvalHost(Search search, int hostNo) throws Exception;
	
	public List<Transaction> listBestHost(Search search) throws Exception;
	
	//public void addStarEvalHost(Transaction transaction) throws Exception;
	
	public User getEvalUser(int userNo) throws Exception;
	
	public Transaction getEvalHost(int hostNo) throws Exception;
	
	public void sendMail(String emai, String authNum)throws Exception;
		

}
