package com.twiio.good.web.user;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.twiio.good.common.Page;
import com.twiio.good.common.Search;
import com.twiio.good.service.common.CommonService;
import com.twiio.good.service.domain.Friend;
import com.twiio.good.service.domain.Transaction;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.user.UserService;


@Controller
@RequestMapping("/user/*")
public class UserController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	///Field
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	//setter Method 구현 않음
		
	public UserController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	////////사진 업로드////////
	@Value("#{commonProperties['path']}")
	String path;
	
	
	@RequestMapping( value="addUser", method=RequestMethod.GET )
	public String addUser() throws Exception{
	
		System.out.println("/user/addUser : GET");
		
		return "redirect:/user/addUserView.jsp";
	}
	
	@RequestMapping( value="addUser", method=RequestMethod.POST )
	public String addUser( @ModelAttribute("user") User user, Model model ) throws Exception {

		System.out.println("/user/addUser : POST");
		
		System.out.println(user);
		user.setUserRegisterType("T");

//		if(user.getFile()!=null) {
//			if(userService.detectFace(user)) {
//				user.setUserImage(user.getUserId()+"="+user.getFile().getOriginalFilename());
//				userService.addUser(user);
//				model.addAttribute("user",user);
//				System.out.println(":: Twiio 자제 회원가입 완료/사진 업로드  ::");	
//			}else {
//				System.out.println(":: 회원가입 실패 =====> 얼굴을 명확히 인식할 수 있는 사진으로 다시 업로드 바람  ::");
//			}			
//		}else {

			//Business Logic
			userService.addUser(user);
			model.addAttribute("user",user);
			System.out.println(":: Twiio 자제 회원가입 완료 ::");

//		}
		
		return "redirect:/user/loginView.jsp";
	}


	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( @RequestParam("userNo") int userNo , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUserInNo(userNo);
		User userEval = userService.getEvalUser(userNo);
		System.out.println("userEval : "+userEval);
		if(userEval != null) {
			double per = userEval.getUserEval();
			user.setUserEval(Double.parseDouble(String.format("%.2f",(per/20))));
			double per2 = userEval.getUserEvalCredit();
			user.setUserEvalCredit(Double.parseDouble(String.format("%.2f",(per2/20))));
		}
		
		List<Friend> list = commonService.listFriendOnly(user.getUserNo());

		
		List<User> listFriend = new Vector<>();
		for (Friend friend : list) {
			User user2 = userService.getUserInNo(friend.getFriendNo());

			user2.setProfilePublic(Integer.toString(friend.getNo()));
			listFriend.add(user2);
		}
		
		System.out.println("list :: "+listFriend);
		
		// Model 과 View 연결

		System.out.println("regDate : "+user.getRegDate());
		// Model 과 View 연결
		//System.out.println("per : "+per);
		//System.out.println("per2 : "+per2);
		System.out.println("user :: "+user);
		model.addAttribute("listFriend", listFriend);
		model.addAttribute("user", user);
		
		return "forward:/user/getUser.jsp";
	}
	
	@RequestMapping( value="getHost", method=RequestMethod.GET )
	public String getHost(@ModelAttribute("search") Search search, @RequestParam("hostNo") int hostNo , Model model ) throws Exception {
		
		System.out.println("/user/getHost : GET");
		//Business Logic
		User host = userService.getUserInNo(hostNo);
		
		Transaction transaction = userService.getEvalHost(hostNo);
		double evalHost = transaction.getEvalHost();
		//////////////////////////review/////////////////////
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}		
		search.setPageSize(5);
		
		Map<String, Object> map = userService.listStarEvalHost(search, hostNo);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, search.getPageSize());
				
		// Model 과 View 연결
		model.addAttribute("host", host);
		model.addAttribute("evalHost", evalHost);
		model.addAttribute("totalCount", map.get("totalCount"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("reviewList", (List<Transaction>)map.get("list"));
		
		return "forward:/product/getHost.jsp";
	}

	@RequestMapping( value="updateUser", method=RequestMethod.GET )
	public String updateUser( @RequestParam("userNo") int userNo , Model model ) throws Exception{

		System.out.println("/user/updateUser : GET");
		//Business Logic
		User user = userService.getUserInNo(userNo);
		// Model 과 View 연결
		model.addAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}

	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public String updateUser( @ModelAttribute("user") User user , HttpSession session) throws Exception{

		System.out.println("/user/updateUser : POST");
		//Business Logic
		System.out.println("userUpdatePost :: "+user);
		userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getUserId();
		
		if(sessionId.equals(user.getUserId()) || sessionId.equals("admin")){
			session.setAttribute("user", user);
		}
		
		return "redirect:/user/getUser?userNo="+((User)session.getAttribute("user")).getUserNo();
	}	

	
	@RequestMapping( value="listUser")
	public String listUser( @ModelAttribute("search") Search search , Model model , 
			HttpServletRequest request, HttpSession httpSession) throws Exception{
		
		
		System.out.println("/user/listUser : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		User user = (User)httpSession.getAttribute("user");
		// Business logic 수행
		Map<String , Object> map=userService.listUser(search);
		System.out.println("pageUnit ::: "+pageUnit);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		List<Friend> list = commonService.listFriendOnly(user.getUserNo());

		
		List<User> listFriend = new Vector<>();
		for (Friend friend : list) {
			User user2 = userService.getUserInNo(friend.getFriendNo());

			user2.setProfilePublic(Integer.toString(friend.getNo()));
			listFriend.add(user2);
		}
		
		System.out.println("list :: "+listFriend);
		
		// Model 과 View 연결
		model.addAttribute("listFriend", listFriend);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/mypage/listUser.jsp";
	}
	
	@RequestMapping( value="deleteUser")
	public String deleteUser( @RequestParam("userNo") int userNo , Model model ) throws Exception{

		System.out.println("/user/deleteUser : ");
		//Business Logic
		User user = userService.getUserInNo(userNo);
		// Model 과 View 연결
		model.addAttribute("user", user);
		
		return "forward:/main.jsp";
	}
	
	@RequestMapping( value="findId")
	public String findId( @ModelAttribute("user") User user , Model model ) throws Exception{

		System.out.println("/user/findId : ");
		//Business Logic
		String userId = userService.findId(user);
		
		//유저 아이디 고쳐서 보내기
		int index = userId.length()-4;
		String userIdHint = userId.substring(0,index)+"****";
		// Model 과 View 연결
		model.addAttribute("userIdHint", userIdHint);
		
		return "forward:/user/updateUser.jsp";
	}
	
	@RequestMapping( value="findPassword")
	public String findPassword( @ModelAttribute("user") User user , Model model ) throws Exception{

		System.out.println("/user/findPassword : ");
		//Business Logic
		User dbUser = userService.getUser(user.getUserId());
		if(dbUser != null) {
			if(user.getUserEmail().equals(dbUser.getUserEmail()) && user.getUserName().equals(dbUser.getUserName())) {
				//임시 패스워드 발급
				//userService.findPassword(dbUser);
			}else {
				System.out.println(":: 이름 또는 이메일 불일치 ::");
			}
		}else {
			System.out.println(":: 존재하지 않는 아이디 ::");
		}
		//User user = userService.getUser(user);
		// Model 과 View 연결
		//model.addAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}
	
	@RequestMapping(value = "getProfile2")
	public String getProfile2(@RequestParam("userNo") int userNo, HttpServletRequest request, HttpSession session) throws Exception{
		System.out.println("/room/getProfile2/ : ");
		
		User user = (User)session.getAttribute("user");
		/*Friend friend = new Friend();
		friend.setUserNo(user.getUserNo());
		friend.setFriendNo(userNo);
		
		Friend friendCheck = commonService.getFriend(friend);
		System.out.println("friend Check ==>" + friendCheck);
		
		if(friendCheck != null) {
			request.setAttribute("flag", true); //�씠誘� 移쒓뎄
		}else {
			request.setAttribute("flag", false);
		}*/
		
		
		User profile = userService.getUserInNo(userNo);
		
		request.setAttribute("profile", profile);
		
		
		return "forward:/mypage/getProfile.jsp";
	}

}
