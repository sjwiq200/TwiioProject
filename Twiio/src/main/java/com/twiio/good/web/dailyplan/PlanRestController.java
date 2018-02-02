package com.twiio.good.web.dailyplan;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.twiio.good.service.dailyplan.DailyPlanService;
import com.twiio.good.service.domain.DailyPlan;
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
			@RequestParam int dailyPlanNo
			)throws Exception {
		
		System.out.println("RestController : listFriendRec <START>");
		System.out.println("dailyPlanNo : " + dailyPlanNo);
		
		DailyPlan myDailyPlan = dailyPlanService.getDailyPlan(dailyPlanNo);//dailyPlanNo를 통해 dailyPlan전부 가져온다.
		List<DailyPlan> list = dailyPlanService.listFriendRec(myDailyPlan);//해당 dailyPlan을 통해 자신의 dailyPlan과 같은 list를 가져온다.
		List<User> userList = new ArrayList<User>();
		
		for(DailyPlan dailyPlan:list) {
			int userNo = dailyPlan.getUser().getUserNo();
			User user = userService.getUserInNo(userNo);
			userList.add(user);
		}
		
		System.out.println(userList);
		Map<String, List> userInfo = new HashMap();
		userInfo.put("userList", userList);
		return userInfo;
		
	}
	
	@RequestMapping(value = "json/addFriend")
	public void addFriend(
			@RequestParam int userNo
			)throws Exception {
		
		System.out.println("RestController : addFriend <START>");
		System.out.println("userNo : " + userNo);
		
		
	
		
	}
	
//	@RequestMapping( value="json/listNightLife", produces = "application/json; charset=utf8" )
//	public  Map<String,List>  listNightLife(@RequestBody String city ) throws Exception{
//		
//		System.out.println("/information/json/listNightLife");
//		
//		String decoding = URLDecoder.decode(city, "UTF-8");
//		
//		System.out.println(decoding);
	
//	Map<String, List> end = new HashMap();
//	
//	end.put("name", name);
//	end.put("no", no);
//	end.put("type", type);
//	end.put("url", url);
//	end.put("image", image);
	
}
