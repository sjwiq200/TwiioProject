package com.twiio.good.web.room;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.twiio.good.common.Page;
import com.twiio.good.common.Search;
import com.twiio.good.service.common.CommonService;
import com.twiio.good.service.domain.Friend;
import com.twiio.good.service.domain.Room;
import com.twiio.good.service.domain.RoomUser;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.room.RoomDao;
import com.twiio.good.service.room.RoomService;
import com.twiio.good.service.user.UserService;


@Controller
@RequestMapping("/room/*")
public class RoomController {
	
	@Autowired
	@Qualifier("roomServiceImpl")
	private RoomService roomService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;

	public RoomController() {
		// TODO Auto-generated constructor stub
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping( value="addRoom", method=RequestMethod.GET )
	public String addRoom(HttpServletRequest request) throws Exception {
		System.out.println("/room/addRoom : GET");
		return "forward:/room/addRoom.jsp";
	}
	
	@RequestMapping(value="addRoom", method=RequestMethod.POST)
	public String addRoom(@ModelAttribute("room") Room room,HttpSession session) throws Exception{
		
		System.out.println("/room/addRoom : POST");
		User user = (User)session.getAttribute("user");
		room.setUserNo(user.getUserNo());
				
		roomService.addRoom(room);
		
		return "redirect:/room/listRoom";
	}
	
	@RequestMapping( value="listRoom" )
	public String listRoom( @ModelAttribute("search") Search search , HttpServletRequest request) throws Exception{
		
		System.out.println("/room/listRoom : GET / POST");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(12);
		
		Map<String, Object> map = roomService.listRoom(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, search.getPageSize());		
		System.out.println("resultPage:: "+resultPage);
		
		
		request.setAttribute("list", map.get("list"));
		request.setAttribute("totalCount", map.get("totalCount"));
		request.setAttribute("resultPage", resultPage);
		
		return "forward:/room/listRoom.jsp";
	}
	
	@RequestMapping(value="listMyRoom")
	public String listMyRoom(@ModelAttribute("search") Search search, HttpServletRequest request, HttpSession session) throws Exception{
		
		System.out.println("/room/listMyRoom : ");
		User user = (User)session.getAttribute("user");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(12);
		
//		List<RoomUser> list  = roomService.listMyRoom(user.getUserNo());
		Map<String, Object> map = roomService.listMyRoom(search, user.getUserNo());
		
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, search.getPageSize());		
		System.out.println("resultPage:: "+resultPage);
		
		
		
		request.setAttribute("list", map.get("list"));
		request.setAttribute("totalCount",map.get("totalCount"));
		request.setAttribute("resultPage", resultPage);
		return "forward:/room/listMyRoom.jsp";
	}
	
	@RequestMapping(value = "/updateRoom/{roomKey}", method=RequestMethod.GET)
	public String updateRoom(@PathVariable String roomKey, HttpServletRequest request) throws Exception{
		System.out.println("room/updateRoom/{roomKey} : GET" );
		System.out.println("roomKey ==>" + roomKey);
		Room room = roomService.getRoom(roomKey);
		System.out.println("room ==>" + room);
		request.setAttribute("room", room);
		return "forward:/room/updateRoom.jsp";
		
	}
	
	@RequestMapping(value = "/updateRoom" , method=RequestMethod.POST)
	public String updateRoom(@ModelAttribute("room") Room room, HttpSession session) throws Exception{
		System.out.println("/room/updateRoom : POST");
		System.out.println("room ==>" + room);
		User user =  (User)session.getAttribute("user");
		room.setUserNo(user.getUserNo());
		roomService.updateRoom(room);
		return "redirect:/room/listMyRoom";
	}
	
	@RequestMapping(value = "/deleteRoom")
	public String deleteRoom(@ModelAttribute("room") Room room) throws Exception{
		System.out.println("/room/updateRoom : ");
		System.out.println(room);
		roomService.deleteRoom(room);
		return "redirect:/room/listMyRoom";
	}
	
	@RequestMapping(value = "/getProfile/{userNo}")
	public String getProfile(@PathVariable int userNo, HttpServletRequest request, HttpSession session) throws Exception{
		System.out.println("/room/getProfile/ : ");
		
		User user = (User)session.getAttribute("user");
		Friend friend = new Friend();
		friend.setUserNo(user.getUserNo());
		friend.setFriendNo(userNo);
		
		Friend friendCheck = commonService.getFriend(friend);
		System.out.println("friend Check ==>" + friendCheck);
		
		if(friendCheck != null) {
			request.setAttribute("flag", true); //�씠誘� 移쒓뎄
		}else {
			request.setAttribute("flag", false);
		}
		
		
		User profile = userService.getUserInNo(userNo);
		
		request.setAttribute("profile", profile);
		
		
		return "forward:/room/getProfile.jsp";
	}
	
	@RequestMapping(value = "/listFriend/{roomKey}")
	public String listFriend(HttpServletRequest request,HttpSession session,@PathVariable String roomKey) throws Exception{
		System.out.println("/room/listFriend : ");
		
		User user = (User)session.getAttribute("user");
		
		System.out.println("user ==>" +user);
		
		List<Friend> list = commonService.listFriendOnly(user.getUserNo());
		
		List<User> listFriend = new Vector<>();
		for (Friend friend : list) {
			listFriend.add(userService.getUserInNo(friend.getFriendNo() ));
		}
		
		request.setAttribute("list", listFriend);
		request.setAttribute("roomKey", roomKey);
		
		return "forward:/room/listFriend.jsp";
	}
	
	@RequestMapping(value = "/listRoomUser/{roomKey}")
	public String listRoomUser(@PathVariable String roomKey, HttpServletRequest request) throws Exception {
		
		List<RoomUser> list = roomService.listRoomUser(roomKey);
		List<User> listUser = new Vector<>();
		for (RoomUser roomUser : list) {
			listUser.add(userService.getUserInNo(roomUser.getUserNo()));
		}
		request.setAttribute("list", listUser);
		
		return "forward:/room/listRoomUser.jsp";
	}
	
	@RequestMapping(value = "/addReport/{roomKey}")
	public String addReport(@PathVariable String roomKey, HttpServletRequest request) throws Exception {
		
		System.out.println("/room/addReport/{roomKey} : GET");
		request.setAttribute("roomKey", roomKey);
		
		List<RoomUser> list = roomService.listRoomUser(roomKey);
		List<User> listUser = new Vector<>();
		
		for (RoomUser roomUser : list) {
			listUser.add(userService.getUserInNo(roomUser.getUserNo()));
		}
		
		request.setAttribute("list", listUser);
		
		return "forward:/room/addReport.jsp";
	}
	
	@RequestMapping(value = "/deleteRoomUser/{roomKey}")
	public String deleteRoomUser(@PathVariable String roomKey,HttpSession session) throws Exception {
		System.out.println("/room/deleteRoomUser : ");
		User user = (User)session.getAttribute("user");
		
		roomService.deleteRoomUser(roomKey,user.getUserNo());
		return "redirect:/room/listMyRoom";
	}
	
	@RequestMapping(value = "/updateRoomOpen/{roomKey}", method=RequestMethod.GET)
	public String updateRoomOpen(@PathVariable String roomKey, HttpServletRequest request ) throws Exception{
		System.out.println("/room/updateRoomOpen/{roomKey}");
		
		Room room = roomService.getRoom(roomKey);
		request.setAttribute("room", room);
		
		return "forward:/room/updateRoomOpen.jsp";
	}
	
	
	
	

}
