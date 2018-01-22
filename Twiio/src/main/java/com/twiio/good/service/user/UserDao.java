package com.twiio.good.service.user;

import java.util.List;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.User;



public interface UserDao {
	
	
	// INSERT
	public void addUser(User user) throws Exception ;

	// SELECT ONE
	public User getUser(String userId) throws Exception ;

	// SELECT LIST
	public List<User> listUser(Search search) throws Exception ;

	// UPDATE
	public void updateUser(User user) throws Exception ;
	
	// UPDATE
	public void deleteUser(User user) throws Exception;
	
	// SELECT ONE
	public User findId(User user) throws Exception ;
	
	// UPDATE
	public void findPassword(User user) throws Exception ;	
	
	public void addEvalUser(User tagetUser, User evalUser, String scheduleNo) throws Exception;
	
	public List getStarEvalHost(User user) throws Exception;
	
	public List listBestHost(User user) throws Exception;
	
	public void addStarEvalHost(User user) throws Exception;
	
	public String  getEvalUser(String userId) throws Exception;
	
	public String  getEvalHost(String userId) throws Exception;
	
	
	// 게시판 Page 처리를 위한 전체Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;
	

}
