package com.twiio.good.web.dailyplan;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.twiio.good.service.dailyplan.DailyPlanService;
import com.twiio.good.service.domain.DailyPlan;
import com.twiio.good.service.domain.MainPlan;
import com.twiio.good.service.domain.PlanContent;
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
	
	@RequestMapping(value = "getDailyPlan")
	public String getDailyPlan( @RequestParam("dailyPlanNo") int dailyPlanNo, @RequestParam("mainPlanNo") int mainPlanNo, Model model, HttpSession session) throws Exception {
		
		System.out.println("Controller : getDailyPlan <START>");
		System.out.println("dailyPlanNo : " + dailyPlanNo);
		System.out.println("mainPlanNo : " + mainPlanNo);
		
		DailyPlan dailyPlan = dailyPlanService.getDailyPlan(dailyPlanNo);
		if(dailyPlanService.getPlanContentList(dailyPlanNo) != null) {
				
			System.out.println("등록된 자료가 없습니다. ");
			
		}else {
			List<PlanContent> list = dailyPlanService.getPlanContentList(dailyPlanNo);
			
			for(PlanContent result : list) {
				System.out.println("result : " + result);
			}
			
		model.addAttribute("list", list);
		}
		
		model.addAttribute("dailyPlan", dailyPlan);
		
		System.out.println("Controller : getDailyPlan <END>");
		
		return "forward:/dailyplan/getDailyPlan.jsp";
	}
	
	@RequestMapping( value="addText", method=RequestMethod.POST )
	public String addText (@RequestParam("dailyPlanNo") int dailyPlanNo, @RequestParam String content, Model model) throws Exception{
	
		System.out.println("Controller : addText <START>");
		
		DailyPlan dailyPlan = dailyPlanService.getDailyPlan(dailyPlanNo);
		PlanContent planContent = new PlanContent();
		planContent.setDailyPlan(dailyPlan);
		planContent.setContentText(content);
		planContent.setContentType(1);
		
		int a = dailyPlanService.getPlanContentCount(dailyPlanNo);
		planContent.setOrderNo(a+1);
		dailyPlanService.addPlanContent(planContent);
		System.out.println("Controller : addText <END>");
		
		return "forward:/dailyplan/listDailyPlan?mainPlanNo="+dailyPlan.getMainPlan().getMainPlanNo();
	}
	
	

	
}
