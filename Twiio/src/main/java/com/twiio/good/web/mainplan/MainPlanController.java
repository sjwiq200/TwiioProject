package com.twiio.good.web.mainplan;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.twiio.good.service.dailyplan.DailyPlanService;
import com.twiio.good.service.domain.DailyPlan;
import com.twiio.good.service.domain.MainPlan;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.mainplan.MainPlanService;

@Controller
@RequestMapping("/mainplan/*")
public class MainPlanController {

	
	///Field
	@Autowired
	@Qualifier("mainPlanServiceImpl")
	private MainPlanService mainPlanService;
	
	@Autowired
	@Qualifier("dailyPlanServiceImpl")
	private DailyPlanService dailyPlanService;
	
	
	///Constructor
	public MainPlanController() {
		// TODO Auto-generated constructor stub
	}
	
	
	///Method
	
	@RequestMapping(value = "addMainPlan")
	public String addMainPlan(@ModelAttribute("mainPlan") MainPlan mainPlan,Model model, HttpSession session) throws Exception {

		System.out.println("-----Controller : addMainPlan <START>");
		System.out.println("�÷����� : " + mainPlan.getPlanTitle());
		System.out.println("����� : "+ mainPlan.getDepartureDate() + 
				" " + mainPlan.getDepartureDate().getClass());
		System.out.println("������ : " + mainPlan.getArrivalDate() + 
				" " +mainPlan.getArrivalDate().getClass());
		System.out.println("������ : " + mainPlan.getCity()[0]);
		
		///////////���� - UserController�ϼ� �� Session���� ������ ����//
		User user = new User();
		user.setUserId("user04");
		user.setUserType(1);
		user.setUserName("�ٿ���");
		user.setUserNo(7);

		/////////////////////////////////////////////////////////////////
		
		mainPlan.setUser(user);
		mainPlan.setCountry("CountryTest");
		mainPlanService.addMainPlan(mainPlan);
		System.out.println("#"+mainPlan);
		
		
		//mainPlan = mainPlanService.getMainPlan(mainPlanNo);
		DailyPlan dailyPlan = new DailyPlan();
		dailyPlan.setMainPlan(mainPlan);
		dailyPlan.setUser(user);
		
		Date departureDate = mainPlan.getDepartureDate();
		Date arrivalDate = mainPlan.getArrivalDate();
		
		if(departureDate != arrivalDate) {
			java.util.Date departureDateUtil = departureDate;
			java.util.Date arrivalDateUtil = arrivalDate;
			
			long diff = arrivalDateUtil.getTime() - departureDateUtil.getTime();
	        long diffDays = diff / (24 * 60 * 60 * 1000);
	        
	        System.out.println("debug : " + diffDays);
	        Date dailyDate = mainPlan.getDepartureDate();
	        
	        String str="";
	        if(mainPlan.getCity().length!=1) {
	        	
	        	for(int i=0; i<mainPlan.getCity().length; i++) {
	        		str += mainPlan.getCity()[i]+",";
	        	}
	        	
	        }
	        
	        
	        for(int i = 0 ; i <diffDays ; i++) {
	        	
	        	dailyPlan.setDailyCity(str);
			    dailyPlan.setDailyCountry(mainPlan.getCountry());
			    dailyPlan.setDay(i+1);
			    dailyPlan.setDailyDate(dailyDate);
			    dailyPlan.setMainPlan(mainPlan);
			    dailyPlan.setUser(user);
			    
			    dailyPlanService.addDailyPlan(dailyPlan); 
			    
		        Calendar calendar = Calendar.getInstance();//+1���� Calendar�������� ��ȯ
		        calendar.setTime(dailyDate);
		        calendar.add(Calendar.DATE,1);
		        java.util.Date calDailyDate = calendar.getTime();//Fri Jan 05 00:00:00 KST 2018
		        
		        final String FORMAT = "yyyy-MM-dd";
		        SimpleDateFormat simpleDateFormatString = new SimpleDateFormat(FORMAT);
		        String dailyDateFormat = simpleDateFormatString.format(calDailyDate);//String��
		        dailyDate=Date.valueOf(dailyDateFormat);
		        System.out.println("dailyDate +1 : " + dailyDate);
		        
	        }
		} else {
			dailyPlan.setDailyCity(mainPlan.getCity()[0]);
	        dailyPlan.setDailyCountry(mainPlan.getCountry());
	        dailyPlan.setDay(1);
	        dailyPlan.setDailyDate(mainPlan.getArrivalDate());
	        dailyPlan.setMainPlan(mainPlan);
	        dailyPlan.setUser(user);
		}
		
		//model.addAttribute("userId", user.getUserId());

		System.out.println("-----Controller : addMainPlan <END>");
		
		return null;
		//return "forward:/purchase/addPurchaseView.jsp";
		
	}

	@RequestMapping(value = "listMainPlan")
	public String listMainPlan(Model model, HttpSession session) throws Exception {
		
		System.out.println("Controller : listMainPlan <START>");
		
		return "forward:/mainplan/listMainPlan.jsp";
	}
}
