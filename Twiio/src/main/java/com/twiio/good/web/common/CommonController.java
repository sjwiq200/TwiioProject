package com.twiio.good.web.common;

import com.twiio.good.common.Page;
import com.twiio.good.common.Search;
import com.twiio.good.service.common.CommonService;
import com.twiio.good.service.domain.Friend;
import com.twiio.good.service.domain.Reply;
import com.twiio.good.service.domain.Report;

import java.io.PrintStream;
import java.util.Map;

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

@Controller
@RequestMapping({ "/common/*" })
public class CommonController {

	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;

	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	public CommonController() {
		System.out.println(getClass());
	}

	@RequestMapping(value = "/common/addReport", method = RequestMethod.POST )
	public String addReport(@ModelAttribute("report") Report report,
							Model model
			) throws Exception {
		System.out.println("/common/addReport : POST");
		commonService.addReport(report);
		model.addAttribute("report",report);
		return "forward:/common/addReport.jsp";
	}

	@RequestMapping(value = "/common/addFriend", method = RequestMethod.POST )
	public String addFriend(@ModelAttribute("friend") Friend friend,
			Model model
			) throws Exception {
		System.out.println("/common/addFriend : GET");
		commonService.addFriend(friend);
		model.addAttribute("friend",friend);
		return "forward:/common/addFriend.jsp";
	}

	@RequestMapping(value = "/common/addReply", method = RequestMethod.POST )
	public String addReply(@ModelAttribute("reply") Reply reply,
			Model model
			) throws Exception {
		System.out.println("/common/addReply : GET");
		commonService.addReply(reply);
		model.addAttribute("reply",reply);
		return "forward:/common/addReply.jsp";
	}

	////////////////////////////////////////////////////
	@RequestMapping(value = "listReport")
	public String listReport(@ModelAttribute("search") Search search,
			Model model
			
			) throws Exception {
		System.out.println("/common/listReport");
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		Map<String , Object> map=commonService.listReport(search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCountReport")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		return "forward:/common/listReport.jsp";
	}

	@RequestMapping(value = "/common/listFriend")
	public String listFriend(@ModelAttribute("search") Search search,
			@RequestParam("userNo") int userNo,
			Model model
			) throws Exception {
		System.out.println("/common/listFriend");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		Map<String , Object> map=commonService.listFriend(search, userNo);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCountFriend")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		return "forward:/common/listFriend.jsp";
	}

	@RequestMapping(value = "/common/listProductReply")
	public String listProductReply(@ModelAttribute("search") Search search,
			@RequestParam("divCode") int divCode,
			@RequestParam("productNo") int codeNo,
			Model model
			) throws Exception {
		System.out.println("/common/listReply");
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		Map<String , Object> map=commonService.listReply(search, divCode, codeNo);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCountReply")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		return "forward:/common/listReply.jsp";
	}
	
	@RequestMapping(value = "/common/listCommunityReply")
	public String listCommunityReply(@ModelAttribute("search") Search search,
			@RequestParam("divCode") int divCode,
			@RequestParam("communityNo") int codeNo,
			Model model
			) throws Exception {
		System.out.println("/common/listReply");
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		Map<String , Object> map=commonService.listReply(search, divCode, codeNo);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCountReply")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		return "forward:/common/listReply.jsp";
	}

	/////////////////////////////////////////////////////
	@RequestMapping(value = "/common/getReport", method = RequestMethod.GET )
	public String getReport(@RequestParam("reportNo") int reportNo , Model model) throws Exception {
		System.out.println("/common/getReport : GET");
		Report report = commonService.getReport(reportNo);
		model.addAttribute("report", report);
		return "forward:/common/getReport.jsp";
	}
	/////////////////////////////////º¸·ù///////////////////////////////////////////
	/////////////////////////////////////////////////////
	@RequestMapping(value = "/common/deleteFriend", method = RequestMethod.GET )
	public String deleteFriend(@RequestParam("no") int no ,
								HttpSession session,
								Model model) throws Exception {
		System.out.println("/common/deleteFriend : GET");
		int userNo = (int)session.getAttribute("userNo");
		commonService.deleteFriend(no);
		
		return "forward:/common/deleteFriend.jsp";
	}

	@RequestMapping(value = "/common/deleteReply", method = RequestMethod.GET )
	public String deleteReply(@RequestParam("replyNo") int replyNo,
			Model model
			) throws Exception {
		System.out.println("/common/deleteReply : GET");
		commonService.deleteReply(replyNo);
		return "forward:/common/deleteReply.jsp";
	}

	/////////////////////////////////////////////////////
	@RequestMapping(value = "/common/updateReply", method = RequestMethod.POST )
	public String updateReply(
			@ModelAttribute("reply") Reply reply,
			Model model
			) throws Exception {
		System.out.println("/common/updateReply : POST");
		commonService.updateReply(reply);
		return "forward:/common/updateReply.jsp";
	}
	////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value = "/common/listSearch", method = RequestMethod.POST )
	public String listSearch() {
			return null;
	}
	
}