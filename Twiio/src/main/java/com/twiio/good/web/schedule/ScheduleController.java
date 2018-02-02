package com.twiio.good.web.schedule;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.twiio.good.service.domain.Room;
import com.twiio.good.service.domain.RoomUser;
import com.twiio.good.service.domain.Schedule;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.room.RoomService;
import com.twiio.good.service.schedule.ScheduleService;

@Controller
@RequestMapping("/schedule/*")
public class ScheduleController {
	
	@Autowired
	@Qualifier("scheduleServiceImpl")
	private ScheduleService scheduleService;
	
	@Autowired
	@Qualifier("roomServiceImpl")
	private RoomService roomService;

	public ScheduleController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass().getName());
	}
	
	@RequestMapping( value="addSchedule/{roomKey}", method=RequestMethod.GET )
	public String addSchedule(@PathVariable String roomKey, HttpServletRequest request) throws Exception {
		System.out.println("/schedule/addSchedule : GET");
		request.setAttribute("roomKey", roomKey);
		return "forward:/schedule/addSchedule.jsp";
	}
	
	@RequestMapping(value = "listSchedule")
	public String listSchedule(HttpSession session) throws Exception {
		System.out.println("/schedule/listSchedule : ");
		User user = (User)session.getAttribute("user");
		scheduleService.listSchedule(user.getUserNo());

		return "forward:/schedule/listSchedule.jsp";
	}
	
	
	

}
