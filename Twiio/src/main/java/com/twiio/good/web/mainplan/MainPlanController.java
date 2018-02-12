package com.twiio.good.web.mainplan;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.twiio.good.service.dailyplan.DailyPlanService;
import com.twiio.good.service.domain.DailyPlan;
import com.twiio.good.service.domain.MainPlan;
import com.twiio.good.service.domain.Scrap;
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
	
	////////사진 업로드////////
	@Value("#{commonProperties['mainPlanFilePath']}")
	String mainPlanFilePath;
	
	///Constructor
	public MainPlanController() {
		// TODO Auto-generated constructor stub
	}
	
	
	///Method
	@RequestMapping(value = "addMainPlan")
	   public String addMainPlan(@ModelAttribute("mainPlan") MainPlan mainPlan,Model model, HttpSession session) throws Exception {

		System.out.println("-----Controller : addMainPlan <START>");
		
		String cityResult = "no";
		String countryResult="";
		
//		for(int i = 0 ; i < mainPlan.getCityList().length;i++) {
//			if(i==mainPlan.getCityList().length-1) {
//				cityResult += mainPlan.getCityList()[i];
//			}else {
//				cityResult += mainPlan.getCityList()[i] + ",";
//			}
//		}
		System.out.println("mainPlan :: "+mainPlan);
				
		for(int i = 0 ; i < mainPlan.getCountryList().length;i++) {
			if(i== mainPlan.getCountryList().length-1) {
				countryResult +=  mainPlan.getCountryList()[i];
			}else {
				countryResult +=  mainPlan.getCountryList()[i] + ",";
			}
		}
		
		User user = (User) session.getAttribute("user");
		mainPlan.setCity(cityResult);
		mainPlan.setUser(user);
		mainPlan.setCountry(countryResult);
		System.out.println("getOriginalFilename :: "+mainPlan.getFile().getOriginalFilename());
		String fileName = user.getUserNo()+"="+ mainPlan.getFile().getOriginalFilename();
		System.out.println("fileName :: "+fileName);
		mainPlan.setMainThumbnail(fileName);
		File file = new File(mainPlanFilePath, fileName);
		mainPlan.getFile().transferTo(file);
		
		mainPlanService.addMainPlan(mainPlan);


	      System.out.println("플랜제목 : " + mainPlan.getPlanTitle());
	      System.out.println("출발일 : "+ mainPlan.getDepartureDate());
	      System.out.println("도착일 : " + mainPlan.getArrivalDate());
	      //System.out.println("여행지 : " + mainPlan.getCity());
	      
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
	             //dailyPlan.setDailyCountry(mainPlan.getCountry());
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
	           //dailyPlan.setDailyCountry(mainPlan.getCountry());
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
		
		User user = (User)session.getAttribute("user");
		
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
	
	@RequestMapping(value = "listSharedPlan")
	public String listSharedPlan(Model model, HttpSession session) throws Exception {
		
		System.out.println("Controller : listSharedPlan <START>");
		
		User user = (User)session.getAttribute("user");
		List<MainPlan> list = new ArrayList<MainPlan>();
		
		if(user.getMainPlanNoShared()!=null) {
			
			if(user.getMainPlanNoShared().indexOf(",") != -1) {
				String[] mainPlan = user.getMainPlanNoShared().split(",");
				for(String mainPlanCheck : mainPlan) {
					System.out.println("debug : "+ mainPlanCheck);
					int mainPlanNo = Integer.valueOf(mainPlanCheck);
						if(mainPlanService.getMainPlan(mainPlanNo) != null) {
							MainPlan mainPlanResult = mainPlanService.getMainPlan(mainPlanNo);
							mainPlanResult.setUser(user);
							mainPlanResult.setEndClick(100);
							list.add(mainPlanResult);
						}
				}
			}else {
				int mainPlanNo = Integer.valueOf(user.getMainPlanNoShared());//공유되어 있는 플랜이 하나밖에 없을 때 ','가 없으므로.
				MainPlan mainPlanResult = mainPlanService.getMainPlan(mainPlanNo);
				mainPlanResult.setUser(user);
				mainPlanResult.setEndClick(100);
				list.add(mainPlanResult);
				}
		}
			
		for(MainPlan result : list) {
			System.out.println("result : " + result);
		}
			
		model.addAttribute("list", list);
		
		return "forward:/mainplan/listSharedMainPlan.jsp";
	}
	
	
	@RequestMapping(value = "updateMainPlanView")
	public String updateMainPlanView(@RequestParam("mainPlanNo") int mainPlanNo, Model model, HttpSession session) throws Exception {
		
		System.out.println("Controller : updateMainPlanView <START>" + "Param값 : " + mainPlanNo);
		
		MainPlan mainPlan = mainPlanService.getMainPlan(mainPlanNo);
		String[] country = (mainPlan.getCountry().split(","));
		List<String> countryList = new ArrayList<String>();
		for(int i =0; i<country.length; i++) {
			countryList.add(country[i]);
		}
		
		model.addAttribute("mainPlan", mainPlan);
		model.addAttribute("countryList",countryList);
		
		System.out.println("Controller : updateMainPlanView <END>");
		
		return "forward:/mainplan/updateMainPlanContent.jsp";
	
	}
	
	
	@RequestMapping(value = "updateMainPlan",method=RequestMethod.POST)
	public String updateMainPlan(@ModelAttribute("mainPlan") MainPlan mainPlan, Model model, HttpSession session) throws Exception {
		
		System.out.println("Controller : updateMainPlan <START>"+mainPlan);
		
		/////mainPlanUpdate////////////////////////////////////////////////////////////////
			String countryResult = "";
			for(int i = 0 ; i < mainPlan.getCountryList().length;i++) {
				if(i==mainPlan.getCountryList().length-1) {
					countryResult += mainPlan.getCountryList()[i];
				}else {
					countryResult += mainPlan.getCountryList()[i] + ",";
				}
			}
			mainPlan.setCity("no");
			mainPlan.setCountry(countryResult);
			
			User user = (User) session.getAttribute("user");
			
			if(mainPlan.getFile().getOriginalFilename() != null && mainPlan.getFile().getOriginalFilename() != "") {
				System.out.println("getOriginalFilename :: "+mainPlan.getFile().getOriginalFilename());
				String fileName = user.getUserNo()+"="+ mainPlan.getFile().getOriginalFilename();
				System.out.println("fileName :: "+fileName);
				mainPlan.setMainThumbnail(fileName);
				File file = new File(mainPlanFilePath, fileName);
				mainPlan.getFile().transferTo(file);
			}
		//////////////////////////////////////////////////////////////////////////////////
		
			
			
		/////dailyPlanUpdate//////////////////////////////////////////////////////////////
			
		MainPlan mainPlanDB = mainPlanService.getMainPlan(mainPlan.getMainPlanNo());
		Date departureDate = mainPlan.getDepartureDate();
		Date arrivalDate = mainPlan.getArrivalDate();
		Date departureDateDB = mainPlanDB.getDepartureDate();
		Date arrivalDateDB = mainPlanDB.getArrivalDate();
		Boolean departureCompared = departureDate.equals(departureDateDB)&&arrivalDate.equals(arrivalDateDB);
		
		String country = countryResult;
		String countryDB = mainPlanDB.getCountry();
		Boolean countryCompared = country.equals(countryDB);
		long diffDaysDB = mainPlanService.getDayCount(mainPlanDB.getMainPlanNo());
		System.out.println("?????");
		mainPlanService.updateMainPlan(mainPlan);
		
		////Case1 : 일정변경없이 city만 변경된 경우 => dailyPlan city 초기화하기 
//		if(!(cityCompared) && departureCompared) {
//			DailyPlan dailyPlan4City = new DailyPlan();
//			dailyPlan4City.setMainPlan(mainPlan);
//			List<DailyPlan> list4City = dailyPlanService.getDailyPlanList(mainPlan.getMainPlanNo());
//			System.out.println("debug: " + "일정변경없이 city만 변경된 경우" );
//			System.out.println("debug: " + list4City );
//			for(int i = 0 ; i<list4City.size() ; i++) {
//			
//				list4City.get(i).setDailyCity(cityResult);
//				list4City.get(i).setDailyCountry("");
//				dailyPlanService.updateDailyPlan(list4City.get(i)); // 변경된 도시명으로 daily_plan업데이트
//			}
//		}
		
		
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
					List<DailyPlan> list = dailyPlanService.getDailyPlanList(mainPlan.getMainPlanNo());
					
					Date dailyDate = mainPlan.getDepartureDate();
					
					for(int i = 0 ; i <diffDaysDB+1;i++) { 
						DailyPlan dailyPlanCheck = list.get(i);
						if(i>(diffDays)) {
							dailyPlanCheck.setDailyCity("");
							dailyPlanCheck.setDailyCountry("");
							dailyPlanCheck.setDay(0);
							dailyPlanService.updateDailyPlan(dailyPlanCheck);
						}else {
							
							dailyPlanCheck.setDailyCity("");
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
					
					//User user = (User) session.getAttribute("user");
					
					DailyPlan dailyPlan = new DailyPlan();
					dailyPlan.setMainPlan(mainPlan);
					dailyPlan.setUser(user);
					
					List<DailyPlan> list = dailyPlanService.getDailyPlanList(mainPlan.getMainPlanNo());
					
					for(int i = 0 ; i <diffDays+1;i++) {
						
						System.out.println("==>"+list.size());
						
						if(i<(diffDaysDB)+1) { //기존에 있던 데이터들 1-5
							DailyPlan dailyPlanCheck = list.get(i);
							dailyPlanCheck.setDay(i+1);
							dailyPlanCheck.setDailyDate(dailyDate);
							dailyPlanCheck.setDailyCity("");
							dailyPlanCheck.setDailyCountry("");
							dailyPlanService.updateDailyPlan(dailyPlanCheck);
							System.out.println("국가&도시 미표기 처리 된 dailyPlan 정보 : " + dailyPlanCheck);
						
						}else { //추가되야 할 데이터들 5-10
					        	dailyPlan.setDailyCity("");
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
				        
					}}}}

		model.addAttribute("mainPlan", mainPlan);
		System.out.println("Controller : updateMainPlan <END>");
		
		return "forward:/mainplan/listMainPlan";
	}
	
	@RequestMapping(value = "deleteMainPlan")
	public String deleteMainPlan(@RequestParam("mainPlanNo") int mainPlanNo, Model model, HttpSession session) throws Exception {
		
		System.out.println("Controller : deleteMainPlan <START>");
		System.out.println("debug : " +mainPlanService.getMainPlan(mainPlanNo));
		
		
		List<DailyPlan> list = dailyPlanService.getDailyPlanList(mainPlanNo);
		
		for(DailyPlan deleteList : list) {
			int dailyPlanNo = deleteList.getDailyPlanNo();
			dailyPlanService.deletePlanContent(dailyPlanNo); // 데일리플랜 번호로 연결된 콘텐츠 삭제 
		}
		
		dailyPlanService.deleteDailyPlan(mainPlanNo); // 메인플랜 번호로 연결된 데일리 플랜 삭제 
		
		mainPlanService.deleteMainPlan(mainPlanNo); 
		
		
		System.out.println("Controller : deleteMainPlan <END>");
		
		return "forward:/mainplan/listMainPlan";
		
	}
	
	///////////////////////////////// SCRAP ////////////////////////////////////////
	
	@RequestMapping(value = "listScrap")
	public String listScrap(Model model, HttpSession session) throws Exception {
		
		System.out.println("Controller : listScrap <START>");
		User user = (User)session.getAttribute("user");
		List<Scrap> list = mainPlanService.listScrap(user.getUserNo());
		model.addAttribute("list",list);
		System.out.println("Controller : listScrap <END>");
		
		return "forward:/mainplan/listScrap.jsp";
	}
	
	@RequestMapping(value = "deleteScrap")
	public String deleteScrap(@RequestParam("scrapNo") int scrapNo,Model model, HttpSession session) throws Exception {
		
		System.out.println("Controller : deleteScrap <START>");
		mainPlanService.deleteScrap(scrapNo);
		System.out.println("Controller : deleteScrap <END>");
		
		return "forward:/mainplan/listScrap";
	}
	
	
	
	
}
