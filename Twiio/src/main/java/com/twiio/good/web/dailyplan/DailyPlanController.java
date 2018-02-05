package com.twiio.good.web.dailyplan;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.twiio.good.service.dailyplan.DailyPlanService;
import com.twiio.good.service.domain.Currency;
import com.twiio.good.service.domain.DailyPlan;
import com.twiio.good.service.domain.MainPlan;
import com.twiio.good.service.domain.PlanContent;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.information.InformationService;
import com.twiio.good.service.mainplan.MainPlanService;

@Controller
@RequestMapping("/dailyplan/*")
public class DailyPlanController {

	/// Field

	@Autowired
	@Qualifier("mainPlanServiceImpl")
	private MainPlanService mainPlanService;

	@Autowired
	@Qualifier("dailyPlanServiceImpl")
	private DailyPlanService dailyPlanService;
	
	@Autowired
	@Qualifier("informationServiceImpl")
	private InformationService informationService;

	public DailyPlanController() {

	}

	@RequestMapping(value = "listDailyPlan")
	public String listDailyPlan(@RequestParam("mainPlanNo") int mainPlanNo, Model model, HttpSession session)
			throws Exception {

		System.out.println("Controller : listDailyPlan <START>");
		List<DailyPlan> list = dailyPlanService.getDailyPlanList(mainPlanNo);
		for (DailyPlan result : list) {
			System.out.println("result : " + result);
		}
		
		MainPlan mainPlan = mainPlanService.getMainPlan(mainPlanNo);
		String city = mainPlan.getCity();
		String[] cityList = city.split(",");
		
		System.out.println("Controller : listMainPlan <END>");
		
		model.addAttribute("cityList",cityList);
		model.addAttribute("list", list);
		
		return "forward:/dailyplan/listDailyPlan.jsp";

	}
	
//	@RequestMapping(value = "listSharedPlan")
//	public String listSharedPlan(Model model, HttpSession session)
//			throws Exception {
//
//		System.out.println("Controller : listDailyPlan <START>");
//		User user = (User) session.getAttribute("user");
//		if(user.getMainPlanNoShared()!=null) {
//			List<DailyPlan> list = dailyPlanService.getDailyPlanList(mainPlanNo);
//		}
//		List<DailyPlan> list = dailyPlanService.getDailyPlanList(mainPlanNo);
//		for (DailyPlan result : list) {
//			System.out.println("result : " + result);
//		}
//		
//		MainPlan mainPlan = mainPlanService.getMainPlan(mainPlanNo);
//		String city = mainPlan.getCity();
//		String[] cityList = city.split(",");
//		
//		System.out.println("Controller : listMainPlan <END>");
//		
//		model.addAttribute("cityList",cityList);
//		model.addAttribute("list", list);
//		
//		return "forward:/dailyplan/listDailyPlan.jsp";
//
//	}
	

	@RequestMapping(value = "getDailyPlan")
	public String getDailyPlan(@RequestParam("dailyPlanNo") int dailyPlanNo, Model model, HttpSession session)
			throws Exception {

		System.out.println("Controller : getDailyPlan <START>");

		DailyPlan dailyPlan = dailyPlanService.getDailyPlan(dailyPlanNo);
		if (dailyPlanService.getPlanContentList(dailyPlanNo) != null) {
			List<PlanContent> list = dailyPlanService.getPlanContentList(dailyPlanNo);
			model.addAttribute("list", list);
		}
		model.addAttribute("dailyPlan", dailyPlan);
		System.out.println("Controller : getDailyPlan <END>");
		
		return "forward:/dailyplan/getDailyPlan.jsp";
	}

	/////////////////////////////////////// PlanContent/////////////////////////////////////////////////////////////

	@RequestMapping(value = "addText")
	public String addText(
			@RequestParam("dailyPlanNo") int dailyPlanNo,
			@RequestParam("textContents") String textContents,
			HttpServletRequest request, 
			Model model) throws Exception {

		System.out.println("Controller : addText <START>");

		DailyPlan dailyPlan = dailyPlanService.getDailyPlan(dailyPlanNo);
		PlanContent planContent = new PlanContent();
		
		planContent.setDailyPlan(dailyPlan);
		planContent.setContentText(textContents);
		planContent.setContentType(1);

		int orderNum = dailyPlanService.getPlanContentCount(dailyPlanNo);
		planContent.setOrderNo(orderNum + 1);
		dailyPlanService.addPlanContent(planContent);

		System.out.println("Controller : addText <END>");
		return "redirect:/dailyplan/getDailyPlan?dailyPlanNo=" + dailyPlanNo;
	}

