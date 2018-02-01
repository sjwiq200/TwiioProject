package com.twiio.good.web.schedule;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.twiio.good.service.domain.Schedule;

@Controller
@RequestMapping("/schedule/*")
public class ScheduleController {

	public ScheduleController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass().getName());
	}
	
	@RequestMapping( value="addSchedule", method=RequestMethod.GET )
	public String addRoom() throws Exception {
		System.out.println("/schedule/addSchedule : GET");
		return "forward:/schedule/addSchedule.jsp";
	}
	
	@RequestMapping( value="addSchedule", method=RequestMethod.POST )
	public String addRoom(@ModelAttribute("schedule") Schedule schedule) throws Exception {
		System.out.println("/schedule/addSchedule : POST");
		
		return "forward:/schedule/addSchedule.jsp";
	}

}
