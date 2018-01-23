package com.twiio.good.web.user;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
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
import com.twiio.good.service.domain.User;
import com.twiio.good.service.user.UserService;


@Controller
@RequestMapping("/user/*")
public class UserController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 않음
		
	public UserController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	////////사진 업로드////////
	@Value("#{commonProperties['path']}")
	String path;
	
	
	@RequestMapping( value="addUser", method=RequestMethod.GET )
	public String addUser() throws Exception{
	
		System.out.println("/user/addUser : GET");
		
		return "redirect:/user/addUserView.jsp";
	}
	
	@RequestMapping( value="addUser", method=RequestMethod.POST )
	public String addUser( @ModelAttribute("user") User user, Model model ) throws Exception {

		System.out.println("/user/addUser : POST");
		if(!user.getFile().isEmpty()) {
			model.addAttribute("user",user);
		return "forward:/user/naverCFR";	
		}else {
		//Business Logic
		userService.addUser(user);
		
		return "redirect:/user/loginView.jsp";
		}
	}


	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( @RequestParam("userNo") int userNo , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUserInNo(userNo);
		// Model 과 View 연결
		model.addAttribute("user", user);
		
		return "forward:/user/getUser.jsp";
	}
	

	@RequestMapping( value="updateUser", method=RequestMethod.GET )
	public String updateUser( @RequestParam("userNo") int userNo , Model model ) throws Exception{

		System.out.println("/user/updateUser : GET");
		//Business Logic
		User user = userService.getUserInNo(userNo);
		// Model 과 View 연결
		model.addAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}

	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session) throws Exception{

		System.out.println("/user/updateUser : POST");
		//Business Logic
		userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
		return "redirect:/user/getUser?userId="+user.getUserId();
	}
	
	
	

	
	@RequestMapping( value="listUser" )
	public String listUser( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/user/listUser : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=userService.listUser(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/user/listUser.jsp";
	}
	
	@RequestMapping( value="deleteUser")
	public String deleteUser( @RequestParam("userNo") int userNo , Model model ) throws Exception{

		System.out.println("/user/deleteUser : ");
		//Business Logic
		User user = userService.getUserInNo(userNo);
		// Model 과 View 연결
		model.addAttribute("user", user);
		
		return "forward:/main.jsp";
	}
	
	@RequestMapping( value="findId")
	public String findId( @ModelAttribute("user") User user , Model model ) throws Exception{

		System.out.println("/user/findId : ");
		//Business Logic
		String userId = userService.findId(user);
		// Model 과 View 연결
		model.addAttribute("userId", userId);
		
		return "forward:/user/updateUser.jsp";
	}
	
	@RequestMapping( value="findPassword")
	public String findPassword( @ModelAttribute("user") User user , Model model ) throws Exception{

		System.out.println("/user/findPassword : ");
		//Business Logic
		User user = userService.getUser(userId);
		// Model 과 View 연결
		model.addAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}
	
	
}
