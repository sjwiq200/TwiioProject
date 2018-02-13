package com.twiio.good.web.dailyplan;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.twiio.good.service.common.CommonService;
import com.twiio.good.service.dailyplan.DailyPlanService;
import com.twiio.good.service.domain.DailyPlan;
import com.twiio.good.service.domain.Friend;
import com.twiio.good.service.domain.MainPlan;
import com.twiio.good.service.domain.PlanContent;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.information.InformationService;
import com.twiio.good.service.mainplan.MainPlanService;
import com.twiio.good.service.user.UserService;



@RestController
@RequestMapping({"/dailyplan/*"})
public class PlanRestController {
	
	@Autowired
	@Qualifier("mainPlanServiceImpl")
	private MainPlanService mainPlanService;
	
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
	
	@RequestMapping(value = "json/selectCity", method = RequestMethod.POST)
	public void selectCity(
			@RequestBody DailyPlan dailyPlan 
			
			) 
			throws Exception {
		
		System.out.println("RestController : selectCity <START>");
		System.out.println("dailyPlan :: "+dailyPlan);
		System.out.println("cityName :: "+dailyPlan.getDailyCity());
		//String cityKor = URLDecoder.decode(dailyPlan.getDailyCity(),"UTF-8");
		//System.out.println("cityKor :: "+cityKor);
		DailyPlan dailyPlanDB = dailyPlanService.getDailyPlan(dailyPlan.getDailyPlanNo());
		String[] city = dailyPlan.getDailyCity().split(",");
		String city02="";
		
		if(dailyPlanDB.getDailyCity()==null) {
			for(int i =0; i<city.length; i++) {
				if(i==city.length-1) {
					city02 += city[i].trim();
				}else {
					city02 += city[i].trim()+",";
				}
			}
			dailyPlanDB.setDailyCity(city02);
		} 
		dailyPlanService.updateDailyPlan(dailyPlanDB);
		
		System.out.println("RestController : selectCity <END>");
		
	}
	
	@RequestMapping(value = "json/selectCountryNew", method = RequestMethod.GET)
	public void selectCountryNew(@RequestParam int dailyPlanNo ,@RequestParam String countryName) throws Exception {
		
		System.out.println("RestController : json/selectCountryNew <START>");
		
		String countryKor = URLDecoder.decode(countryName,"UTF-8");
		DailyPlan dailyPlan = dailyPlanService.getDailyPlan(dailyPlanNo);
		String country ;
		
		if(dailyPlan.getDailyCountry()==null) {
			dailyPlan.setDailyCountry(countryKor);
		} else {
			country = dailyPlan.getDailyCountry();
			country = country+","+countryKor;
			dailyPlan.setDailyCountry(country);
		}
		dailyPlanService.updateDailyPlan(dailyPlan);
		
		System.out.println("RestController : json/selectCountryNew <END>");
		
	}
	
	@RequestMapping(value = "json/resetCountry", method = RequestMethod.GET)
	public void resetCountry(@RequestParam int dailyPlanNo) throws Exception {
		
		System.out.println("RestController : json/resetCountry <START>");
		
		//String countryKor = URLDecoder.decode(countryName,"UTF-8");
		DailyPlan dailyPlan = dailyPlanService.getDailyPlan(dailyPlanNo);
//		String country ;
//		
//		if(dailyPlan.getDailyCountry()==null) {
//			dailyPlan.setDailyCountry(countryKor);
//		} else {
//			country = dailyPlan.getDailyCountry();
//			country = country+","+countryKor;
//			dailyPlan.setDailyCountry(country);
//		}
		dailyPlan.setDailyCountry(null);
		dailyPlan.setDailyCity(null);
		dailyPlanService.updateDailyPlan(dailyPlan);
		
		System.out.println("RestController : json/resetCountry <END>");
		
	}
	
