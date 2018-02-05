package com.twiio.good.web.room;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mongodb.util.JSON;
import com.twiio.good.service.common.CommonService;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.room.RoomService;

@RestController
@RequestMapping("/room/*")
public class RoomRestController {
	
	@Autowired
	@Qualifier("roomServiceImpl")
	private RoomService roomService;

	public RoomRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
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
		
		
		roomService.addRoomUser(roomKey, Integer.parseInt(userNo));
		
		return true;
		
		
		
	}
	
	

}
