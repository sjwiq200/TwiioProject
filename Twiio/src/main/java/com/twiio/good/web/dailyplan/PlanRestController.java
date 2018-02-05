package com.twiio.good.web.dailyplan;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.twiio.good.service.common.CommonService;
import com.twiio.good.service.dailyplan.DailyPlanService;
import com.twiio.good.service.domain.DailyPlan;
import com.twiio.good.service.domain.Friend;
import com.twiio.good.service.domain.PlanContent;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.information.InformationService;
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
	
	@Autowired
	@Qualifier("informationServiceImpl")
	private InformationService informationService;
	
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
		
		DailyPlan myDailyPlan = dailyPlanService.getDailyPlan(dailyPlanNo);
		List<DailyPlan> list = dailyPlanService.listFriendRec(myDailyPlan);
		List<User> userListUndone = new ArrayList<User>();
		
		User myUserInfo = (User)session.getAttribute("user");
		int myUserNo = myUserInfo.getUserNo();
		
		
		List<Friend> listFriend = commonService.listFriendOnly(myUserNo); 
		for(DailyPlan dailyPlan:list) {
			int userNo = dailyPlan.getUser().getUserNo(); 
			for(Friend friendCheck : listFriend) {
				if(friendCheck.getFriendNo()==userNo) {
					System.out.println("debug : ï¿½Ì¹ï¿½ Ä£ï¿½ï¿½ï¿½ï¿½");
					userNo=0;
				}
			}
			if(userNo!=0) {
			User user = userService.getUserInNo(userNo);
			userListUndone.add(user);
			}
		}
	
		System.out.println(userListUndone);
		List<User> userList = new ArrayList<User>(new HashSet<User>(userListUndone)); 
		Map<String, List> userInfo = new HashMap();
		userInfo.put("userList", userList);
		return userInfo;
	}
	
	@RequestMapping(value = "json/addFriend")
	public void addFriend(
			@RequestParam int userNo, HttpSession session )throws Exception {
		
		System.out.println("RestController : addFriend <START>");
		
		User user = (User) session.getAttribute("user");
		int myUserNo = user.getUserNo();
		
		Friend friend = new Friend();
		friend.setFriendNo(userNo);
		friend.setUserNo(myUserNo);
		
		commonService.addFriend(friend);
		System.out.println("RestController : addFriend <END>");
		
	}
	
	@RequestMapping(value = "json/addTextContent")
	public void addTextContent(
			@RequestParam int dailyPlanNo, 
			@RequestParam String standardCountryEnc, 
			@RequestParam String compareCountryEnc,
			@RequestParam String inputPrice,
			@RequestParam String resultCurrency
			)
					throws Exception {
		
		System.out.println("RestController : addTextContent <START>");
		
		standardCountryEnc = URLDecoder.decode(standardCountryEnc,"UTF-8");
		compareCountryEnc = URLDecoder.decode(compareCountryEnc,"UTF-8");
		
		String contentText = "<p>È¯À² Á¤º¸</p><p>"+inputPrice+"  " +standardCountryEnc+"</p>"
				+"<p>"+resultCurrency+"  "+compareCountryEnc+"</p>";
		System.out.println("daily"+ dailyPlanNo + ": " + contentText);
		PlanContent planContent = new PlanContent();
		planContent.setDailyPlan(dailyPlanService.getDailyPlan(dailyPlanNo));
		planContent.setContentText(contentText);
		planContent.setContentType(1);
		
		dailyPlanService.addPlanContent(planContent);
		
		System.out.println("RestController : addTextContent <END>");
		
	}
	
	
	
	@RequestMapping(value = "json/deleteContent")
	public void deleteContent(@RequestParam int contentNo)throws Exception {
		
		System.out.println("RestController : deleteContent <START>");
		System.out.println("contentNo : " + contentNo);
		
		dailyPlanService.deletePlanContentEach(contentNo);
		
		System.out.println("RestController : deleteContent <END>");
	}
	
	@RequestMapping(value = "json/deleteAllContent")
	public void deleteAllContent(@RequestParam int dailyPlanNo)throws Exception {
		
		System.out.println("RestController : deleteAllContent <START>");
		System.out.println("contentNo : " + dailyPlanNo);
		
		dailyPlanService.deletePlanContent(dailyPlanNo);
		
		System.out.println("RestController : deleteAllContent <END>");
	}
	
	@RequestMapping(value = "json/getHistoryWeather")
	public void getHistoryWeather(@RequestParam String cityName)throws Exception {
		
		System.out.println("RestController : getHistoryWeather <START>");
		System.out.println("cityName : " + cityName);
		
		cityName = URLDecoder.decode(cityName,"UTF-8");
		
		Map<Object,String[]> map = informationService.searchHistoryWeather(cityName);
		
		List<String> list = new ArrayList<String>();
		
		String[] simple = map.get("quickInfo");
		for(int i = 0; i<simple.length; i++) {
			list.add(simple[i]);
		}
		
		String[] past = map.get("historyWeather");
		
		List<String> month =  new ArrayList<String>();
		for(int i = 0; i<past.length;i++) {
			month.add(past[i]);
			i = i+3;
		}
		List<String> min =  new ArrayList<String>();
		for(int i = 1; i<past.length;i++) {
			min.add(past[i]);
			i = i+3;
		}
		List<String> max =  new ArrayList<String>();
		for(int i = 2; i<past.length;i++) {
			max.add(past[i]);
			i = i+3;
		}
		List<String> rain =  new ArrayList<String>();
		for(int i = 3; i<past.length;i++) {
			rain.add(past[i]);
			i = i+3;
		}
		
		System.out.println("RestController : getHistoryWeather <END>");
	}
	
	@RequestMapping(value = "json/getRouteResult")
	public Map<String, Object> getRouteResult(@RequestBody String data)throws Exception {
		
		System.out.println("RestController : deleteAllContent <START>");
		System.out.println("data : " + data);
		System.out.println("RestController : deleteAllContent <END>");
		data = URLDecoder.decode(data,"UTF-8");
		System.out.println("check : " + data);
		String[] routeResult = data.split("&");
		String[] main = routeResult[0].split("=");
		String[] detail = routeResult[1].split("=");
		
		String[] mainResult = main[1].split("//");
		String[] detailResult = detail[1].split("//");
		
		List<String> mainResultEnd = new ArrayList<String>();
		List<String> detailResultEnd = new ArrayList<String>();
		mainResultEnd.add("<p></p><img src=\"/resources/images/icon/lines/line12.png\" id=\"detailResultLine\" width=\"200px\">");
		for(String mainResultFinal : mainResult) {
			System.out.println("mainResult : " + mainResultFinal);
			mainResultEnd.add("<strong>"+mainResultFinal+"</strong>");
		}
		
		for(String detailResultFinal : detailResult) {
			if((detailResultFinal.indexOf("ÀÌµ¿¼ö´Ü") != -1)) {
				detailResultEnd.add("<img src=\"/resources/images/icon/lines/line9.png\" id=\"detailResultLine\" width=\"200px\">");
			}
			detailResultEnd.add(detailResultFinal);
			
			System.out.println("detailResult : " + detailResultFinal);
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("mainResultEnd", mainResultEnd);
		map.put("detailResultFinal", detailResultEnd);
		
		return map;
	}
	
	
	
	
	
}
