package com.twiio.good.web.dailyplan;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
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
import com.twiio.good.service.domain.DailyPlan;
import com.twiio.good.service.domain.PlanContent;
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

		System.out.println("Controller : listMainPlan <END>");

		model.addAttribute("list", list);
		return "forward:/dailyplan/listDailyPlan.jsp";

	}

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

	@RequestMapping(value = "addText", method = RequestMethod.POST)
	public String addText(@RequestParam("dailyPlanNo") int dailyPlanNo, @RequestParam String contentText,
			HttpServletRequest request, Model model) throws Exception {

		System.out.println("Controller : addText <START>");

		DailyPlan dailyPlan = dailyPlanService.getDailyPlan(dailyPlanNo);
		PlanContent planContent = new PlanContent();
		planContent.setDailyPlan(dailyPlan);
		planContent.setContentText(contentText);
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
			HttpServletRequest request,
			Model model) throws Exception {

		System.out.println("Controller : addMap <START>");
		
		String mapName = URLDecoder.decode(request.getParameter("korName"),"UTF-8");
		String mapAddress = URLDecoder.decode(request.getParameter("korAddress"),"UTF-8");
		
		System.out.println("debug : "+dailyPlanNo);
		
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
		
		dailyPlanService.addPlanContent(planContent);

		System.out.println("Controller : addMap <END>");
		
		return "redirect:/dailyplan/getDailyPlan?dailyPlanNo=" + dailyPlanNo;

	}

	@RequestMapping(value = "addRoute", method = RequestMethod.POST)
	public String addRoute(@RequestParam("dailyPlanNo") int dailyPlanNo, @RequestParam String contentImage, Model model)
			throws Exception {

		System.out.println("Controller : addRoute <START>");

		DailyPlan dailyPlan = dailyPlanService.getDailyPlan(dailyPlanNo);
		PlanContent planContent = new PlanContent();
		planContent.setDailyPlan(dailyPlan);
		planContent.setContentImage(contentImage);
		planContent.setContentType(2);

		int a = dailyPlanService.getPlanContentCount(dailyPlanNo);
		planContent.setOrderNo(a + 1);
		dailyPlanService.addPlanContent(planContent);
		System.out.println("Controller : addRoute <END>");

		return "forward:/dailyplan/getDailyPlan?dailyPlanNo=" + dailyPlan.getDailyPlanNo();

	}

}
