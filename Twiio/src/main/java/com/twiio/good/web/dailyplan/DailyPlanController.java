package com.twiio.good.web.dailyplan;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.twiio.good.service.dailyplan.DailyPlanService;
import com.twiio.good.service.domain.DailyPlan;
import com.twiio.good.service.domain.MainPlan;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.mainplan.MainPlanService;

@Controller
@RequestMapping("/dailyplan/*")
public class DailyPlanController {

	///Field
		@Autowired
		@Qualifier("mainPlanServiceImpl")
		private MainPlanService mainPlanService;
		
		@Autowired
		@Qualifier("dailyPlanServiceImpl")
		private DailyPlanService dailyPlanService;
		
	public DailyPlanController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value = "listDailyPlan")
	public String listDailyPlan( @RequestParam("mainPlanNo") int mainPlanNo, Model model, HttpSession session) throws Exception {
		
		System.out.println("Controller : listDailyPlan <START>");
		
		List<DailyPlan> list = dailyPlanService.getDailyPlanList(mainPlanNo);
		
		for(DailyPlan result : list) {
			System.out.println("result : " + result);
		}
		
		System.out.println("Controller : listMainPlan <END>");
		
		model.addAttribute("list", list);
		
		return "forward:/dailyplan/listDailyPlan.jsp";
	}
	
	

}
