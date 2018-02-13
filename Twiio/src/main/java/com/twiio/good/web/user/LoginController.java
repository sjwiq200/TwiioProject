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
import org.springframework.web.multipart.MultipartFile;

import com.twiio.good.common.Page;
import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Properties;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.user.UserService;


//==> ȸ������ Controller
@Controller
@RequestMapping("/user/*")
public class LoginController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ���� ����
		
	public LoginController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	////////���� ���ε�////////
	@Value("#{commonProperties['uploadFilePath']}")
	String uploadFilePath;
	
		
	
	
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login() throws Exception{
		
		System.out.println("/user/login : GET");

		return "redirect:/user/loginView.jsp";
	}
	
	@RequestMapping( value="login", method=RequestMethod.POST )
	public String login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
		
		System.out.println("/user/login : POST");
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
		
		if(dbUser==null) {
			return "redirect:/user/loginView.jsp";
		}
		
		if(dbUser.getUserLeave()!=null) {
			
			return "redirect:/user/loginView.jsp";
		}
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		return "redirect:/main.jsp";
	}
		
	
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/user/logout : GET");		
		
		session.invalidate();
		
		return "redirect:/main.jsp";
	}	
	
	
	@RequestMapping(value="kakaologin", produces = "user/json", method = {RequestMethod.GET, RequestMethod.POST})
	public String kakaologin(@RequestParam("accessToken") String access_token , HttpSession session) throws Exception{
		
            System.out.println("kakaologin Controller���� / accessToken�� : " + access_token);                    
            
            User user = userService.kakaoLogin(access_token);   		 	

            System.out.println(user.getUserName()+"���� īī������ ���� �α����ϼ̽��ϴ�. ");
            
            session.setAttribute("user", user);

            return "redirect:/main.jsp";

	}
	
	@RequestMapping(value = "googleLogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleLogin( @RequestParam("code") String code, HttpSession session) throws Exception {

		System.out.println("googleLogin Controller�� �����Ͽ����ϴ�. code�� : " +code);
		
		User user = userService.googleLogin(code);
			
		System.out.println(user.getUserName() + "���� ������ ���� �α����ϼ̽��ϴ�. ");
		
		session.setAttribute("user", user);

		return "redirect:/main.jsp";
		
	}
	
	@RequestMapping( value="facebookLogin" )
	public String facebookLogin(@RequestParam("userfaceId") String userId, @RequestParam("userName") String userName, HttpSession session) throws Exception{
		
		System.out.println("/user/facebookLogin");		
		
		User user = new User();
		if(userService.getUser(userId)!=null){
			System.out.println(":: facebook Login ::");
			
			user = userService.getUser(userId);
			session.setAttribute("user", user);
			
		}else {
			System.out.println(":: facebook Login �̷¾��� ::");
			user.setUserId(userId);
			user.setUserName(userName);
			user.setUserRegisterType("F");
			
//			if(!image.isEmpty()) {
//				System.out.println(":: FileName :: "+image.getOriginalFilename());
//				user.setUserImage(image.getOriginalFilename());
//			}
			
			userService.addUser(user);
			System.out.println(":: facebook ȸ������ ::");
			session.setAttribute("user", user);
		}
		
		System.out.println(userName+"���� ���̽����� ���� �α����ϼ̽��ϴ�. ");
		
		return "redirect:/main.jsp";
	}	
	
}