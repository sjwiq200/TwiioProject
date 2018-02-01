package com.twiio.good.web.room;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
	public String addRoomUser(HttpSession session, @PathVariable String roomKey) throws Exception{
		System.out.println("/room/json/addRoomUser/{roomKey}");
		System.out.println(roomKey);
		User user = (User)session.getAttribute("user");
		System.out.println("user==>"+user);
		
		roomService.addRoomUser(roomKey, user.getUserNo());
		
		return "success";
	}
	
	

}
