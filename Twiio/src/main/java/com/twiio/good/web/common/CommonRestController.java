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
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
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


	@RequestMapping(value = "json/addReply" )
	public Reply addReply(@RequestBody Reply reply,
			Model model
			) throws Exception {
		System.out.println("/common/addReply : POST");
		commonService.addReply(reply);
		return reply;
	}

	
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
	public List listCommunityReply(@RequestBody String pageInfo)
		 throws Exception {

		/*@ModelAttribute("search") Search search,
		@RequestParam("targetType") String targetType,
		@RequestParam("communityNo") int codeNo,
		Model model*/
		System.out.println(pageInfo);
		String[] info = pageInfo.split("&");
		String[] resultpage = info[0].split("=");
		String[] targetType = info[1].split("=");
		String[] communityNo = info[2].split("=");
		
		Search search = new Search();
		search.setCurrentPage(Integer.parseInt(resultpage[1]));
		
		System.out.println("/common/listReply");
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		Map<String , Object> map=commonService.listReply(search, targetType[1], Integer.parseInt(communityNo[1]));
		//Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCountReply")).intValue(), pageUnit, pageSize);
		
		/*model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);*/
		return (List)map.get("list");
	}
	
	@RequestMapping(value = "json/listProductReply")
	public List listProductReply(@ModelAttribute("search") Search search,
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
		return null;
	}
}