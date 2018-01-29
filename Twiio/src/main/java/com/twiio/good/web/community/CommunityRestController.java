package com.twiio.good.web.community;

import java.util.HashMap;
import java.util.List;
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
import com.twiio.good.service.domain.Reply;
import com.twiio.good.service.domain.Report;
import com.twiio.good.service.domain.User;


@RestController
@RequestMapping({"/community/*"})
public class CommunityRestController {
	
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

	public CommunityRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(getClass());
	}
	
	@RequestMapping(value = "json/listCommunity/{page}/{communityType}")
	public List listCommunity(@PathVariable String page,
							  @PathVariable String communityType 
							 ) throws Exception {
		Search search = null;
		
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		
		System.out.println("search:::"+search);
		search.setPageSize(pageSize);
		
		Map<String , Object> map = communityService.listCommunity(search, communityType);
		System.out.println("search2:::"+search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		
		//Map<String, Object> map2 = new HashMap<>();
		//List list = ;
		
		// Model °ú View ¿¬°á
		//map.put("list", map.get("list"));
		//map.put("resultPage", resultPage);
		//map.put("search", search);
		//map.put("communityType",communityType);
		//model.addAttribute("",);
		

		return (List)map.get("list");
	}
}
