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
@RequestMapping({ "/common/*" })
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

}