package com.twiio.good.web.mainplan;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		String cityResult = "";
		
		for(int i = 0 ; i < mainPlan.getCityList().length;i++) {
			if(i==mainPlan.getCityList().length-1) {
				cityResult += mainPlan.getCityList()[i];
			}else {
				cityResult += mainPlan.getCityList()[i] + ",";
			}
		}
		
		///////////삭제 - UserController완성 시 Session으로 가져올 예정//
		User user = new User();
		user.setUserId("user04");
		user.setUserType(1);
		user.setUserName("다영이");
		user.setUserNo(7);

		/////////////////////////////////////////////////////////////////
		
		mainPlan.setCity(cityResult);
		mainPlan.setUser(user);
		mainPlan.setCountry("CountryTest");
		
		mainPlanService.addMainPlan(mainPlan);

		System.out.println("플랜제목 : " + mainPlan.getPlanTitle());
		System.out.println("출발일 : "+ mainPlan.getDepartureDate());
		System.out.println("도착일 : " + mainPlan.getArrivalDate());
		System.out.println("여행지 : " + mainPlan.getCity());
		
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
	        
	        Date dailyDate = mainPlan.getDepartureDate();
	        
	        for(int i = 0 ; i <diffDays+1 ; i++) {
	        	
	        	dailyPlan.setDailyCity(cityResult);
			    dailyPlan.setDailyCountry(mainPlan.getCountry());
			    dailyPlan.setDay(i+1);
			    dailyPlan.setDailyDate(dailyDate);
			    dailyPlan.setMainPlan(mainPlan);
			    dailyPlan.setUser(user);
			    
			    dailyPlanService.addDailyPlan(dailyPlan); 
			    
		        Calendar calendar = Calendar.getInstance();//+1위해 Calendar형식으로 변환
		        calendar.setTime(dailyDate);
		        calendar.add(Calendar.DATE,1);
		        java.util.Date calDailyDate = calendar.getTime();//Fri Jan 05 00:00:00 KST 2018
		        
		        final String FORMAT = "yyyy-MM-dd";
		        SimpleDateFormat simpleDateFormatString = new SimpleDateFormat(FORMAT);
		        String dailyDateFormat = simpleDateFormatString.format(calDailyDate);//String값
		        dailyDate=Date.valueOf(dailyDateFormat);
	        }
		} else {
			dailyPlan.setDailyCity(cityResult);
	        dailyPlan.setDailyCountry(mainPlan.getCountry());
	        dailyPlan.setDay(1);
	        dailyPlan.setDailyDate(mainPlan.getArrivalDate());
	        dailyPlan.setMainPlan(mainPlan);
	        dailyPlan.setUser(user);
		}
		
		System.out.println("-----Controller : addMainPlan <END>");
		
		return "forward:/mainplan/listMainPlan";
	}

	
	
	
	
	
	@RequestMapping(value = "listMainPlan")
	public String listMainPlan(Model model, HttpSession session) throws Exception {
		
		System.out.println("Controller : listMainPlan <START>");
		
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
	

	

	
	@RequestMapping(value = "getMainPlan",method=RequestMethod.GET)
	public String getMainPlan(@RequestParam("mainPlanNo") int mainPlanNo,Model model, HttpSession session) throws Exception {
		
		System.out.println("Controller : getMainPlan <START>");
		
		MainPlan mainPlan = mainPlanService.getMainPlan(mainPlanNo);
		model.addAttribute("mainPlan", mainPlan);
		System.out.println("Controller : getMainPlan <END>");
		
		return null;
		//return "forward:/mainplan/listMainPlan.jsp";
	}
	
	
	@RequestMapping(value = "updateMainPlanView")
	public String updateMainPlanView(@RequestParam("mainPlanNo") int mainPlanNo, Model model, HttpSession session) throws Exception {
		
		System.out.println("Controller : updateMainPlanView <START>" + "Param값 : " + mainPlanNo);
		
		MainPlan mainPlan = mainPlanService.getMainPlan(mainPlanNo);
		String[] cityList = (mainPlan.getCity()).split(",");
		mainPlan.setCityList(cityList);
		
		System.out.println("Controller : updateMainPlanView <END>");
		
		
		model.addAttribute("mainPlan", mainPlan);
		model.addAttribute("cityList",cityList);
		
		return "forward:/mainplan/updateMainPlanContent.jsp";
	
	}
	
	
	@RequestMapping(value = "updateMainPlan",method=RequestMethod.POST)
	public String updateMainPlan(@ModelAttribute("mainPlan") MainPlan mainPlan, Model model, HttpSession session) throws Exception {
		
		System.out.println("Controller : updateMainPlan <START>"+mainPlan);
		
		
		/////mainPlanUpdate////////////////////////////////////////////////////////////////
		
			String cityResult = "";
			
			for(int i = 0 ; i < mainPlan.getCityList().length;i++) {
				if(i==mainPlan.getCityList().length-1) {
					cityResult += mainPlan.getCityList()[i];
				}else {
					cityResult += mainPlan.getCityList()[i] + ",";
				}
			}
			
			mainPlan.setCity(cityResult);
			mainPlan.setCountry("국가");
		//////////////////////////////////////////////////////////////////////////////////
		
			
			
			
		/////dailyPlanUpdate//////////////////////////////////////////////////////////////
			
		MainPlan mainPlanDB = mainPlanService.getMainPlan(mainPlan.getMainPlanNo());
		Date departureDate = mainPlan.getDepartureDate();
		Date arrivalDate = mainPlan.getArrivalDate();
		Date departureDateDB = mainPlanDB.getDepartureDate();
		Date arrivalDateDB = mainPlanDB.getArrivalDate();
		Boolean departureCompared = departureDate.equals(departureDateDB)&&arrivalDate.equals(arrivalDateDB);
		//true이면 일정 변경 없음 false이면 일정 변경 있음
		
		String city = cityResult;
		String cityDB = mainPlanDB.getCity();
		Boolean cityCompared = city.equals(cityDB);
		//true이면 city변경 없음 false이면 city 변경 있음
		System.out.println("debug4: " + cityCompared );
		long diffDaysDB = mainPlanService.getDayCount(mainPlanDB.getMainPlanNo());
		
		mainPlanService.updateMainPlan(mainPlan);
		
		////Case1 : 일정변경없이 city만 변경된 경우 => dailyPlan city 초기화하기 
		if(!(cityCompared) && departureCompared) {
			DailyPlan dailyPlan4City = new DailyPlan();
			dailyPlan4City.setMainPlan(mainPlan);
			List<DailyPlan> list4City = dailyPlanService.getDailyPlanList(dailyPlan4City);
			System.out.println("debug5: " + "일정변경없이 city만 변경된 경우" );
			System.out.println("debug5: " + list4City );
			for(int i = 0 ; i<list4City.size() ; i++) {
			
				list4City.get(i).setDailyCity(cityResult);
				list4City.get(i).setDailyCountry("");
				dailyPlanService.updateDailyPlan(list4City.get(i)); // 변경된 도시명으로 daily_plan업데이트
			}
		}
		
		
		////Case2 : 일정이 변경된 경우 => day수와 dailyDate변경 & dailyPlan city까지 초기화하기!
		if(!(departureCompared)) {
			System.out.println("일정이 변경되었습니다.");
			
			long diffDays = 0;
			System.out.println("debug5: " + diffDaysDB + " : "+ diffDays);
			if(departureDate != arrivalDate) { // 새로 입력한 날짜가 DAY1 이상일 경우
				java.util.Date departureDateUtil = departureDate;
				java.util.Date arrivalDateUtil = arrivalDate;
				long diff = arrivalDateUtil.getTime() - departureDateUtil.getTime();
		        diffDays = diff / (24 * 60 * 60 * 1000);
		        System.out.println("debug : " + diffDays);
		        
		        
		    	if(diffDaysDB>=diffDays) {
					//기존 DAY수가 더 클때
					DailyPlan dailyPlan = new DailyPlan();
					dailyPlan.setMainPlan(mainPlanDB);
					List<DailyPlan> list = dailyPlanService.getDailyPlanList(dailyPlan);
					
					Date dailyDate = mainPlan.getDepartureDate();
					
					for(int i = 0 ; i <diffDaysDB+1;i++) { 
						DailyPlan dailyPlanCheck = list.get(i);
						if(i>(diffDays)) {
							dailyPlanCheck.setDailyCity("");
							dailyPlanCheck.setDailyCountry("");
							dailyPlanCheck.setDay(0);
							dailyPlanService.updateDailyPlan(dailyPlanCheck);
						}else {
							
							dailyPlanCheck.setDailyCity(cityResult);
							dailyPlanCheck.setDailyCountry("");
							dailyPlanCheck.setDay(i+1);
							dailyPlanCheck.setDailyDate(dailyDate);
							dailyPlanService.updateDailyPlan(dailyPlanCheck);
							
					        Calendar calendar = Calendar.getInstance();//+1위해 Calendar형식으로 변환
					        calendar.setTime(dailyDate);
					        calendar.add(Calendar.DATE,1);
					        java.util.Date calDailyDate = calendar.getTime();//Fri Jan 05 00:00:00 KST 2018
					        
					        final String FORMAT = "yyyy-MM-dd";
					        SimpleDateFormat simpleDateFormatString = new SimpleDateFormat(FORMAT);
					        String dailyDateFormat = simpleDateFormatString.format(calDailyDate);//String값
					        dailyDate=Date.valueOf(dailyDateFormat);
					        
						}
					}
					
				}else {
					//새로운 DAY수가 더 클때 
					
					System.out.println("새로 입력한 DAY수가 기존 입력 DAY수 보다 큽니다.");
					Date dailyDate = mainPlan.getDepartureDate();
					
					///////////삭제 - UserController완성 시 Session으로 가져올 예정//
					User user = new User();
					user.setUserId("user04");
					user.setUserType(1);
					user.setUserName("다영이");
					user.setUserNo(7);
					/////////////////////////////////////////////////////////////////
					
					DailyPlan dailyPlan = new DailyPlan();
					dailyPlan.setMainPlan(mainPlan);
					dailyPlan.setUser(user);
					
					List<DailyPlan> list = dailyPlanService.getDailyPlanList(dailyPlan);
					
					for(int i = 0 ; i <diffDays+1;i++) {
						
						System.out.println("==>"+list.size());
						
						if(i<(diffDaysDB)+1) { //기존에 있던 데이터들 1-5
							DailyPlan dailyPlanCheck = list.get(i);
							dailyPlanCheck.setDay(i+1);
							dailyPlanCheck.setDailyDate(dailyDate);
							dailyPlanCheck.setDailyCity(cityResult);
							dailyPlanCheck.setDailyCountry("");
							dailyPlanService.updateDailyPlan(dailyPlanCheck);
							System.out.println("국가&도시 미표기 처리 된 dailyPlan 정보 : " + dailyPlanCheck);
						
						}else { //추가되야 할 데이터들 5-10
					        	dailyPlan.setDailyCity(cityResult);
							    dailyPlan.setDailyCountry("");
							    dailyPlan.setDay(i+1);
							    dailyPlan.setDailyDate(dailyDate);
							    dailyPlanService.addDailyPlan(dailyPlan); 
						        
						}
						
						Calendar calendar = Calendar.getInstance();//+1위해 Calendar형식으로 변환
				        calendar.setTime(dailyDate);
				        calendar.add(Calendar.DATE,1);
				        java.util.Date calDailyDate = calendar.getTime();//Fri Jan 05 00:00:00 KST 2018
				        
				        final String FORMAT = "yyyy-MM-dd";
				        SimpleDateFormat simpleDateFormatString = new SimpleDateFormat(FORMAT);
				        String dailyDateFormat = simpleDateFormatString.format(calDailyDate);//String값
				        dailyDate=Date.valueOf(dailyDateFormat);
				        
					}
				}
			}
		}

		model.addAttribute("mainPlan", mainPlan);
		System.out.println("Controller : updateMainPlan <END>");
		
		return "forward:/mainplan/listMainPlan.jsp";
	}
	
	
}
