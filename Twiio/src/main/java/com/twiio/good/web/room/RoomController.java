package com.twiio.good.web.room;

import java.util.List;

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
import com.twiio.good.service.room.RoomDao;


@Controller
@RequestMapping("/room/*")
public class RoomController {
	
	@Autowired
	@Qualifier("roomDaoImpl")
	private RoomDao roomDao;

	public RoomController() {
		// TODO Auto-generated constructor stub
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping( value="addRoom", method=RequestMethod.GET )
	public String addRoom(HttpServletRequest request) throws Exception {
		System.out.println("/messenger/addRoom : GET");
		return "forward:/room/addRoom.jsp";
	}
	
	@RequestMapping(value="addRoom", method=RequestMethod.POST)
	public String addRoom(@ModelAttribute("room") Room room) throws Exception{
		
		System.out.println("/messenger/addRoom : POST");
		System.out.println(room);
				
		
		roomDao.addRoom(room);
		return "redirect:/room/listRoom";
	}
	
	@RequestMapping( value="listRoom" )
	public String listUser( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		
		System.out.println("/messenger/listRoom : GET / POST");
		List<Room> list = roomDao.getRoomList(search);
		request.setAttribute("list", list);
		
		return "forward:/room/listRoom.jsp";
		}

}
