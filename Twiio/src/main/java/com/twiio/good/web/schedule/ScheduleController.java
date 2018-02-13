package com.twiio.good.web.schedule;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.twiio.good.common.Page;
import com.twiio.good.common.Search;
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
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	public ScheduleController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass().getName());
	}
	
	@RequestMapping( value="/addSchedule/{roomKey}", method=RequestMethod.GET )
	public String addSchedule(@PathVariable String roomKey, HttpServletRequest request) throws Exception {
		System.out.println("/schedule/addSchedule : GET");
		if(scheduleService.getSchedule(roomKey) == null) {
			request.setAttribute("roomKey", roomKey);
			return "forward:/schedule/addSchedule.jsp";
		}else {
			request.setAttribute("node", "node");
			return "forward:/schedule/updateSchedule/"+roomKey;
		}
		
	}
	
	@RequestMapping(value = "/listSchedule")
	public String listSchedule(HttpSession session,HttpServletRequest request, Search search) throws Exception {
		System.out.println("/schedule/listSchedule : ");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(12);
		
		
		User user = (User)session.getAttribute("user");
		Map<String, Object> map = new HashMap<>();
		
		map = scheduleService.listSchedule(search, user.getUserNo());
		List<Schedule> scheduleList = (List<Schedule>)map.get("list");
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, search.getPageSize());		
		System.out.println("resultPage:: "+resultPage);
		
		
		List<Room> roomList = new Vector<>();
		for (Schedule schedule : scheduleList) {
			roomList.add(roomService.getRoom(schedule.getRoomKey()));
		}
		request.setAttribute("schedule", scheduleList);
		request.setAttribute("room", roomList);
		request.setAttribute("totalCount", map.get("totalCount"));
		request.setAttribute("resultPage", resultPage);

		return "forward:/schedule/listSchedule.jsp";
	}
	
	@RequestMapping(value = "/listScheduleAll")
	public String listScheduleAll() throws Exception {
		Map<String, Object> map = scheduleService.listScheduleAll();
		System.out.println("Schedule FIX ==>"+map.get("list"));
		System.out.println("Schedule totalCount ==>"+map.get("totalCount"));
		return "redirect:/main.jsp";
	}
	
	@RequestMapping(value = "/updateSchedule/{roomKey}", method=RequestMethod.GET)
	public String updateSchedule(@PathVariable String roomKey, HttpServletRequest request) throws Exception{
		System.out.println("/schedule/updateSchedule : GET");
		Schedule schedule = scheduleService.getSchedule(roomKey);
		
		request.setAttribute("schedule", schedule);
		
		return "forward:/schedule/updateSchedule.jsp";
	}
	
	@RequestMapping(value="/updateSchedule", method=RequestMethod.POST)
	public String updateSchedule(@ModelAttribute("schedule") Schedule schedule, HttpServletRequest request) throws Exception{
		System.out.println("/schedule/updateSchedule : POST");
		
		String mapImage = schedule.getMapImg();
		mapImage = mapImage.replaceAll("[(]", "");
		mapImage =mapImage.replaceAll("[)]","");
		mapImage =mapImage.replaceAll(" ","");
		
		String mapImageResult = "https://maps.googleapis.com/maps/api/staticmap";
		mapImageResult += "?center=" + mapImage+ "&size=400x400&zoom=15&maptype=google.maps.MapTypeId.ROADMAP&markers=color:red|" + mapImage;
		
		schedule.setMapImg(mapImageResult);
		
		scheduleService.updateSchedule(schedule);
		
		return "redirect:/schedule/listSchedule";
		
		
	}
	
	@RequestMapping(value="/updateScheduleNode", method=RequestMethod.POST)
	public String updateScheduleNode(@ModelAttribute("schedule") Schedule schedule, HttpServletRequest request) throws Exception{
		System.out.println("/schedule/updateSchedule : POST");
		
		String mapImage = schedule.getMapImg();
		mapImage = mapImage.replaceAll("[(]", "");
		mapImage =mapImage.replaceAll("[)]","");
		mapImage =mapImage.replaceAll(" ","");
		
		String mapImageResult = "https://maps.googleapis.com/maps/api/staticmap";
		mapImageResult += "?center=" + mapImage+ "&size=400x400&zoom=15&maptype=google.maps.MapTypeId.ROADMAP&markers=color:red|" + mapImage;
		
		schedule.setMapImg(mapImageResult);
		scheduleService.updateSchedule(schedule);
		
		
		return "redirect:/schedule/updateScheduleNode.jsp";
		
		
	}
	
	
	

}
