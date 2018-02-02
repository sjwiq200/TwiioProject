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
		
		DailyPlan myDailyPlan = dailyPlanService.getDailyPlan(dailyPlanNo);//dailyPlanNo�� ���� dailyPlan���� �����´�.
		List<DailyPlan> list = dailyPlanService.listFriendRec(myDailyPlan);//�ش� dailyPlan�� ���� �ڽ��� dailyPlan�� ���� list�� �����´�.
		List<User> userList = new ArrayList<User>();
		
		User myUserInfo = (User)session.getAttribute("user");
		int myUserNo = myUserInfo.getUserNo();
		
		for(DailyPlan dailyPlan:list) {//�ٸ� ���� ���ϸ��÷� for�� ������.
			int userNo = dailyPlan.getUser().getUserNo(); // �ڽ��� ������ �´� ���� NO
			User user = userService.getUserInNo(userNo);//ģ�� ���� 
			userList.add(user);
		}
		
		/*List<Friend> listFriend = commonService.listFriendOnly(myUserNo); //  ���� ģ�� ��� ������
		
		for(DailyPlan dailyPlan:list) {//�ٸ� ���� ���ϸ��÷� for�� ������.
			int userNo = dailyPlan.getUser().getUserNo(); // �ڽ��� ������ �´� ���� NO
			for(Friend friendCheck : listFriend) {//ģ�� ����Ʈ ��ŭ For�� ������.
				int friendNo = friendCheck.getFriendNo();//ģ���� ��ȣ �����´�.
				if(userNo != friendNo) {
					User user = userService.getUserInNo(userNo);//ģ�� ���� 
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
		friend.setFriendNo(userNo);//ģ�� ��ȣ
		friend.setUserNo(myUserNo);//�� ��ȣ
		
		commonService.addFriend(friend);
		
	}

}
