package com.twiio.good.web.dailyplan;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.twiio.good.service.dailyplan.DailyPlanService;
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
	public String listDailyPlan(Model model, HttpSession session) throws Exception {
		
		System.out.println("Controller : listDailyPlan <START>");
		
		///////////삭제 - UserController완성 시 Session으로 가져올 예정//
		User user = new User();
		user.setUserNo(7);
		/////////////////////////////////////////////////////////////////
		
		MainPlan mainPlan = new MainPlan();
		mainPlan.setUser(user);
		mainPlan.setEndClick(100);
		
		List<MainPlan> list = new ArrayList<MainPlan>();
		list = mainPlanService.getMainPlanList(mainPlan);
		for(MainPlan result : list) {
			System.out.println("result : " + result);
		}
		
		System.out.println("Controller : listMainPlan <END>");
		
		model.addAttribute("list", list);
		
		return "forward:/mainplan/listMainPlan.jsp";
	}
	
	

}
