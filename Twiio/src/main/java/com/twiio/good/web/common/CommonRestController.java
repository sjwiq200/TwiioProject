package com.twiio.good.web.common;

import com.twiio.good.common.Page;
import com.twiio.good.common.Search;
import com.twiio.good.service.common.CommonService;
import com.twiio.good.service.domain.Friend;
import com.twiio.good.service.domain.Reply;
import com.twiio.good.service.domain.Report;
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
		System.out.println("/common/addReply : POST");
		commonService.addReply(reply);
		search.setPageSize((pageSize*reply.getCurrentPage()));
		search.setCurrentPage(1);
		
		int targetNo=0;
		if(reply.getCommunityNo() == 0) {
			reply.setTargetType("0");
			targetNo = reply.getProductNo();
		}else if(reply.getProductNo()==0) {
			reply.setTargetType("1");
			targetNo = reply.getCommunityNo();
		}
		
		//System.out.println("(pageSize*reply.getCurrentPage())"+search.getPageSize());
		//System.out.println("search.setCurrentPage(1)"+search.getCurrentPage());
		Map<String , Object> map=commonService.listReply(search, reply.getTargetType(), targetNo);
		Map<String , Object> map2 = new HashMap<String , Object>();
		int totalCount = commonService.getTotalCountReply(reply.getTargetType(), targetNo);
		map2.put("list", (List)map.get("list"));
		map2.put("totalCount", totalCount);
		
		return map2;
	}
	
	@RequestMapping(value = "json/addReport",method = RequestMethod.POST)
	public Report addReport(@RequestBody Report report
			) throws Exception {
		System.out.println("/common/addReport : POST");
		System.out.println("report :: "+report);
		//commonService.addReport(report);
		return report;
	}
	
	@RequestMapping(value = "json/addFriend",method = RequestMethod.POST)
	public Friend addFriend(@RequestBody Friend friend
			) throws Exception {
		System.out.println("/common/addFriend : GET");
		commonService.addFriend(friend);
		System.out.println("친구추가완료");
		return friend;
	}
	
	/*@RequestMapping(value = "json/confirmFriend",method = RequestMethod.POST)
	public String confirmFriend(@RequestBody Friend friend)throws Exception{
		System.out.println("/common/confirmfriend :POST");
		commonService.
		return null;
	}*/
	
	
	@RequestMapping(value = "json/deleteReply", method = RequestMethod.GET )
	public void deleteReply(@PathVariable("replyNo") int replyNo
			) throws Exception {
		System.out.println("/common/deleteReply : GET");
		commonService.deleteReply(replyNo);
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
	public Map<String,Object> listProductReply(@RequestBody Reply reply,
			Search search
			) throws Exception {
		System.out.println("/common/listReply");
		search.setPageSize((pageSize*reply.getCurrentPage()));
		search.setCurrentPage(1);	
		
		System.out.println("(pageSize*reply.getCurrentPage())"+search.getPageSize());
		System.out.println("search.setCurrentPage(1)"+search.getCurrentPage());
		Map<String , Object> map=commonService.listReply(search, "0", reply.getProductNo());
		System.out.println("reply.getCurrentPage :: "+reply.getCurrentPage());
		System.out.println("map.get(\"list\") :: "+map.get("list"));
		int totalCount = commonService.getTotalCountReply("0", reply.getProductNo());
		List list = (List) map.get("list");
		
		if(totalCount == list.size()) {
			list.add("1");
		}
		
		Map<String , Object> map2 = new HashMap<String , Object>();
		
		map2.put("list", (List)map.get("list"));
		map2.put("totalCount", totalCount);
		
		return map2;
	}
	
	
}