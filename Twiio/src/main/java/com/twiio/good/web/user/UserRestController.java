package com.twiio.good.web.user;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.twiio.good.service.domain.User;
import com.twiio.good.service.domain.UserEval;
import com.twiio.good.service.user.UserService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 않음
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/addUser", method=RequestMethod.POST )
	public String addUser( @RequestBody User user) throws Exception {

		System.out.println("/user/json/addUser : POST");
		
		System.out.println(user);
		user.setUserRegisterType("T");
		if(user.getFile()!=null) {
			if(userService.detectFace(user)) {
				user.setUserImage(user.getUserId()+"="+user.getFile().getOriginalFilename());
				userService.addUser(user);
				System.out.println(":: Twiio 자제 회원가입 완료/사진 업로드  ::");	
			}else {
				System.out.println(":: 회원가입 실패 =====> 얼굴을 명확히 인식할 수 있는 사진으로 다시 업로드 바람  ::");
			}			
		}else {
			//Business Logic
			userService.addUser(user);
			System.out.println(":: Twiio 자제 회원가입 완료 ::");
		}
		
		return "redirect:/user/loginView.jsp";
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
	public Map<String, Boolean> checkDuplication( @RequestBody String userId ) throws Exception{
		
		System.out.println("/user/json/checkDuplication : POST");
		//Business Logic
		userId=userId.split("=")[1];
		boolean result=userService.checkDuplication(userId);		
		
		//boolean result=userService.checkDuplication(user.getUserId());
		
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
//		String review = "짱이에요 굿굿";
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
	
	@RequestMapping( value="json/getEmailVer", method=RequestMethod.POST )
	public List  getEmailVer(@RequestBody String user	) throws Exception{
	
		System.out.println("/user/json/getEmailVer");
		
		
		
		System.out.println(user);
		
		String decoding = URLDecoder.decode(user, "UTF-8");
		
		System.out.println(decoding);
		
		String[] str = decoding.split("&");
		
		String[] mail = str[4].split("=");
		
		System.out.println(mail[1]);
		
		 String authNum = RandomNum();
		
		System.out.println("입력한 이메일"+mail[1]);
		System.out.println("생성한 인증번호"+authNum);
		
		userService.sendMail(mail[1], authNum);
		
		
		List<String> map = new ArrayList<>();
		map.add(mail[1]);
		map.add(authNum);
		
		return map;
		
	}
	
	public String RandomNum() {

		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);

		}
		return buffer.toString();
	}
	

	
}