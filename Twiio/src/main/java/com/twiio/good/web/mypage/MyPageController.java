package com.twiio.good.web.mypage;

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
import com.twiio.good.service.domain.Message;
import com.twiio.good.service.domain.Reply;
import com.twiio.good.service.domain.Report;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.mypage.MyPageService;


@Controller
@RequestMapping({"/mypage/*"})
public class MyPageController {
	@Autowired
	@Qualifier("mypageServiceImpl")
	private MyPageService mypageService;
		
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	public MyPageController() {
		// TODO Auto-generated constructor stub
		System.out.println(getClass());
	}
	
	@RequestMapping(value = "/message/addMessage", method = RequestMethod.GET )
	public String addMessage(@RequestParam("userNo") int userNo,
								Model model) throws Exception {
		System.out.println("/community/addMessageView : GET");
		
		model.addAttribute("userNo",userNo);
		return "forward:/message/addMessageView.jsp";
	}
	
	@RequestMapping(value = "/message/addMessage", method = RequestMethod.POST )
	public String addMessage(@ModelAttribute Message message,
							 @RequestParam("userNo") int userNo,
							   Model model
							   ) throws Exception {
		System.out.println("/message/addMessage : POST");
		
		//User user = (User)session.getAttribute("user");
		message.setFromUserNo(userNo);
		mypageService.addMessage(message);
		
		message = mypageService.getMessage(message.getMessageNo());
		model.addAttribute("message", message);
		
		//////////다시한번보기
		return "forward:/message/listMessage.jsp";
	}
	
	@RequestMapping(value = "/message/getMessage")
	public String getMessage(@RequestParam("messageNo") int messageNo,
							   Model model
							   ) throws Exception {
		System.out.println("/message/getMessage");
		
		Message message = mypageService.getMessage(messageNo);
		
		model.addAttribute("message", message);
		
		return "forward:/message/getMessage.jsp";
	}
	
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
	}
	
}
