package com.twiio.good.web.room;

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
import com.twiio.good.service.common.CommonService;
import com.twiio.good.service.domain.Message;
import com.twiio.good.service.domain.Report;
import com.twiio.good.service.domain.Room;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.mypage.MyPageService;
import com.twiio.good.service.room.RoomService;

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
		
		String[] json = data.split("&");
		String userNo =  json[0].split("=")[1];
		String roomKey = json[1].split("=")[1];
		
		User user = (User)session.getAttribute("user");
		Room room = roomService.getRoom(roomKey);
		
		//채팅 초대 메시지 전송
		Message message = new Message();
		message.setFromUserNo(user.getUserNo());
		message.setToUserNo(Integer.parseInt(userNo));
		message.setMessageTitle("채팅방 초대");
		message.setMessageContent(user.getUserName()+"님이 " +room.getRoomName() +"채팅방에 초대하였습니다.");
		
		mypageService.addMessage(message);
		roomService.addRoomUser(roomKey, Integer.parseInt(userNo));
		
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
	
	

}
