package com.twiio.good.web.dailyplan;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.twiio.good.service.common.CommonService;
import com.twiio.good.service.dailyplan.DailyPlanService;
import com.twiio.good.service.domain.DailyPlan;
import com.twiio.good.service.domain.Friend;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.user.UserService;



@RestController
@RequestMapping({"/dailyplan/*"})
public class PlanRestController {

	@Autowired
	@Qualifier("dailyPlanServiceImpl")
	private DailyPlanService dailyPlanService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	public PlanRestController() {
	}
	
	@RequestMapping(value = "json/selectCity", method = RequestMethod.GET)
	public void selectCity(
			@RequestParam int dailyPlanNo4city 
			,@RequestParam String cityName
			) 
			throws Exception {
		
		System.out.println("RestController : selectCity <START>");
		
		String cityKor = URLDecoder.decode(cityName,"UTF-8");
		DailyPlan dailyPlan = dailyPlanService.getDailyPlan(dailyPlanNo4city);
		String city ;
		
		if(dailyPlan.getDailyCity()==null) {
			dailyPlan.setDailyCity(cityKor);
		} else {
			city = dailyPlan.getDailyCity();
			city = city+","+cityKor;
			dailyPlan.setDailyCity(city);
		}
		dailyPlanService.updateDailyPlan(dailyPlan);
		
		System.out.println("RestController : selectCity <END>");
		
	}
	
	@RequestMapping(value = "json/listFriendRec", produces = "application/json; charset=utf8")
	public Map<String,List> listFriendRec(
			@RequestParam int dailyPlanNo,HttpSession session
			)throws Exception {
		
		System.out.println("RestController : listFriendRec <START>");
		System.out.println("dailyPlanNo : " + dailyPlanNo);
		
		DailyPlan myDailyPlan = dailyPlanService.getDailyPlan(dailyPlanNo);//dailyPlanNo를 통해 dailyPlan전부 가져온다.
		List<DailyPlan> list = dailyPlanService.listFriendRec(myDailyPlan);//해당 dailyPlan을 통해 자신의 dailyPlan과 같은 list를 가져온다.
		List<User> userList = new ArrayList<User>();
		
		User myUserInfo = (User)session.getAttribute("user");
		int myUserNo = myUserInfo.getUserNo();
		
		for(DailyPlan dailyPlan:list) {//다른 유저 데일리플랜 for문 돌린다.
			int userNo = dailyPlan.getUser().getUserNo(); // 자신의 일정과 맞는 유저 NO
			User user = userService.getUserInNo(userNo);//친구 정보 
			userList.add(user);
		}
		
		/*List<Friend> listFriend = commonService.listFriendOnly(myUserNo); //  본인 친구 목록 가져옴
		
		for(DailyPlan dailyPlan:list) {//다른 유저 데일리플랜 for문 돌린다.
			int userNo = dailyPlan.getUser().getUserNo(); // 자신의 일정과 맞는 유저 NO
			for(Friend friendCheck : listFriend) {//친구 리스트 만큼 For문 돌린다.
				int friendNo = friendCheck.getFriendNo();//친구의 번호 가져온다.
				if(userNo != friendNo) {
					User user = userService.getUserInNo(userNo);//친구 정보 
					userList.add(user);
				}
			}
		}*/
		
		System.out.println(userList);
		Map<String, List> userInfo = new HashMap();
		userInfo.put("userList", userList);
		return userInfo;
	}
	
	@RequestMapping(value = "json/addFriend")
	public void addFriend(
			@RequestParam int userNo, HttpSession session )throws Exception {
		
		System.out.println("RestController : addFriend <START>");
		System.out.println("userNo : " + userNo);
		
		User user = (User) session.getAttribute("user");
		int myUserNo = user.getUserNo();
		
		Friend friend = new Friend();
		friend.setFriendNo(userNo);//친구 번호
		friend.setUserNo(myUserNo);//내 번호
		
		commonService.addFriend(friend);
		
	}

}
