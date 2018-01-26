package com.twiio.good.web.transaction;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Product;
import com.twiio.good.service.domain.Refund;
import com.twiio.good.service.domain.Transaction;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.product.ProductService;
import com.twiio.good.service.transaction.TransactionService;
import com.twiio.good.service.user.UserService;


@Controller
@RequestMapping("/transaction/*")
public class TransactionController {

	@Autowired
	@Qualifier("transactionServiceImpl")
	private TransactionService transactionService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 않음
		
	public TransactionController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	//@RequestMapping("/addPurchaseView.do")
	@RequestMapping(value="addTransaction", method=RequestMethod.GET)
	public String addPurchase(@RequestParam("prod_no") int prodNo, Map<String, Object> map) throws Exception {

		System.out.println("/transaction/addPurchase : GET");
				
		return "forward:/purchase/addPurchaseView.jsp";
	}
	
	@RequestMapping(value="kakaoPayReady", method=RequestMethod.POST)//@RequestParam("buyerNo") int buyerNo,
	public String kakaoPayReady(@ModelAttribute("transaction") Transaction transaction, @ModelAttribute("product") Product product, Map<String, Object> map) throws Exception{
		
		System.out.println("/transaction/kakaoPayReady : POST");
		
		product = productService.getProduct(product.getProductNo());
		transaction.setTranPro(product);
				
		String URL = transactionService.kakaoPayReady(transaction);
		
		return URL;
	}
	
	@RequestMapping(value="kakaoApproval", method=RequestMethod.GET)
	public void kakaoApproval(@RequestParam("pg_token") String pgToken) throws Exception{
		System.out.println("/transaction/kakaoApproval : GET");
		System.out.println("pgToken : "+pgToken);
		
		kakaoApproval(pgToken);
		
	}
	
	@RequestMapping(value="kakaoCancel", method=RequestMethod.GET)
	public void kakaoCancel(@RequestParam("tranNo") int tranNo) throws Exception{
		System.out.println("/transaction/kakaoCancel : GET");
	}
	
	@RequestMapping(value="kakaoFail", method=RequestMethod.GET)
	public void kakaoFail(Transaction transaction) throws Exception{
		System.out.println("/transaction/kakaoFail : GET");
	}
	
	@RequestMapping(value="kakaoOrder", method=RequestMethod.POST)
	public void kakaoOrder() throws Exception{
		System.out.println("/transaction/kakaoOrder : POST");
	}
	
	@RequestMapping(value="payPal", method=RequestMethod.POST)
	public void payPal(Transaction transaction) throws Exception{
		System.out.println("/transaction/payPal : POST");
	}
	
	
	
//	//@RequestMapping("/addPurchase.do")
//	@RequestMapping(value="addTransaction", method=RequestMethod.POST)
//	public String addPurchase( @ModelAttribute("purchase") Purchase purchase, @ModelAttribute("product") Product product, @RequestParam("buyerId") String buyerId, Map<String, Object> map) throws Exception {
//
//		System.out.println("/purchase/addPurchase : POST");
//		
//		purchase.setPurchaseProd(product);
//		purchase.setBuyer(userService.getUser(buyerId));
//		
//		//Business Logic
//		purchaseService.addPurchase(purchase);
//		
//		map.put("purchase", purchase);
//		
//		return "forward:/purchase/addPurchase.jsp";
//	}
	
	//@RequestMapping("/getPurchase.do")
	@RequestMapping(value="getTransaction", method=RequestMethod.GET)
	public String getPurchase( @RequestParam("tranNo") int tranNo , Map<String, Object> map) throws Exception {
		
		System.out.println("/transaction/getTransaction : GET");
		//Business Logic
		Transaction transaction = transactionService.getTransaction(tranNo);
		// Model 과 View 연결
		map.put("transaction", transaction);		
		
		return "forward:/purchase/getPurchase.jsp";
	}
	
	//@RequestMapping("/updatePurchaseView.do")
//	@RequestMapping(value="updateTransactionCode", method=RequestMethod.GET)
//	public String updateTransactionCode(@RequestParam("tranNo") int tranNo , Map<String, Object> map ) throws Exception{
//
//		System.out.println("/purchase/updatePurchaseCode : GET");
//		
//		//Business Logic
//		Transaction transaction = new Transaction();
//		transaction.setTranNo(tranNo);
//		transaction.setRefundCode("2");
//		transactionService.updateTransactionCode(transaction);
//		// Model 과 View 연결
//		//model.addAttribute("purchase", purchase);
//		
//		return "forward:/purchase/updatePurchaseView.jsp";
//	}	
		
	//@RequestMapping("/listPurchase.do")
	@RequestMapping( value="listTransaction" )
	public String listPurchase( @ModelAttribute("search") Search search , Map<String, Object> map, HttpSession session) throws Exception{
		
		System.out.println("/transaction/listTransaction : ");
		System.out.println(search.getCurrentPage());
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		User user = (User)session.getAttribute("user");
		map=transactionService.listTransaction(search, user);
				
		//Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		//System.out.println(resultPage);
		
		// Model 과 View 연결
		//model.addAttribute("list", map.get("list"));
		//model.addAttribute("resultPage", resultPage);
				
		return "forward:/purchase/listPurchase.jsp";
	}
	
	// @RequestMapping("/updatePurchase.do")
	@RequestMapping(value = "addRefund", method = RequestMethod.POST)
	public String addRefund(@ModelAttribute("refund") Refund refund) throws Exception {

		System.out.println("/transaction/addRefund : POST");
		
		// Business Logic		
		transactionService.addRefund(refund);

		return "redirect:/purchase/getPurchase?tranNo=";
	}
	
	//@RequestMapping("/updateTranCode.do")
	@RequestMapping(value="deleteRefund", method=RequestMethod.GET)
	public String deleteRefund(@RequestParam("tranNo") int tranNo) throws Exception {
		
		System.out.println("/transaction/deleteRefund : GET");
				
		transactionService.deleteRefund(tranNo);
		
		return"forward:/purchase/listPurchase";
	}
	
	//@RequestMapping("/updateTranCodeByProd.do")
	@RequestMapping(value="updateRefund", method=RequestMethod.GET)
	public String updateRefund(@ModelAttribute("refund") Refund refund) throws Exception {
		
		System.out.println("/transaction/updateRefund : GET");
				
		transactionService.updateRefund(refund);
		
		return "forward:/product/listProduct?menu=manage";
	}
	
//	//@RequestMapping("/refundPurchase.do")
//	@RequestMapping(value="listHostPurchase", method=RequestMethod.GET)
//	public String listHostPurchase(@RequestParam("tranNo") int tranNo) throws Exception {
//
//		System.out.println("/transaction/listHostPurchase : GET");
//		
//		
//		
//		return "forward:/purchase/listPurchase";
//	}

}
