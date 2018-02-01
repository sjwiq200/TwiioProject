package com.twiio.good.web.room;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Room;
import com.twiio.good.service.domain.RoomUser;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.room.RoomDao;
import com.twiio.good.service.room.RoomService;


@Controller
@RequestMapping("/room/*")
public class RoomController {
	
//	@Autowired
//	@Qualifier("roomDaoImpl")
//	private RoomDao roomDao;
	
	@Autowired
	@Qualifier("roomServiceImpl")
	private RoomService roomService;

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
	public String addRoom(@ModelAttribute("room") Room room) throws Exception{
		
		System.out.println("/room/addRoom : POST");
		System.out.println(room);
				
		
//		roomDao.addRoom(room);
		roomService.addRoom(room);
		
		return "redirect:/room/listRoom";
	}
	
	@RequestMapping( value="listRoom" )
	public String listRoom( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		
		System.out.println("/room/listRoom : GET / POST");
		
		List<Room> list = roomService.listRoom(search);
		request.setAttribute("list", list);
		
		return "forward:/room/listRoom.jsp";
	}
	
	@RequestMapping(value="listMyRoom")
	public String listMyRoom(HttpServletRequest request, HttpSession session) throws Exception{
		
		System.out.println("/room/listMyRoom : ");
		User user = (User)session.getAttribute("user");
		
		List<RoomUser> list  = roomService.listMyRoom(user.getUserNo());
		List<Room> listRoom = new Vector<Room>();
		
		for (RoomUser roomUser : list) {
			System.out.println("RoomController ==>" + roomUser);
			listRoom.add(roomService.getRoom(roomUser.getRoomKey()));
		}
		
		for (Room room : listRoom) {
			System.out.println("RoomController 22222 ==>"+room);
		}
		
		request.setAttribute("list", listRoom);
		
		return "forward:/room/listMyRoom.jsp";
	}
	
	

}
