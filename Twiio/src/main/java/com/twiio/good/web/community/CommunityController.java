package com.twiio.good.web.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.twiio.good.service.common.CommonService;
import com.twiio.good.service.community.CommunityService;
import com.twiio.good.service.domain.Community;
import com.twiio.good.service.domain.Report;


@Controller
@RequestMapping({"/community/"})
public class CommunityController {
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	public CommunityController() {
		// TODO Auto-generated constructor stub
		System.out.println(getClass());
	}
	
	@RequestMapping(value = "/community/addCommunity", method = RequestMethod.POST )
	public String addCommunity(@ModelAttribute("community") Community community ,
							Model model
			) throws Exception {
		System.out.println("/community/addCommunity : POST");

		//model.addAttribute("",);
		return "forward:/common/addReport.jsp";
	}
	
	@RequestMapping(value = "/community/getCommunity", method = RequestMethod.POST )
	public String getCommunity(@ModelAttribute("community") Community community ,
							Model model
			) throws Exception {
		System.out.println("/community/getCommunity : POST");
		
		//model.addAttribute("",);
		return "forward:/common/addReport.jsp";
	}
	
	@RequestMapping(value = "/community/deleteCommunity", method = RequestMethod.POST )
	public String deleteCommunity(@ModelAttribute("community") Community community ,
							Model model
			) throws Exception {
		System.out.println("/community/deleteCommunity : POST");
	
		//model.addAttribute("",);
		return "forward:/common/addReport.jsp";
	}
	
	@RequestMapping(value = "/community/updateCommunity", method = RequestMethod.POST )
	public String updateCommunity(@ModelAttribute("community") Community community ,
							Model model
			) throws Exception {
		System.out.println("/community/updateCommunity : POST");

		//model.addAttribute("",);
		return "forward:/common/addReport.jsp";
	}
	
	@RequestMapping(value = "/community/listCommunity", method = RequestMethod.POST )
	public String listCommunity(@ModelAttribute("community") Community community ,
							Model model
			) throws Exception {
		System.out.println("/community/listCommunity : POST");
		//model.addAttribute("",);
		return "forward:/common/addReport.jsp";
	}
	
	@RequestMapping(value = "/community/getBestTripReview", method = RequestMethod.POST )
	public String getBestTripReview(@ModelAttribute("report") Report report,
							Model model
			) throws Exception {
		System.out.println("/common/addReport : POST");
		commonService.addReport(report);
		model.addAttribute("report",report);
		return "forward:/common/addReport.jsp";
	}

}
