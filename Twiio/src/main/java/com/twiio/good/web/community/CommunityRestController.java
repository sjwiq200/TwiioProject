package com.twiio.good.web.community;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.json.simple.JSONObject;
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
import org.springframework.web.multipart.MultipartFile;

import com.twiio.good.common.Page;
import com.twiio.good.common.Search;
import com.twiio.good.service.common.CommonService;
import com.twiio.good.service.community.CommunityService;
import com.twiio.good.service.domain.Community;
import com.twiio.good.service.domain.Reply;
import com.twiio.good.service.domain.Report;
import com.twiio.good.service.domain.User;


@RestController
@RequestMapping("/community/*")
public class CommunityRestController {
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	@Value("#{commonProperties['communityimagesFilePath']}")
	String communityimagesFilePath;
	
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
	
	@RequestMapping(value = "json/listCommunity")
	public List listCommunity(@RequestBody String pageInfo
							 ) throws Exception {
		
		System.out.println(pageInfo);
		String[] info = pageInfo.split("&");
		String[] resultpage = info[0].split("=");
		String[] communitytype = info[1].split("=");
		String[] searchCondition = info[2].split("=");
		String[] searchKeyword = info[3].split("=");
		String sk="";
		
		if(searchKeyword.length == 2) {	
			sk=searchKeyword[1];
		}
			
		Search search = new Search();
		search.setCurrentPage(Integer.parseInt(resultpage[1]));
		search.setSearchCondition(searchCondition[1]);
		search.setSearchKeyword(sk);
		System.out.println("Searchhhh::"+search);
		
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);
		System.out.println("아이들어오니??");
		Map<String , Object> map = communityService.listCommunity(search, communitytype[1]);
		System.out.println("search2:::"+search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);

		System.out.println("list :: "+map.get("list"));
		System.out.println("listsize :: "+((List)map.get("list")).size());
		//Map<String, Object> map2 = new HashMap<>();
		//List list = ;
		
		// Model 과 View 연결
		//map.put("list", map.get("list"));
		//map.put("resultPage", resultPage);
		//map.put("search", search);
		//map.put("communityType",communityType);
		//model.addAttribute("",);
		

		return (List)map.get("list");
		//return null;
	}
	
	@RequestMapping(value="json/uploadImage")
	public JSONObject uploadImage(Community community) {
		//String rootPath = request.getSession().getServletContext().getRealPath("/");
		System.out.println("rootPath :: "+communityimagesFilePath);
	    String uploadPath = communityimagesFilePath;
		String fileName =  System.currentTimeMillis()+community.getFile().getOriginalFilename();
		
		System.out.println("들어오니");
		try {
			System.out.println("들어오니1");
			File file = new File(communityimagesFilePath, fileName);
			community.getFile().transferTo(file);
			System.out.println("들어오니5");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		uploadPath += fileName;
		JSONObject jobj = new JSONObject();	
		String filePath = "/resources/images/communityimages/"+fileName;
		jobj.put("url", uploadPath);
		jobj.put("relativeUrl", filePath);
		System.out.println("들어오니6");
		try {
		Thread.sleep(15000);
		}catch(InterruptedException e) {
		
		}
		return jobj;
	}
}
