package com.twiio.good.web.schedule;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

}
