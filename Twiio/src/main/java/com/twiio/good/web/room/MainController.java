package com.twiio.good.web.room;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.twiio.good.service.schedule.ScheduleService;

@Controller
@RequestMapping(value= {"/","/main.jsp"})
public class MainController {
	@Autowired
	@Qualifier("scheduleServiceImpl")
	private ScheduleService scheduleService;

	public MainController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping
	public String index(HttpServletRequest request) throws Exception {
		System.out.println("root / : GET");
		Map<String, Object> map = scheduleService.listScheduleAll();
		System.out.println("Schedule FIX ==>"+map.get("list"));
		System.out.println("Schedule totalCount ==>"+map.get("totalCount"));
		request.setAttribute("list", map.get("list"));
		request.setAttribute("totalCount", map.get("totalCount"));
		return "forward:/main.jsp";
	}

}
