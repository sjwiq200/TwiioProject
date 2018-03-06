package com.twiio.good.web.schedule;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.twiio.good.common.Search;
import com.twiio.good.service.dailyplan.DailyPlanService;
import com.twiio.good.service.domain.DailyPlan;
import com.twiio.good.service.domain.PlanContent;
import com.twiio.good.service.domain.Room;
import com.twiio.good.service.domain.RoomUser;
import com.twiio.good.service.domain.Schedule;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.domain.UserEval;
import com.twiio.good.service.room.RoomService;
import com.twiio.good.service.schedule.ScheduleService;
import com.twiio.good.service.user.UserService;

@RestController
@RequestMapping("/schedule/*")
public class ScheduleRestController {
	
	@Autowired
	@Qualifier("scheduleServiceImpl")
	private ScheduleService scheduleService;
	
	@Autowired
	@Qualifier("roomServiceImpl")
	private RoomService roomService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("dailyPlanServiceImpl")
	private DailyPlanService dailyPlanService;

	public ScheduleRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@RequestMapping("/json/addSchedule/")
	public boolean addSchedule(@RequestBody Schedule schedule) throws Exception {
		System.out.println("/schedule/json/addSchedule : POST");
		
		HttpClient httpClient = new DefaultHttpClient();
//        HttpPost httpPost = new HttpPost("http://192.168.0.54:8282/v1/requestFCM");
		HttpPost httpPost = new HttpPost("http://192.168.0.57:8282/v1/requestFCM");
        httpPost.setHeader("Accept", "application/json");
        httpPost.setHeader("Content-Type", "application/json");
        
        ObjectMapper objectMapper = new ObjectMapper();

        String jsonValue = objectMapper.writeValueAsString(schedule);
        HttpEntity httpEntity = new StringEntity(jsonValue,"utf-8");

        httpPost.setEntity(httpEntity);
        httpClient.execute(httpPost);
        
		
		
		String roomKey = schedule.getRoomKey();
		String userNoString = "";
		
		//RoomUser Information
		List<RoomUser> list = roomService.listRoomUser(roomKey);
		
		List<Integer> listUserNo = new Vector<>();
		for (RoomUser roomUser : list) {
			listUserNo.add(roomUser.getUserNo());
		}
		//Room Information
		Room room = (Room)roomService.getRoom(roomKey);
		
		for (int i = 0; i < listUserNo.size(); i++) {
			if(listUserNo.size()-1 == i) {
				userNoString += listUserNo.get(i)+"";
			}else {
				userNoString += listUserNo.get(i)+",";
			}
		}
		
		schedule.setUserNo(listUserNo);
		schedule.setCity(room.getCity());
		schedule.setCountry(room.getCountry());
		schedule.setUserNoString(userNoString);
		
		String mapImage = schedule.getMapImg();
		mapImage = mapImage.replaceAll("[(]", "");
		mapImage =mapImage.replaceAll("[)]","");
		mapImage =mapImage.replaceAll(" ","");
		
		String mapImageResult = "https://maps.googleapis.com/maps/api/staticmap";
		mapImageResult += "?center=" + mapImage+ "&size=400x400&zoom=15&maptype=google.maps.MapTypeId.ROADMAP&markers=color:red|" + mapImage;
		
		schedule.setMapImg(mapImageResult);
		System.out.println("schedule mapImageResult" + mapImageResult);
		System.out.println("schedule rest map Image ==>" + schedule);
		scheduleService.addSchedule(schedule);
		
		
		/////////////////������ �ƴ� ��-�ٿ��̲�/////////////////////
		String date = schedule.getScheduleDate();
		String address = schedule.getScheduleAddress();
		String country = schedule.getCountry();
		
		DailyPlan dailyPlan = new DailyPlan();
		dailyPlan.setDailyCountry(country);
		dailyPlan.setDailyDate(java.sql.Date.valueOf(date));
		
		List<DailyPlan> listDailyPlan = dailyPlanService.listPlanForFixedSchedule(dailyPlan);
		
		for(DailyPlan dailyPlanEach : listDailyPlan) {//sameSchedule
			System.out.println("##Debug : " + dailyPlanEach);
			String contentText = address;
			
			int dailyPlanNo = dailyPlanEach.getDailyPlanNo();
			int countForOrder = dailyPlanService.getPlanContentCount(dailyPlanNo);
			
			PlanContent planContent = new PlanContent();
			planContent.setDailyPlan(dailyPlanEach);
			planContent.setOrderNo(countForOrder+1);
			planContent.setContentText(contentText);
			planContent.setContentType(6); //schedule content
			planContent.setMapUrl(mapImageResult);
			dailyPlanService.addPlanContent(planContent);
		}
		
		//dailyPlanService.get
		//PlanContent planContent = new PlanContent();
		
		return true;
	}
	
