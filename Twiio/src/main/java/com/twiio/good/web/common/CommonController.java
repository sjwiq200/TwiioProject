package com.twiio.good.web.common;

import com.twiio.good.common.Page;
import com.twiio.good.common.Search;
import com.twiio.good.service.common.CommonService;
import com.twiio.good.service.domain.Friend;
import com.twiio.good.service.domain.Reply;
import com.twiio.good.service.domain.Report;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.user.UserService;

import java.io.PrintStream;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/common/*")
public class CommonController {

	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	public CommonController() {
		System.out.println(getClass());
	}

	@RequestMapping(value = "addReport")
	public String addReport(@ModelAttribute("report") Report report,
							HttpSession session,
							Model model
			) throws Exception {
		System.out.println("/common/addReport : POST");
		System.out.println("되고있니?1");
		User user = (User)session.getAttribute("user");
		System.out.println("user : "+user);
		System.out.println("되고있니?2");
		report.setUserName(user.getUserName());
		commonService.addReport(report);
		model.addAttribute("report",report);
		return "forward:/common/addReport.jsp";
	}

	@RequestMapping(value = "addFriend", method = RequestMethod.POST )
	public String addFriend(@ModelAttribute("friend") Friend friend,
			Model model
			) throws Exception {
		System.out.println("addFriend : GET");
		commonService.addFriend(friend);
		model.addAttribute("friend",friend);
		return "forward:/common/addFriend.jsp";
	}

	@RequestMapping(value = "addReply", method = RequestMethod.POST )
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
		System.out.println("search :: "+search);
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		Map<String , Object> map=commonService.listReport(search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCountReport")).intValue(), pageUnit, pageSize);
		
		System.out.println("pagesize : "+resultPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		return "forward:/mypage/listReport.jsp";
	}

	/*@RequestMapping(value = "listFriend")
	public String listFriend(@ModelAttribute("search") Search search,
			@RequestParam("userNo") int userNo,
			Model model
			) throws Exception {
		System.out.println("listFriend");
		
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
	}*/
	
	@RequestMapping(value = "listFriend")
	public String listFriend(Model model,HttpSession session) throws Exception{
		System.out.println("/room/listFriend : ");
		
		User user = (User)session.getAttribute("user");
		
		System.out.println("user ==>" +user);
		
		List<Friend> list = commonService.listFriendOnly(user.getUserNo());

		
		List<User> listFriend = new Vector<>();
		for (Friend friend : list) {
			User user2 = userService.getUserInNo(friend.getFriendNo());

			user2.setProfilePublic(Integer.toString(friend.getNo()));
			listFriend.add(user2);
		}
		
		System.out.println("list :: "+listFriend);
		model.addAttribute("list", listFriend);

		return "forward:/mypage/listFriend.jsp";
	}

	@RequestMapping(value = "listProductReply")
	public String listProductReply(@ModelAttribute("search") Search search,
			@RequestParam("targetType") String targetType,
			@RequestParam("productNo") int codeNo,
			Model model
			) throws Exception {
		System.out.println("/common/listReply");
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		Map<String , Object> map=commonService.listReply(search, targetType, codeNo);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCountReply")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		return "forward:/common/listReply.jsp";
	}
	
	@RequestMapping(value = "listCommunityReply")
	public String listCommunityReply(@ModelAttribute("search") Search search,
			@RequestParam("targetType") String targetType,
			@RequestParam("communityNo") int codeNo,
			Model model
			) throws Exception {
		System.out.println("/common/listReply");
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		Map<String , Object> map=commonService.listReply(search, targetType, codeNo);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCountReply")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		return "forward:/common/listReply.jsp";
	}
	
	@RequestMapping(value = "listRefund")
	public String listRefund(@ModelAttribute("search") Search search,
			Model model
			) throws Exception {
		System.out.println("/common/listRefund");
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		Map<String , Object> map=commonService.listRefund(search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCountReply")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		return "forward:/mypage/listRefund.jsp";
	}

	/////////////////////////////////////////////////////
	@RequestMapping(value = "getReport", method = RequestMethod.GET )
	public String getReport(@RequestParam("reportNo") int reportNo , Model model) throws Exception {
		System.out.println("/common/getReport : GET");
		Report report = commonService.getReport(reportNo);
		model.addAttribute("report", report);
		return "forward:/common/getReport.jsp";
	}
	/////////////////////////////////보류///////////////////////////////////////////
	/////////////////////////////////////////////////////
	@RequestMapping(value = "deleteFriend", method = RequestMethod.GET )
	public String deleteFriend(@RequestParam("no") int no ,
								HttpSession session,
								Model model) throws Exception {
		System.out.println("/common/deleteFriend : GET");
		int userNo = (int)session.getAttribute("userNo");
		commonService.deleteFriend(no);
		
		return "forward:/common/deleteFriend.jsp";
	}

	@RequestMapping(value = "deleteReply", method = RequestMethod.GET )
	public String deleteReply(@RequestParam("replyNo") int replyNo,
			Model model
			) throws Exception {
		System.out.println("/common/deleteReply : GET");
		commonService.deleteReply(replyNo);
		return "forward:/common/deleteReply.jsp";
	}

	/////////////////////////////////////////////////////
	@RequestMapping(value = "updateReply", method = RequestMethod.POST )
	public String updateReply(
			@ModelAttribute("reply") Reply reply,
			Model model
			) throws Exception {
		System.out.println("/common/updateReply : POST");
		commonService.updateReply(reply);
		return "forward:/common/updateReply.jsp";
	}
	////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value = "listSearch", method = RequestMethod.POST )
	public String listSearch() {
			return null;
	}
	
}