package com.twiio.good.web.common;

import com.twiio.good.common.Page;
import com.twiio.good.common.Search;
import com.twiio.good.service.common.CommonService;
import com.twiio.good.service.domain.Friend;
import com.twiio.good.service.domain.Reply;
import com.twiio.good.service.domain.Report;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.product.ProductService;
import com.twiio.good.service.user.UserService;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/common/*")
public class CommonRestController {

	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	/*
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("roomServiceImpl")
	private RoomService roomService;*/

	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	public CommonRestController() {
		System.out.println(getClass());
	}


	@RequestMapping(value = "json/addReply", method = RequestMethod.POST )
	public Map<String,Object> addReply(@RequestBody Reply reply, Search search
			) throws Exception {
		
		System.out.println("/common/json/addReply : POST");
		commonService.addReply(reply);

		search.setPageSize((pageSize * reply.getCurrentPage()));
		search.setCurrentPage(1);

		int targetNo = 0;
		if (reply.getCommunityNo() == 0) {
			reply.setTargetType("0");
			targetNo = reply.getProductNo();
		} else if (reply.getProductNo() == 0) {
			reply.setTargetType("1");
			targetNo = reply.getCommunityNo();
		}

		// System.out.println("(pageSize*reply.getCurrentPage())"+search.getPageSize());
		// System.out.println("search.setCurrentPage(1)"+search.getCurrentPage());
		Map<String, Object> map = commonService.listReply(search, reply.getTargetType(), targetNo);
		Map<String, Object> map2 = new HashMap<String, Object>();
		int totalCount = commonService.getTotalCountReply(reply.getTargetType(), targetNo);
		map2.put("list", (List) map.get("list"));
		map2.put("totalCount", totalCount);

		return map2;
	}
	
	@RequestMapping(value = "json/addReport",method = RequestMethod.POST)
	public Report addReport(@RequestBody Report report,HttpSession httpSession
			) throws Exception {
		System.out.println("/common/addReport : POST");
		System.out.println("report :: "+report);
		System.out.println("나왔어??1");
		User user = (User)httpSession.getAttribute("user");
		System.out.println("user : "+user);
		report.setUserName(user.getUserName());
		commonService.addReport(report);
		System.out.println("나왔어??");
		return report;
	}
	

	
	/*@RequestMapping(value = "json/confirmFriend",method = RequestMethod.POST)
	public String confirmFriend(@RequestBody Friend friend)throws Exception{
		System.out.println("/common/confirmfriend :POST");
		commonService.
		return null;
	}*/
	
	
	@RequestMapping(value = "json/deleteReply" )
	public String deleteReply(@RequestBody Reply reply
			) throws Exception {
		System.out.println("/common/deleteReply : GET");
		System.out.println(reply.getReplyNo());
		commonService.deleteReply(reply.getReplyNo());
		return "1";
	}


	@RequestMapping(value = "json/updateReply", method = RequestMethod.POST )
	public Reply updateReply(
			@RequestBody Reply reply
			) throws Exception {
		System.out.println("/common/updateReply : POST");
		commonService.updateReply(reply);
		return reply;
	}
	
	@RequestMapping(value = "json/listCommunityReply")
	public Map<String,Object> listCommunityReply(@RequestBody Reply reply,
			Search search)
		 throws Exception {
		
		System.out.println("/common/listReply");
		search.setPageSize((pageSize*reply.getCurrentPage()));
		search.setCurrentPage(1);	
		
		System.out.println("(pageSize*reply.getCurrentPage())"+search.getPageSize());
		System.out.println("search.setCurrentPage(1)"+search.getCurrentPage());
		Map<String , Object> map=commonService.listReply(search, "1", reply.getCommunityNo());
		System.out.println("reply.getCurrentPage :: "+reply.getCurrentPage());
		System.out.println("map.get(\"list\") :: "+map.get("list"));
		int totalCount = commonService.getTotalCountReply("1", reply.getCommunityNo());
		List list = (List) map.get("list");
		
		if(totalCount == list.size()) {
			list.add("1");
		}
		
		Map<String , Object> map2 = new HashMap<String , Object>();
		
		map2.put("list", (List)map.get("list"));
		map2.put("totalCount", totalCount);
		
		return map2;
	}
	
	@RequestMapping(value = "json/listProductReply")
	public Map<String, Object> listProductReply(@RequestBody Reply reply, Search search) throws Exception {
		System.out.println("/common/json/listProductReply");
		search.setPageSize((pageSize * reply.getCurrentPage()));
		search.setCurrentPage(1);

		System.out.println("(pageSize*reply.getCurrentPage())" + search.getPageSize());
		System.out.println("search.setCurrentPage(1)" + search.getCurrentPage());
		Map<String, Object> map = commonService.listReply(search, "0", reply.getProductNo());
		System.out.println("reply.getCurrentPage :: " + reply.getCurrentPage());
		System.out.println("map.get(\"list\") :: " + map.get("list"));
		int totalCount = commonService.getTotalCountReply("0", reply.getProductNo());
		List list = (List) map.get("list");

		if (totalCount == list.size()) {
			list.add("1");
		}

		Map<String, Object> map2 = new HashMap<String, Object>();

		map2.put("list", (List) map.get("list"));
		map2.put("totalCount", totalCount);

		return map2;
	}
	

	@RequestMapping(value = "json/addFriend")
	public Friend addFriend(@RequestBody Friend friend
			) throws Exception {
		boolean friendCheck = false;
		System.out.println("/common/addFriend : GET");
		
		System.out.println("listFriendOnly==>"+commonService.listFriendOnly(friend.getUserNo()));
		List<Friend> list = commonService.listFriendOnly(friend.getUserNo());
		for (Friend listFriend : list) {
			if(friend.getFriendNo() == listFriend.getFriendNo()) {
				friendCheck = true;
				break;
			}
		}
		if(friendCheck) {
			
		}else {
			commonService.addFriend(friend);
		}
		
		return friend;
	}
	
	@RequestMapping(value = "json/getReport" )
	public Report getReport(@RequestBody Report report) throws Exception {
		System.out.println("/common/getReport : GET");
		Report report2 = commonService.getReport(report.getReportNo());
		System.out.println("report2 : "+ report2);
		return report2;
	}
	
	@RequestMapping(value = "json/updateReport/{reportNo}" )
	public Report updateReport(@PathVariable int reportNo) throws Exception {
		
		System.out.println("/common/updateReport");
		
		Report report = commonService.updateReport(reportNo);
		
		System.out.println("report : "+ report);
		
		return report;
	}
}