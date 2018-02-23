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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.twiio.good.common.Page;
import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Transaction;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.domain.UserEval;
import com.twiio.good.service.user.UserService;


@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ���� ����
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@RequestMapping( value="json/addUser", method=RequestMethod.POST )
	public String addUser( @RequestBody User user) throws Exception {

		System.out.println("/user/json/addUser : POST");
		
		System.out.println(user);
		user.setUserRegisterType("T");

		
		return "redirect:/user/loginView.jsp";
	}
	
	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public String login(@RequestBody String str , HttpSession session ) throws Exception{
		
		System.out.println("/user/json/login : POST");
		
		String[] loginInfo = str.split("&");
		
		String[] id = loginInfo[3].split("=");
		String[] pwd = loginInfo[4].split("=");
		
		User user = new User();
		user.setUserId(id[1]);
		user.setPassword(pwd[1]);
		
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
		
		if(dbUser==null) {
			return "false";
		}
		
		if(dbUser.getUserLeave()!=null) {
			
			return "false";
		}
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}else {
			return "password";
		}
		
		return "true";
	}
	
	@RequestMapping( value="json/getUser/{userNo}", method=RequestMethod.GET )
	public User getUser( @PathVariable int userNo ) throws Exception{
		
		System.out.println("/user/json/getUser : GET ");
		
		//Business Logic
		return userService.getUserInNo(userNo);
	}
	
	@RequestMapping(value="json/getUserAndroid/{userId}")
	public User getUser(@PathVariable String userId) throws Exception{
		System.out.println("/user/json/getUserAndroid/{userId} : ");
		return userService.getUser(userId);
	}
	
	@RequestMapping( value="json/faceDetect", method=RequestMethod.POST )
	public Map<String, Object> faceDetect(@RequestPart(value="file", required=false) MultipartFile file,
							HttpSession httpsession,
							User user) throws Exception{
		System.out.println("/user/json/faceDetect");
		user = (User)httpsession.getAttribute("user");
		user.setFile(file);
		String faceto =""; 
		Map<String, Object> map= userService.detectFace(user);

		return map;
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
	public Map<String, Object> listStarEvalHost( @RequestBody String search ) throws Exception{
		
		System.out.println("/user/json/listStarEvalHost ");
		System.out.println(search);
		Search search2 = new Search();
		String[] str = search.split("[&=]");
		if(Integer.parseInt(str[1])==0) {
			search2.setCurrentPage(1);
		}else {
			search2.setCurrentPage(Integer.parseInt(str[1]));
		}
		search2.setPageSize(5);
						
		//Business Logic
		Map<String, Object> starMap = userService.listStarEvalHost(search2, Integer.parseInt(str[3]));
		Page resultPage = new Page( search2.getCurrentPage(), ((Integer)starMap.get("totalCount")).intValue(), pageUnit, search2.getPageSize());
		starMap.put("resultPage", resultPage);
		
		return starMap;
	}
	
	@RequestMapping( value="json/getEvalHost/{hostNo}")
	public double getEvalHost(@PathVariable int hostNo ) throws Exception{
		
		System.out.println("/user/json/getEvalHost");
		
		Transaction transaction = userService.getEvalHost(hostNo);
		double hostEval = transaction.getEvalHost();
		
		return hostEval;
	}
	
	@RequestMapping( value="json/getEvalUser")
	public  User  getEvalUser( ) throws Exception{
		
		System.out.println("/user/json/getEvalHost");
		
		//Business Logic
		
		User evalUser = new User();
		evalUser.setUserNo(4);
		
		return userService.getEvalUser(evalUser.getUserNo());
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
	
		
		@RequestMapping( value="json/deleteUser", method=RequestMethod.POST )
		public Map<String, Object> deleteUser(@RequestBody User  user) throws Exception{
			
			System.out.println("/user/json/deleteUser");
			
			User user2 = userService.getUserInNo(user.getUserNo());
			
			/*if(user2.getUserLeave().equals("Y")) {
				
				return false;
			}else {
			
			userService.deleteUser(user2);
			
			return true;
			}*/
			Map<String, Object> map = new HashMap<String, Object>();
			if(user2.getUserLeave()==null) {
				userService.deleteUser(user2);
				map.put("resign", "1");
				return map;
			}else {
				map.put("resign", "0");
				return map;
			}
	}
}