	@RequestMapping(value="/json/listSchedule/{userId}", method=RequestMethod.POST)
	public List<Schedule> listScheduleAndroid(@PathVariable String userId, @RequestBody Search search ) throws Exception{
		System.out.println("/schedule/json/listSchedule/{userId} : POST");
		User user = userService.getUser(userId);
		List<Schedule> list =(List<Schedule>)scheduleService.listSchedule(search,user.getUserNo()).get("list");
		return list;
	}
	
	@RequestMapping(value="/json/listSchedule", method=RequestMethod.POST)
	public Map<String, Object> listSchedule(@RequestBody Search search, HttpSession session) throws Exception{
		System.out.println("/schedule/json/listSchedule/ : POST");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(12);
		
		User user = (User)session.getAttribute("user");
		Map<String, Object> map = new HashMap<>();
		List<Schedule> list =(List<Schedule>)scheduleService.listSchedule(search,user.getUserNo()).get("list");
		
		
		List<Room> roomList = new Vector<>();
		for (Schedule schedule : list) {
			if(roomService.getRoom(schedule.getRoomKey()) ==null) {
				Room nullRoom = new Room();
				nullRoom.setRoomName("����");
				nullRoom.setUserNo(0);
				roomList.add(nullRoom);
			}else {
				roomList.add(roomService.getRoom(schedule.getRoomKey()));
			}
			
		}
		
		System.out.println("ScheduleRestController==>"+roomList);
		
		map.put("schedule", list);
		map.put("room", roomList);
		
		return map;
	}
	
	@RequestMapping(value = "/json/addEvalUser/{roomKey}", method=RequestMethod.GET)
	public List<User> addEvalUser(@PathVariable String roomKey, HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("/schedule/addEvalUser() : GET");
		Schedule schedule = scheduleService.getSchedule(roomKey);
		List<Integer> list =schedule.getUserNo();
		
		User user = (User)session.getAttribute("user");
		int userNo = user.getUserNo();
		
		for(int i = 0 ; i< list.size(); i++) {
			if(list.get(i) == userNo) {
				list.remove(i);
			}
		}
		
		List<User> listUser = new Vector();
		for (Integer integer : list) {
			listUser.add(userService.getUserInNo(integer));
		}
		UserEval userEval = new UserEval();
		userEval.setScheduleNo(roomKey);
		userEval.setUserNo(userNo);
		System.out.println("userEval ==>" +userEval);
		
		if(userService.addEvalUserCheck(userEval) != 0) {
//			return "forward:/schedule/listSchedule";
			return listUser;
		}else {
			System.out.println("hello==>" + listUser);
			request.setAttribute("roomKey", roomKey);
//			request.setAttribute("list", listUser);
//			request.setAttribute("totalCount", listUser.size());
		
//			return "forward:/schedule/addEvalUser.jsp";
			return listUser;
			
		}
		
	}
	
	
	
	@RequestMapping(value = "/json/addEvalUser/{roomKey}", method=RequestMethod.POST)
	public String addEvalUser(@RequestBody UserEval userEval,@PathVariable String roomKey, HttpSession session) throws Exception {
		System.out.println("/schedule/addEvalUser/ : POST");
		User user = (User)session.getAttribute("user");
		
		userEval.setUserNo(user.getUserNo());
		userEval.setScheduleNo(roomKey);
		System.out.println("ShimJaewoo ==> " + userEval.toString());
		
		if(userService.addEvalUserCheck(userEval) == 0) {
			System.out.println("userEval Please");
			userService.addEvalUser(userEval);
		}
		
		
		return "/schedule/listSchedule";
	}

}
