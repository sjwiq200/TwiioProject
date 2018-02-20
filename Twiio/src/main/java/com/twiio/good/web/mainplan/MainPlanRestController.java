package com.twiio.good.web.mainplan;

import java.io.File;
import java.net.URLDecoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.twiio.good.service.common.CommonService;
import com.twiio.good.service.dailyplan.DailyPlanService;
import com.twiio.good.service.domain.DailyPlan;
import com.twiio.good.service.domain.Friend;
import com.twiio.good.service.domain.MainPlan;
import com.twiio.good.service.domain.PlanContent;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.information.InformationService;
import com.twiio.good.service.mainplan.MainPlanService;
import com.twiio.good.service.user.UserService;



@RestController
@RequestMapping({"/mainplan/*"})
public class MainPlanRestController {
	
	@Autowired
	@Qualifier("mainPlanServiceImpl")
	private MainPlanService mainPlanService;
	
	@Autowired
	@Qualifier("dailyPlanServiceImpl")
	private DailyPlanService dailyPlanService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	@Autowired
	@Qualifier("informationServiceImpl")
	private InformationService informationService;
	
	////////사진 업로드////////
	@Value("#{commonProperties['mainPlanFilePath']}")
	String mainPlanFilePath;
	
	public MainPlanRestController() {
	}
	
	
	@RequestMapping(value = "json/uploadImage", method = RequestMethod.POST )
	public String uploadImage(@RequestBody MultipartFile file) throws Exception {
		
		System.out.println("RestController : uploadImage <START>");
		System.out.println("file :: "+file);
		System.out.println("fileName :: "+file.getOriginalFilename());
		
		if(!file.isEmpty()) {
			File file02 = new File(mainPlanFilePath, file.getOriginalFilename());
			file.transferTo(file02);
		}
		
		System.out.println("RestController : uploadImage <END>");
		
		return null;
		
	}
	
	@RequestMapping(value = "json/listMainPlan", method = RequestMethod.POST)
	public List<MainPlan> listMainPlan(	@RequestBody User user) throws Exception {
		
		System.out.println("RestController : listMainPlan <START>");
		System.out.println("user :: "+user);
		
		User dbuser = userService.getUser(user.getUserId());
		
		MainPlan mainPlan = new MainPlan();
		mainPlan.setUser(dbuser);
		mainPlan.setEndClick(100);
		
		List<MainPlan> list = new ArrayList<MainPlan>();
		list = mainPlanService.getMainPlanList(mainPlan);
		
		System.out.println("RestController : listMainPlan <END>");
		
		return list;
		
	}
	
	@RequestMapping(value = "json/addMainPlan", method = RequestMethod.POST)
	public String addMainPlan(	@RequestBody MainPlan mainPlan) throws Exception {
		
		System.out.println("RestController : addMainPlan <START>");
		System.out.println("mainPlan :: "+mainPlan);
		System.out.println("mainPlan.mainThumbnail :: "+mainPlan.getMainThumbnail());
		
		String countryResult="";
		
		for(int i = 0 ; i < mainPlan.getCountryList().length;i++) {
			if(i== mainPlan.getCountryList().length-1) {
				countryResult +=  mainPlan.getCountryList()[i];
			}else {
				countryResult +=  mainPlan.getCountryList()[i] + ",";
			}
		}
		
		User user = userService.getUser(mainPlan.getUser().getUserId());
		//mainPlan.setCity(cityResult);
		mainPlan.setUser(user);
		mainPlan.setCountry(countryResult);
		mainPlan.setCity("no");
//		System.out.println("getOriginalFilename :: "+mainPlan.getFile().getOriginalFilename());
//		String fileName = user.getUserNo()+"="+ mainPlan.getFile().getOriginalFilename();
//		System.out.println("fileName :: "+fileName);
//		mainPlan.setMainThumbnail(fileName);
//		System.out.println("######debug : " + mainPlan);
//		File file = new File(mainPlanFilePath, fileName);
//		mainPlan.getFile().transferTo(file);
//		
		System.out.println("addMainPlan 직전 :::::");
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
	              
	              //dailyPlan.setDailyCity(cityResult);
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
	         //dailyPlan.setDailyCity(cityResult);
	           //dailyPlan.setDailyCountry(mainPlan.getCountry());
	           dailyPlan.setDay(1);
	           dailyPlan.setDailyDate(mainPlan.getArrivalDate());
	           dailyPlan.setMainPlan(mainPlan);
	           dailyPlan.setUser(user);
	      }
		
	    System.out.println("RestController : addMainPlan <END>");  
	      
		return "ok";
		
	}
	
	
}
