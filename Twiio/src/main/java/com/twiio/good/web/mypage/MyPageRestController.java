package com.twiio.good.web.mypage;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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
import org.springframework.web.bind.annotation.RestController;

import com.twiio.good.common.Page;
import com.twiio.good.common.Search;
import com.twiio.good.service.common.CommonService;
import com.twiio.good.service.community.CommunityService;
import com.twiio.good.service.domain.Community;
import com.twiio.good.service.domain.Message;
import com.twiio.good.service.domain.Reply;
import com.twiio.good.service.domain.Report;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.mypage.MyPageService;
import com.twiio.good.service.user.UserService;


@RestController
@RequestMapping("/mypage/*")
public class MyPageRestController {
	@Autowired
	@Qualifier("mypageServiceImpl")
	private MyPageService mypageService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
		
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	public MyPageRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(getClass());
	}
	
	
	
	@RequestMapping(value = "json/addMessage", method = RequestMethod.POST )
	public Message addMessage(@RequestBody Message message
							   ) throws Exception {
		System.out.println("/message/addMessage : POST");
		System.out.println("들어오니??");
		System.out.println(message);
		message.setUserName(userService.getUserInNo(message.getFromUserNo()).getUserName());
		message.setTargetUserName(userService.getUserInNo(message.getToUserNo()).getUserName());
		System.out.println("what is the message ==> " + message);
		mypageService.addMessage(message);
		
		System.out.println("저장되었ㄴ미??");
		return message;
	}
	
	@RequestMapping(value = "json/deleteMessage", method = RequestMethod.POST )
	public Message deleteMessage(@RequestBody Message message
							   ) throws Exception {
		System.out.println("/message/deleteMessage : POST");
		
		mypageService.deleteMessage(message.getMessageNo());
		System.out.println("저장되었ㄴ미??");
		return message;
	}
	
	@RequestMapping(value = "json/getMessage")
	public Message getMessage(@RequestBody Message message
							   ) throws Exception {
		System.out.println("/message/getMessage");
		message = mypageService.getMessage(message.getMessageNo());
		return message;
	}
	
	@RequestMapping("json/deleteSelectMessage/{messageNo}")
	public Map deleteMessage(@PathVariable("messageNo") String messageNoList) throws Exception{
		System.out.println(this.getClass()+"  json/deleteMessage");
		int count =0;
		String[] messageNos = ( (messageNoList.trim() ).split(",")); 
		
		for (int i = 0; i < messageNos.length; i++) {
			int messageNo = Integer.parseInt(messageNos[i]);
			System.out.println(messageNo);
			mypageService.deleteMessage(messageNo);
			++count;
		}
		
		Map map = new HashMap();
		map.put("count", count);
	
		return map;
		
	}
	
	
	/*
	@RequestMapping(value = "/message/deleteMessage", method = RequestMethod.GET )
	public String deleteCommunity(@RequestParam("messageNo") int messageNo,
							Model model
							) throws Exception {
		System.out.println("/message/deleteMessage : GET");
		mypageService.deleteMessage(messageNo);
		return "forward:/message/listMessage.jsp";
	}
	
	@RequestMapping(value = "/message/listMessage")
	public String listMessage(@ModelAttribute("search") Search search,
								HttpSession session,
								Model model
								) throws Exception {
		System.out.println("/message/listMessage");
		User user = (User)session.getAttribute("user");
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		System.out.println("search:::"+search);
		search.setPageSize(pageSize);
		Map<String , Object> map = mypageService.listMessage(search, user.getUserNo());
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		
		System.out.println("resultPage:::::"+resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		
		return "forward:/message/listMessage.jsp";
	}*/
	
}
