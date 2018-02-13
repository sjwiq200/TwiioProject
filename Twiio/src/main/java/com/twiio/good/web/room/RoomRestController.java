package com.twiio.good.web.room;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mongodb.util.JSON;
import com.twiio.good.common.Search;
import com.twiio.good.service.common.CommonService;
import com.twiio.good.service.domain.Message;
import com.twiio.good.service.domain.Report;
import com.twiio.good.service.domain.Room;
import com.twiio.good.service.domain.RoomUser;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.mypage.MyPageService;
import com.twiio.good.service.room.RoomService;
import com.twiio.good.service.user.UserService;

@RestController
@RequestMapping("/room/*")
public class RoomRestController {
	
	@Autowired
	@Qualifier("roomServiceImpl")
	private RoomService roomService;
	
	@Autowired
	@Qualifier("mypageServiceImpl")
	private MyPageService mypageService;
	
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public RoomRestController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("/json/addRoomUser/{roomKey}")
	public void addRoomUser(HttpSession session, @PathVariable String roomKey) throws Exception{
		System.out.println("/room/json/addRoomUser/{roomKey}");
		System.out.println(roomKey);
		User user = (User)session.getAttribute("user");
		System.out.println("user==>"+user);
		
		roomService.addRoomUser(roomKey, user.getUserNo());
		
	}
	
	@RequestMapping("/json/addRoomFriend/")
	public boolean addRoomFriend(@RequestBody String data, HttpSession session) throws Exception {
		System.out.println("room/json/addRoomFriend/");
		boolean flag = false;
		
		String[] json = data.split("&");
		String userNo =  json[0].split("=")[1];
		String roomKey = json[1].split("=")[1];
		
		User user = (User)session.getAttribute("user");
		Room room = roomService.getRoom(roomKey);
		List<RoomUser> list = roomService.listRoomUser(roomKey);
		for (RoomUser roomUser : list) {
			if(roomUser.getUserNo() == Integer.parseInt(userNo)) {
				flag = true;
				break;
			}
		}
		if(flag) {
			
		}else {
			//채팅 초대 메시지 전송
			Message message = new Message();
			message.setFromUserNo(user.getUserNo());
			message.setToUserNo(Integer.parseInt(userNo));
			message.setMessageTitle("채팅방 초대");
			message.setMessageContent(user.getUserName()+"님이 " +room.getRoomName() +"채팅방에 초대하였습니다.");
			
			mypageService.addMessage(message);
			roomService.addRoomUser(roomKey, Integer.parseInt(userNo));
		}
		
		
		return true;
		
	}
	
	@RequestMapping("/json/addReport/")
	public boolean addReport(@RequestBody Report report, HttpSession session) throws Exception{
		System.out.println("/room/json/addReport : ");
		User user = (User)session.getAttribute("user");
		report.setUserNo(user.getUserNo());
		if(report.getTargetUserNo() == 0) {
		}else {
			report.setTargetRoomKey(null);
		}
		System.out.println("report ==>"+report);
		commonService.addReport(report);
		return true;
	}
	
	@RequestMapping("/json/updateRoomOpen")
	public boolean updateRoomOpen(@RequestBody Room room) throws Exception{
		System.out.println("room/json/updateRoomOpen : ");
		System.out.println("updateRoomOpen rest ==>" + room);
		roomService.updateRoomOpen(room);
		
		return true;
	}
	
	@RequestMapping("/json/listRoom")
	public List<Room> listRoom(@RequestBody Search search) throws Exception{
		System.out.println("/room/json/listRoom : ");
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(12);
		
		List<Room> list = (List<Room>)roomService.listRoom(search).get("list");
		System.out.println("roomrestController "+ list);
		return list;
	}
	
	@RequestMapping("/json/listMyRoom")
	public List<Room> listMyRoom(@RequestBody Search search, HttpSession session) throws Exception{
		System.out.println("/room/json/listRoom : ");
		User user = (User)session.getAttribute("user");
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(12);
		
		List<Room> list = (List<Room>)roomService.listMyRoom(search,user.getUserNo()).get("list");
		System.out.println("roomrestController "+ list);
		return list;
	}
	
	@RequestMapping("/json/listMyRoom/{userId}")
	public List<Room> listMyRoom(@RequestBody Search search,  @PathVariable String userId) throws Exception {
		System.out.println("/room/json/listRoom : ");
		User user = userService.getUser(userId);
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(12);
		List<Room> list = (List<Room>)roomService.listMyRoom(search, user.getUserNo()).get("list");
		return list;
	}
	
	

}
