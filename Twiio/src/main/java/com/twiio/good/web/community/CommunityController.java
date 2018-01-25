package com.twiio.good.web.community;

import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.twiio.good.common.Page;
import com.twiio.good.common.Search;
import com.twiio.good.service.common.CommonService;
import com.twiio.good.service.community.CommunityService;
import com.twiio.good.service.domain.Community;
import com.twiio.good.service.domain.Reply;
import com.twiio.good.service.domain.Report;
import com.twiio.good.service.domain.User;


@Controller
@RequestMapping({"/community/*"})
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
	
	@RequestMapping(value = "/community/addCommunity", method = RequestMethod.GET )
	public String addCommunity(@RequestParam("communityType") String communityType,
							   Model model) throws Exception {
		System.out.println("/community/addCommunity : GET");
		model.addAttribute("communityType",communityType);
		return "forward:/community/addCommunity.jsp";
	}
	
	@RequestMapping(value = "/community/addCommunity", method = RequestMethod.POST )
	public String addCommunity(@ModelAttribute Community community,
							  @RequestParam("communityType") String communityType,
							  Search search,
							   Model model,
							   HttpSession session
							   ) throws Exception {
		System.out.println("/community/addCommunity : POST");
		
		User user = (User)session.getAttribute("user");
		community.setUserNo(user.getUserNo());
		community.setCommunityType(communityType);
		communityService.addCommunity(community);
		
		Community community2 = communityService.getCommunity(community.getCommunityNo());
		
		Map<String , Object> map = commonService.listReply(search, 1, community2.getCommunityNo());
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCountReply")).intValue(), pageUnit, pageSize);
		model.addAttribute("community",community2);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		
		return "forward:/community/getCommunity.jsp";
	}
	
	@RequestMapping(value = "/community/getCommunity")
	public String getCommunity(@RequestParam("communityNo") int communityNo,
							   Search search,
							   Model model
							   ) throws Exception {
		System.out.println("/community/getCommunity");
		
		Community community = communityService.getCommunity(communityNo);
		
		Map<String , Object> map = commonService.listReply(search, 1, communityNo);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCountReply")).intValue(), pageUnit, pageSize);
		model.addAttribute("community",community);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		return "forward:/common/getCommunity.jsp";
	}
	
	@RequestMapping(value = "/community/deleteCommunity", method = RequestMethod.GET )
	public String deleteCommunity(@RequestParam("communityNo") int communityNo,
							Model model,
							HttpSession session
							) throws Exception {
		System.out.println("/community/deleteCommunity : GET");
		communityService.deleteCommunity(communityNo);
		User user = (User)session.getAttribute("user");
		model.addAttribute("user",user);
		return "forward:/common/listCommunity.jsp";
	}
	
	@RequestMapping(value = "/community/updateCommunity", method = RequestMethod.POST )
	public String updateCommunity(@ModelAttribute("community") Community community ,
							Model model
							) throws Exception {
		System.out.println("/community/updateCommunity : POST");
		communityService.updateCommunity(community);
		community = communityService.getCommunity(community.getCommunityNo());
		model.addAttribute("community",community);
		  
		return "forward:/community/getCommunity?communityNo="+community.getCommunityNo();
	}
	
	@RequestMapping(value = "/community/updateCommunity", method = RequestMethod.GET )
	public String updateCommunity(@RequestParam("communityNo") int communityNo ,
							Model model
							) throws Exception {
		System.out.println("/community/updateCommunity : GET");

		Community community = communityService.getCommunity(communityNo);
		model.addAttribute("community",community);
		  
		return "forward:/community/updateCommunity.jsp";
	}
	
	@RequestMapping(value = "/community/listCommunity")
	public String listCommunity(@ModelAttribute("search") Search search,
								@RequestParam("communityType") String communityType,
								Model model
								) throws Exception {
		System.out.println("/community/listCommunity");
		System.out.println("들어오니??????????");
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		System.out.println("search:::"+search);
		search.setPageSize(pageSize);
		
		Map<String , Object> map = communityService.listCommunity(search, communityType);
		System.out.println("search2:::"+search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		
		System.out.println("resultPage:::::"+resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		//model.addAttribute("",);
		
		
		System.out.println("listController 종료");
		return "forward:/community/listCommunity.jsp";
	}
	
	
	//////////////////////////////??///////////////////////////////////////////////////
	@RequestMapping(value = "/community/getBestTripReview")
	public String getBestTripReview(@ModelAttribute("report") Report report,
							Model model
							) throws Exception {
		System.out.println("/community/getBestTripReview : POST");
	
		return "forward:/community/getBestTripReview.jsp";
	}

}
