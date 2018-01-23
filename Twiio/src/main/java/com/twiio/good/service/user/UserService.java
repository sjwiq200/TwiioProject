package com.twiio.good.service.user;

import java.util.List;
import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.domain.UserEval;


public interface UserService {
	
	// 회원가입
	public void addUser(User user) throws Exception;
	
	// 로그인 / 아이디 중복체크 
	public User getUser(String userId) throws Exception;
	
	//내정보확인 
	public User getUserInNo(int userNo) throws Exception;
	
	// 회원정보리스트 
	public Map<String , Object> listUser(Search search) throws Exception;
	
	// 회원정보수정
	public void updateUser(User user) throws Exception;
	
	// 회원탈퇴처리
	public void deleteUser(User user) throws Exception;
		
	// 회원 아이디찾기
	public String findId(User user) throws Exception;
	
	// 회원 비밀번호 찾기
	public void findPassword(User user) throws Exception;
	
	// 카카오 로그인
	public User kakaoLogin(String access_token) throws Exception;
	
	// 구글 로그인
	public User googleLogin(String code) throws Exception;	
	
	public void addEvalUser(UserEval tagetUser, User evalUser, String scheduleNo) throws Exception;
	
	public List getStarEvalHost(User user) throws Exception;
	
	public Map listBestHost(User user) throws Exception;
	
	//public void addStarEvalHost(Transaction transaction) throws Exception;
	
	public String  getEvalUser(String userId) throws Exception;
	
	public String  getEvalHost(String userId) throws Exception;
		

}
