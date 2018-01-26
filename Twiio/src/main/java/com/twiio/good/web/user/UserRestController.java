package com.twiio.good.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.twiio.good.service.domain.User;
import com.twiio.good.service.domain.UserEval;
import com.twiio.good.service.user.UserService;


//==> È¸¿ø°ü¸® RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ±¸Çö ¾ÊÀ½
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/getUser/{userNo}", method=RequestMethod.GET )
	public User getUser( @PathVariable int userNo ) throws Exception{
		
		System.out.println("/user/json/getUser : GET ");
		
		//Business Logic
		return userService.getUserInNo(userNo);
	}
	
	@RequestMapping( value="json/detectFace", method=RequestMethod.POST)
	public boolean detectFace( @RequestBody User user ) throws Exception{
		
		System.out.println("/user/json/detectFace ");
		System.out.println(user);
		//Business Logic
		return userService.detectFace(user);
	}
	
	@RequestMapping( value="json/checkDuplication", method=RequestMethod.POST )
	public Map<String, Boolean> checkDuplication( @RequestBody User user ) throws Exception{
		
		System.out.println("/user/json/checkDuplication : POST");
		//Business Logic
		//userId=userId.split("=")[1];
		//boolean result=userService.checkDuplication(userId);		
		
		boolean result=userService.checkDuplication(user.getUserId());
		
		Map<String, Boolean> map= new HashMap<String, Boolean>();
		map.put("result", result);
		
		return map;
	}
	
	@RequestMapping( value="json/listStarEvalHost")
	public User listStarEvalHost( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/listStarEvalHost ");
		
		//Business Logic
		return userService.getUser(userId);
	}
	
	@RequestMapping( value="json/getEvalHost")
	public void getEvalHost( ) throws Exception{
		
		System.out.println("/user/json/getEvalHost");
		
		//Business Logic
		
		User evalUser = new User();
		evalUser.setUserId("user01");
		
		
		//return userService.getEvalHost(evalUser.getUserId());
	}
	
	@RequestMapping( value="json/getEvalUser")
	public  String  getEvalUser( ) throws Exception{
		
		System.out.println("/user/json/getEvalHost");
		
		//Business Logic
		
		User evalUser = new User();
		evalUser.setUserId("user01");
		
		
		return userService.getEvalUser(evalUser.getUserId());
	}

//	@RequestMapping( value="json/addStarEvalHost")
//	public Transaction addStarEvalHost(	 ) throws Exception{
//	
//		System.out.println("/user/json/addStarEvalHost");
//		
//		String review = "Â¯ÀÌ¿¡¿ä ±Â±Â";
//		int starPoint  = 3;
//		
//		Transaction transaction = new Transaction();
//		transaction.setReviewHost(review);
//		transaction.setStarPointHost(starPoint);
//		
//		userService.addStarEvalHost(transaction);
//		
//		return transaction ;
//	}
	
	@RequestMapping( value="json/addEvalUser")
	public Map  addEvalUser(	) throws Exception{
	
		System.out.println("/user/json/addEvalUser");
		//Business Logic
		
		User evalUser = new User();
		evalUser.setUserId("user01");
		
		UserEval targetUser = new UserEval();
		
		User targetNo = userService.getUser("user02");
		targetUser.setTargetNo(targetNo.getUserNo());
		targetUser.setAttendanceTnF(1);
		targetUser.setProfileTnF(0);
	
		
		String scheduleNo = "123";
		
		userService.addEvalUser(targetUser, evalUser, scheduleNo); 
		
		Map<String , Object> map = new HashMap();
		map.put("tagetUser", targetUser);
		map.put("evalUser", evalUser);
		map.put("scheduleNo", scheduleNo);
		
		return map;
		
	}
	
}