	@RequestMapping(value = "addImage", method = RequestMethod.POST)
	public String addImage(@RequestParam("dailyPlanNo") int dailyPlanNo,
			@RequestParam("uploadFile") MultipartFile uploadFile, Model model, HttpSession session) throws Exception {

		System.out.println("Controller : addImage <START>");

		DailyPlan dailyPlan = null;

		dailyPlan = dailyPlanService.getDailyPlan(dailyPlanNo);
		PlanContent planContent = new PlanContent();
		String fileName = uploadFile.getOriginalFilename();

		planContent.setContentImage(fileName);
		planContent.setDailyPlan(dailyPlan);
		planContent.setContentType(2);

		try {
			File file = new File(
					"C:\\Users\\bitcamp\\git\\TwiioProject\\Twiio\\WebContent\\resources\\images\\dailyPlanContent\\"
							+ fileName);
			uploadFile.transferTo(file);
		} catch (IOException e) {
			e.printStackTrace();
		}

		int a = dailyPlanService.getPlanContentCount(dailyPlanNo);
		planContent.setOrderNo(a + 1);
		dailyPlanService.addPlanContent(planContent);

		return "redirect:/dailyplan/getDailyPlan?dailyPlanNo=" + dailyPlanNo;

	}

	@RequestMapping(value = "addMap")
	public String addMap(
			@RequestParam("mapUrl") String mapUrl,
			@RequestParam("mapType") String mapType, 
			@RequestParam("mapPhone") String mapPhone, 
			@RequestParam("dailyPlanNo") int dailyPlanNo, 
			@RequestParam("mapImage") String mapImage,
			HttpServletRequest request,
			Model model) throws Exception {

		String mapName = URLDecoder.decode(request.getParameter("korName"),"UTF-8");
		String mapAddress = URLDecoder.decode(request.getParameter("korAddress"),"UTF-8");
		
		mapImage = mapImage.replaceAll("[(]", "");
		mapImage =mapImage.replaceAll("[)]","");
		mapImage =mapImage.replaceAll(" ","");
		

		String mapImageResult = "https://maps.googleapis.com/maps/api/staticmap";
		mapImageResult += "?center=" + mapImage+ "&size=400x400&zoom=15&maptype=google.maps.MapTypeId.ROADMAP&markers=color:red|" + mapImage;
		
		DailyPlan dailyPlan = dailyPlanService.getDailyPlan(dailyPlanNo);
		
		PlanContent planContent = new PlanContent();
		int countForOrder = dailyPlanService.getPlanContentCount(dailyPlanNo);
		planContent.setContentType(3);
		planContent.setMapUrl(mapUrl);
		planContent.setMapType(mapType);
		planContent.setMapPhone(mapPhone);
		planContent.setMapAddress(mapAddress);
		planContent.setMapName(mapName);
		planContent.setDailyPlan(dailyPlan);
		planContent.setOrderNo(countForOrder+1);
		planContent.setMapImage(mapImageResult);
		
		dailyPlanService.addPlanContent(planContent);

		System.out.println("Controller : addMap <END>");
		
		return "redirect:/dailyplan/getDailyPlan?dailyPlanNo=" + dailyPlanNo;

	}
	
	@RequestMapping(value = "addRouteBefore", method = RequestMethod.GET)
	public String addRouteBefore(@RequestParam("dailyPlanNo") int dailyPlanNo, Model model, HttpSession session)
			throws Exception {

		System.out.println("Controller : addRouteBefore <START>");
		model.addAttribute("dailyPlanNo", dailyPlanNo);
		System.out.println("Controller : addRouteBefore <END>");
		
		return "forward:/dailyplan/addRoute.jsp";
	}
	
	
	@RequestMapping(value = "addRoute", method = RequestMethod.POST)
	public String addRoute(@RequestParam("dailyPlanNo") int dailyPlanNo, @RequestParam String totalDisplay, 
							@RequestParam("detailedDisplay") String detailedDisplay, @RequestParam("type") String type, Model model)
			throws Exception {

		System.out.println("Controller : addRoute <START>");
		System.out.println(dailyPlanNo + " : " + totalDisplay + " : " + detailedDisplay+" : " + type);
		
		DailyPlan dailyPlan = dailyPlanService.getDailyPlan(dailyPlanNo);
		PlanContent planContent = new PlanContent();
		planContent.setRouteDescription(totalDisplay+detailedDisplay);
		planContent.setRouteType("4");
		planContent.setContentType(4);
		planContent.setDailyPlan(dailyPlan);
		int a = dailyPlanService.getPlanContentCount(dailyPlanNo);
		planContent.setOrderNo(a + 1);
		dailyPlanService.addPlanContent(planContent);
		System.out.println("Controller : addRoute <END>");

		return "forward:/dailyplan/getDailyPlan?dailyPlanNo=" + dailyPlan.getDailyPlanNo();

	}
	///////////////////////////customizedPlanInfo///////////////////////////
	@RequestMapping(value = "customizedPlanInfo")
	public String customizedPlanInfo(@RequestParam int dailyPlanNo,
									@RequestParam String dailyCity,
									 @RequestParam String dailyDate,
									 Model model)throws Exception {
		
		System.out.println("RestController : customizedPlanInfo <START>");
		
		dailyCity= URLDecoder.decode(dailyCity,"UTF-8");
		List<Currency> returnList= new ArrayList<Currency>();
		returnList = informationService.addCurrency();
	        
	    model.addAttribute("returnList", returnList);
	    model.addAttribute("dailyPlanNo", dailyPlanNo);
	    model.addAttribute("dailyCitySelected", dailyCity);
	    model.addAttribute("dailyDate", dailyDate);
		
		return "forward:/dailyplan/customizedPlanInfo.jsp";
	}
	
}