	@RequestMapping(value = "json/getDailyCountry", method = RequestMethod.GET)
	public boolean getDailyCountry(@RequestParam int dailyPlanNo) throws Exception {
		System.out.println("RestController : json/getDailyCountry <START>");
		
		boolean flag = false;
		
		DailyPlan dailyPlan = dailyPlanService.getDailyPlan(dailyPlanNo);
		if(dailyPlan.getDailyCountry() == null ) {
			flag=true;
		}
		
		System.out.println("RestController : json/getDailyCountry <END>");
		
		return flag;
	}
	
	
	@RequestMapping(value = "json/getMainCountry/{mainPlanNo}", method = RequestMethod.GET)
	public List<String> getMainCountry(@PathVariable int mainPlanNo) throws Exception {
		
		System.out.println("RestController : json/getMainCountry <START>");
		
		MainPlan mainPlan = mainPlanService.getMainPlan(mainPlanNo);		
		String[] country = mainPlan.getCountry().split(",");
		List<String> countryList = new ArrayList<String>();
		for(int i=0; i<country.length; i++) {
			countryList.add(country[i]);
		}
		//String countryList = mainPlan.getCountry();
		System.out.println("countryList :: "+countryList);
		//model.addAttribute("countryList",countryList);
		return countryList;
		
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
	
	@RequestMapping(value = "json/listFriend")
	public Map<String, List> listFriend(@RequestParam int mainPlanNo, HttpSession session) throws Exception{
		System.out.println("RestController : listFriend <START>");
		System.out.println("mainPlanNo : " + mainPlanNo);
		
		User user = (User)session.getAttribute("user");
		List<Friend> listFriend = commonService.listFriendOnly(user.getUserNo());
		List<User> friendInfo = new ArrayList<User>();
		String mainPlanNoString = String.valueOf(mainPlanNo);
		System.out.println("mainPlanNoString : " + mainPlanNoString);
		
		for(Friend friendCheck : listFriend) {
			User friend = userService.getUserInNo(friendCheck.getFriendNo());
			if(friend.getMainPlanNoShared() != null){
				String[] sharedPlanNo = friend.getMainPlanNoShared().split(",");
				int i = 0;
				for(String sharedPlanNoCheck : sharedPlanNo) {
					if(sharedPlanNoCheck.equals(mainPlanNoString)) {
						i=1;
						break;
					}
				}
				if(i == 0 ) {
				friendInfo.add(friend);
				}
				
			}else {
				friendInfo.add(friend);
			}
		}
		
		Map<String, List> friendList = new HashMap();
		friendList.put("friendInfo", friendInfo);
		
		return friendList;
		
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
		
		String contentText = "<p>CURRENCY</p><p>"+inputPrice+"  " +standardCountryEnc+"</p>"
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
//		mainResultEnd.add("<p></p><img src=\"/resources/images/icon/lines/line12.png\" id=\"detailResultLine\" width=\"200px\">");
		for(String mainResultFinal : mainResult) {
			System.out.println("mainResult : " + mainResultFinal);
			mainResultEnd.add("<strong>"+mainResultFinal+"</strong>");
		}
		
		for(String detailResultFinal : detailResult) {
			if((detailResultFinal.indexOf("¿Ãµø") != -1)) {
//				detailResultEnd.add("<img src=\"/resources/images/icon/lines/line9.png\" id=\"detailResultLine\" width=\"200px\">");
			}
			detailResultEnd.add(detailResultFinal);
			
			System.out.println("detailResult : " + detailResultFinal);
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("mainResultEnd", mainResultEnd);
		map.put("detailResultFinal", detailResultEnd);
		
		return map;
	}
	
	@RequestMapping(value = "json/sharePlan")
	public void sharePlan(@RequestParam int userNo, 
							@RequestParam int mainPlanNo,
								HttpSession session )throws Exception {
		
		System.out.println("RestController : sharePlan <START>");
		
		
		User user = userService.getUserInNo(userNo);
		String mainPlanNoBefore = user.getMainPlanNoShared();
		System.out.println("##debug : " + mainPlanNoBefore);
		if(mainPlanNoBefore == null) {
			userService.updateSharedPlan(userNo,String.valueOf(mainPlanNo));
			
		}else {
			String resultMainPlanNoShared = mainPlanNoBefore + "," + mainPlanNo;
			userService.updateSharedPlan(userNo,resultMainPlanNoShared);
		}
		System.out.println("RestController : sharePlan <END>");
		
	}
	
	
}
