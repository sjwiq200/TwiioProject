package com.twiio.good.web.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.twiio.good.service.domain.Transaction;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.user.UserService;


@Controller
@RequestMapping("/user/*")
public class UserController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ���� ����
		
	public UserController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	////////���� ���ε�////////
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
		
		System.out.println(user);
		user.setUserRegisterType("T");
		if(user.getFile()!=null) {
			if(userService.detectFace(user)) {
				user.setUserImage(user.getUserId()+"="+user.getFile().getOriginalFilename());
				userService.addUser(user);
				model.addAttribute("user",user);
				System.out.println(":: Twiio ���� ȸ������ �Ϸ�/���� ���ε�  ::");	
			}else {
				System.out.println(":: ȸ������ ���� =====> ���� ��Ȯ�� �ν��� �� �ִ� �������� �ٽ� ���ε� �ٶ�  ::");
			}			
		}else {
			//Business Logic
			userService.addUser(user);
			model.addAttribute("user",user);
			System.out.println(":: Twiio ���� ȸ������ �Ϸ� ::");
		}
		
		return "redirect:/user/loginView.jsp";
	}


	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( @RequestParam("userNo") int userNo , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUserInNo(userNo);
		User userEval = userService.getEvalUser(userNo);
		System.out.println("userEval : "+userEval);
		if(userEval != null) {
			double per = userEval.getUserEval();
			user.setUserEval(Double.parseDouble(String.format("%.2f",(per/20))));
			double per2 = userEval.getUserEvalCredit();
			user.setUserEvalCredit(Double.parseDouble(String.format("%.2f",(per2/20))));
		}
		
		
	
		System.out.println("regDate : "+user.getRegDate());
		// Model �� View ����
		//System.out.println("per : "+per);
		//System.out.println("per2 : "+per2);
		System.out.println("user :: "+user);
		model.addAttribute("user", user);
		
		return "forward:/user/getUser.jsp";
	}
	
	@RequestMapping( value="getHost", method=RequestMethod.GET )
	public String getHost(@ModelAttribute("search") Search search, @RequestParam("hostNo") int hostNo , Model model ) throws Exception {
		
		System.out.println("/user/getHost : GET");
		//Business Logic
		User host = userService.getUserInNo(hostNo);
		
		Transaction transaction = userService.getEvalHost(hostNo);
		double evalHost = transaction.getEvalHost();
		//////////////////////////review/////////////////////
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}		
		search.setPageSize(5);
		
		Map<String, Object> map = userService.listStarEvalHost(search, hostNo);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, search.getPageSize());
				
		// Model �� View ����
		model.addAttribute("host", host);
		model.addAttribute("evalHost", evalHost);
		model.addAttribute("totalCount", map.get("totalCount"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("reviewList", (List<Transaction>)map.get("list"));
		
		return "forward:/product/getHost.jsp";
	}

	@RequestMapping( value="updateUser", method=RequestMethod.GET )
	public String updateUser( @RequestParam("userNo") int userNo , Model model ) throws Exception{

		System.out.println("/user/updateUser : GET");
		//Business Logic
		User user = userService.getUserInNo(userNo);
		// Model �� View ����
		model.addAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}

	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public String updateUser( @ModelAttribute("user") User user , HttpSession session) throws Exception{

		System.out.println("/user/updateUser : POST");
		//Business Logic
		//userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
		return "redirect:/user/getUser?userNo="+user.getUserNo();
	}	

	
	@RequestMapping( value="listUser" )
	public String listUser( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/user/listUser : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map=userService.listUser(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		//model.addAttribute("search", search);
		
		return "forward:/user/listUser.jsp";
	}
	
	@RequestMapping( value="deleteUser")
	public String deleteUser( @RequestParam("userNo") int userNo , Model model ) throws Exception{

		System.out.println("/user/deleteUser : ");
		//Business Logic
		User user = userService.getUserInNo(userNo);
		// Model �� View ����
		model.addAttribute("user", user);
		
		return "forward:/main.jsp";
	}
	
	@RequestMapping( value="findId")
	public String findId( @ModelAttribute("user") User user , Model model ) throws Exception{

		System.out.println("/user/findId : ");
		//Business Logic
		String userId = userService.findId(user);
		
		//���� ���̵� ���ļ� ������
		int index = userId.length()-4;
		String userIdHint = userId.substring(0,index)+"****";
		// Model �� View ����
		model.addAttribute("userIdHint", userIdHint);
		
		return "forward:/user/updateUser.jsp";
	}
	
	@RequestMapping( value="findPassword")
	public String findPassword( @ModelAttribute("user") User user , Model model ) throws Exception{

		System.out.println("/user/findPassword : ");
		//Business Logic
		User dbUser = userService.getUser(user.getUserId());
		if(dbUser != null) {
			if(user.getUserEmail().equals(dbUser.getUserEmail()) && user.getUserName().equals(dbUser.getUserName())) {
				//�ӽ� �н����� �߱�
				//userService.findPassword(dbUser);
			}else {
				System.out.println(":: �̸� �Ǵ� �̸��� ����ġ ::");
			}
		}else {
			System.out.println(":: �������� �ʴ� ���̵� ::");
		}
		//User user = userService.getUser(user);
		// Model �� View ����
		//model.addAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}
	
	
	
	
}
