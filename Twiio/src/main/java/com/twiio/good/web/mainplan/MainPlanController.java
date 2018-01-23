package com.twiio.good.web.mainplan;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.twiio.good.service.domain.MainPlan;
import com.twiio.good.service.mainplan.MainPlanService;

@Controller
@RequestMapping("/mainPlan/*")
public class MainPlanController {

	
	///Field
	@Autowired
	@Qualifier("mainPlanServiceImpl")
	private MainPlanService mainPlanSerivce;
	
	
	///Constructor
	public MainPlanController() {
		// TODO Auto-generated constructor stub
	}
	
	
	///Method
	
	@RequestMapping(value = "addMainPlan", method = RequestMethod.POST)
	public String addMainPlan(@ModelAttribute("mainPlan") MainPlan mainPlan,Model model, HttpSession session) throws Exception {

		System.out.println("Controller : addMainPlan <START>");
		
		session.setAttribute("userId", "planTest");
		session.setAttribute("userType", 1);
		session.setAttribute("userName", "´Ù¿µ");
		
		String userId = (String) session.getAttribute("userId");
		mainPlanSerivce.addMainPlan(mainPlan);
		//dailyPlanService.
		//model.addAttribute("userId", user.getUserId());

		return "forward:/purchase/addPurchaseView.jsp";
		
	}

}
