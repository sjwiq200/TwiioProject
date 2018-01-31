package com.twiio.good.web.transaction;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
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
	
	private String cid="TC0ONETIME";
	private String tid;
	private String partner_user_id;
	private String partner_order_id="TWIIO";
	private Transaction transactiondb;
	
	//@RequestParam("productNo") int productNo,@RequestParam("tripDate") String tripDate,@RequestParam("count") int count,
	//@RequestMapping("/addPurchaseView.do")@ModelAttribute("transaction") Transaction transaction, @ModelAttribute("product") Product product,
	@RequestMapping(value="addTransaction", method=RequestMethod.POST)
	public String addTransaction(@ModelAttribute("transaction") Transaction transaction, @RequestParam("productNo") int productNo, Map<String, Object> map) throws Exception {

		System.out.println("/transaction/addTransaction : POST");
		System.out.println(transaction);
		Product dbProduct =productService.getProduct(productNo);
		transaction.setTranPro(dbProduct);
		transaction.setTotalPrice(dbProduct.getProductPrice()*transaction.getCount());
		map.put("transaction", transaction);
				
		return "forward:/transaction/addTransaction.jsp";
	}
	
	@RequestMapping(value="kakaoPayReady", method=RequestMethod.POST)//@RequestParam("buyerNo") int buyerNo,
	public String kakaoPayReady(@ModelAttribute("transaction") Transaction transaction, @RequestParam("productNo") int productNo, Map<String, Object> map) throws Exception{
		
		System.out.println("/transaction/kakaoPayReady : POST");
		System.out.println("transaction :: "+transaction);
		Product dbproduct = productService.getProduct(productNo);
		transaction.setTranPro(dbproduct);
		transactiondb = transaction;
//				
//		String URL = transactionService.kakaoPayReady(transaction);
		partner_user_id = String.valueOf(transaction.getBuyerNo());
		String item_name = transaction.getTranPro().getProductName();
		//System.out.println("요기");
		String item_code = String.valueOf(transaction.getTranPro().getProductNo());
		int quantity = transaction.getCount();
		int total_amount = transaction.getTotalPrice();
		int tax_free_amount = 0;
		//System.out.println("여기 ::::::::::::::");
		String approval_url = "http://192.168.0.35:8080/transaction/kakaoApproval";
		String cancel_url = "http://192.168.0.35:8080/transaction/kakaoCancel";
		String fail_url = "http://192.168.0.35:8080/transaction/kakaoFail";
		String readyPayURL = "https://kapi.kakao.com/v1/payment/ready";
		
		//System.out.println("여기2 ::::::::::::::::::");
		URL url = new URL(readyPayURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("POST");
		con.setRequestProperty("Authorization", "KakaoAK a869cdaa9ef0e13b679fe56d980bcacf");
		con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		con.setDoOutput(true);
		con.setDoInput(true);
		//System.out.println("33333333333333333333");
		StringBuffer sb = new StringBuffer("cid=" + cid);
		sb.append("&partner_order_id=" + partner_order_id);
		//System.out.println(partner_user_id);
		sb.append("&partner_user_id=" + partner_user_id);
		//System.out.println("33333333333333333333");
		sb.append("&item_name=" + URLEncoder.encode(item_name, "UTF-8"));
		sb.append("&item_code=" + item_code);
		sb.append("&quantity=" + quantity);
		sb.append("&total_amount=" + total_amount);
		sb.append("&tax_free_amount=" + tax_free_amount);
		sb.append("&approval_url=" + approval_url);
		sb.append("&cancel_url=" + cancel_url);
		sb.append("&fail_url=" + fail_url);
		
		////////////////////////////////////////////////////////
		
		OutputStreamWriter out = new OutputStreamWriter(con.getOutputStream(), "UTF-8");
		out.write(sb.toString());
		out.flush();
		out.close();
		System.out.println("44444444444444444444");
		// Response Code GET
		int responseCode = con.getResponseCode();
		System.out.println("responseCode==" + responseCode);

		BufferedReader br = null;

		if (responseCode == 200/* HttpURLConnection.HTTP_OK */) {
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else {

			// System.out.println(con.getErrorStream());
			System.out.println(con.getResponseMessage());
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			System.out.println(br);
			transactiondb = null;
		}

		// JSON Data 읽기
		String jsonData = "";
		StringBuffer response = new StringBuffer();

		while ((jsonData = br.readLine()) != null) {
			response.append(jsonData);
		}

		br.close();

		System.out.println("HTTP 응답 코드 : " + responseCode);
		System.out.println("HTTP body : " + response.toString());

		JSONObject jsonobj = (JSONObject) JSONValue.parse(response.toString());
		System.out.println(jsonobj);

		tid = jsonobj.get("tid").toString();// server에 값저장
		System.out.println(jsonobj.get("tid"));
		String redirectPCURL = jsonobj.get("next_redirect_pc_url").toString();
		System.out.println(redirectPCURL);
		// Business Logic
		// purchaseService.addPurchase(purchase);

		// map.put("purchase", purchase);

		return "redirect:" + redirectPCURL;
		
		//return URL;
	}
	
	@RequestMapping(value="kakaoApproval", method=RequestMethod.GET)
	public String kakaoApproval(@RequestParam("pg_token") String pgToken) throws Exception{
		System.out.println("/transaction/kakaoApproval : GET");
		System.out.println("pgToken : "+pgToken);
		
		//kakaoApproval(pgToken);
		
		StringBuffer sb= new StringBuffer("cid="+cid);
		sb.append("&tid="+tid);
		sb.append("&partner_order_id="+partner_order_id);
		sb.append("&partner_user_id="+partner_user_id);
		sb.append("&pg_token="+pgToken);		
		
		String approvePayURL="https://kapi.kakao.com/v1/payment/approve";
		
		URL url=new URL(approvePayURL);
		HttpURLConnection con= (HttpURLConnection)url.openConnection();
		con.setRequestMethod("POST");
		con.setRequestProperty("Authorization", "KakaoAK a869cdaa9ef0e13b679fe56d980bcacf");
		con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		con.setDoOutput(true);
		con.setDoInput(true);
	
		OutputStreamWriter out = new OutputStreamWriter(con.getOutputStream(),"UTF-8");
		out.write(sb.toString());
		out.flush();
		out.close();
		
		// Response Code GET
        int responseCode = con.getResponseCode();
        System.out.println("responseCode=="+responseCode);
       
        BufferedReader br= null;
        
        if(responseCode==200/*HttpURLConnection.HTTP_OK*/) {
        	br=new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
        }else {
        	//System.out.println(con.getErrorStream());
        	System.out.println(con.getResponseMessage());
        	br=new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
        	System.out.println(br);
        	transactiondb = null;
        }
        
        //JSON Data 읽기
        String jsonData = "";
        StringBuffer response = new StringBuffer();
        
        while ((jsonData = br.readLine()) != null) {
            response.append(jsonData);
        }
        
        br.close();
        
        System.out.println("HTTP 응답 코드 : " + responseCode);
        System.out.println("HTTP body : " + response.toString());
        
        JSONObject jsonobj = (JSONObject)JSONValue.parse(response.toString());
        System.out.println("jsonobj :: "+jsonobj);
        
        //tid = jsonobj.get("tid").toString();//server에 값저장
        System.out.println("item_name : "+URLDecoder.decode(jsonobj.get("item_name").toString(), "UTF-8"));
        System.out.println("tid : "+jsonobj.get("tid"));
        System.out.println("amount : "+jsonobj.get("amount"));
        
        //ObjectMapper objectMapper = new ObjectMapper();
        //Transaction kakaoTransaction = objectMapper.readValue(jsonobj.toString(), Transaction.class);        
        //System.out.println("kakaoTransaction :: "+kakaoTransaction);
        transactiondb.setPaymentType("1");
        transactionService.addTransaction(transactiondb);
        
        return "forward:/transaction/popup.jsp";
		
	}
	
	@RequestMapping(value="kakaoCancel", method=RequestMethod.GET)
	public void kakaoCancel(@RequestParam("tranNo") int tranNo) throws Exception{
		System.out.println("/transaction/kakaoCancel : GET");
		
		String status= this.kakaoOrder();
		
		if(status.equals("CANCEL_PAYMENT")) {
			StringBuffer sb = new StringBuffer("cid="+cid);
			sb.append("&tid="+tid);
			sb.append("&cancel_amount="+tid);
			sb.append("&cancel_tax_free_amount="+tid);
			sb.append("&cancel_vat_amount="+tid);
			
			String cancelPayURL="https://kapi.kakao.com/v1/payment/cancel";
			
			URL url=new URL(cancelPayURL);
			HttpURLConnection con= (HttpURLConnection)url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK a869cdaa9ef0e13b679fe56d980bcacf");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			
			con.setDoOutput(true);
			con.setDoInput(true);
			
			OutputStreamWriter out = new OutputStreamWriter(con.getOutputStream(),"UTF-8");
			out.write(sb.toString());
			out.flush();
			out.close();
			
			// Response Code GET
	        int responseCode = con.getResponseCode();
	        System.out.println("responseCode=="+responseCode);
	       
	        BufferedReader br= null;
	        
	        if(responseCode==200/*HttpURLConnection.HTTP_OK*/) {
	        	br=new BufferedReader(new InputStreamReader(con.getInputStream()));
	        }else {
	        	//System.out.println(con.getErrorStream());
	        	System.out.println(con.getResponseMessage());
	        	br=new BufferedReader(new InputStreamReader(con.getErrorStream()));
	        	System.out.println(br);
	        }
	        
	        //JSON Data 읽기
	        String jsonData = "";
	        StringBuffer response = new StringBuffer();
	        
	        while ((jsonData = br.readLine()) != null) {
	            response.append(jsonData);
	        }
	        
	        br.close();
	        
	        System.out.println("HTTP 응답 코드 : " + responseCode);
	        System.out.println("HTTP body : " + response.toString());
	        
	        JSONObject jsonobj = (JSONObject)JSONValue.parse(response.toString());
	        System.out.println(jsonobj);
        }
	}
	
	@RequestMapping(value="kakaoFail", method=RequestMethod.GET)
	public void kakaoFail(Transaction transaction) throws Exception{
		System.out.println("/transaction/kakaoFail : GET");
	}
	
	@RequestMapping(value="kakaoOrder", method=RequestMethod.POST)
	public String kakaoOrder() throws Exception{
		System.out.println("/transaction/kakaoOrder : POST");
		
		StringBuffer sb = new StringBuffer("cid="+cid);
		sb.append("&tid="+tid);
		
		String cancelPayURL="https://kapi.kakao.com/v1/payment/order";
		
		URL url=new URL(cancelPayURL);
		HttpURLConnection con= (HttpURLConnection)url.openConnection();
		con.setRequestMethod("POST");
		con.setRequestProperty("Authorization", "KakaoAK a869cdaa9ef0e13b679fe56d980bcacf");
		con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		con.setDoOutput(true);
		con.setDoInput(true);
		
		OutputStreamWriter out = new OutputStreamWriter(con.getOutputStream(),"UTF-8");
		out.write(sb.toString());
		out.flush();
		out.close();
		
		// Response Code GET
        int responseCode = con.getResponseCode();
        System.out.println("responseCode=="+responseCode);
       
        BufferedReader br= null;
        
        if(responseCode==200/*HttpURLConnection.HTTP_OK*/) {
        	br=new BufferedReader(new InputStreamReader(con.getInputStream()));
        }else {
        	//System.out.println(con.getErrorStream());
        	System.out.println(con.getResponseMessage());
        	br=new BufferedReader(new InputStreamReader(con.getErrorStream()));
        	System.out.println(br);
        }
        
        //JSON Data 읽기
        String jsonData = "";
        StringBuffer response = new StringBuffer();
        
        while ((jsonData = br.readLine()) != null) {
            response.append(jsonData);
        }
        
        br.close();
        
        System.out.println("HTTP 응답 코드 : " + responseCode);
        System.out.println("HTTP body : " + response.toString());
        
        JSONObject jsonobj = (JSONObject)JSONValue.parse(response.toString());
        System.out.println("status : "+jsonobj.get("status").toString());
//		//Business Logic
//		purchaseService.updatePurchase(purchase);
//						
//		return "redirect:/purchase/getPurchase?tranNo="+purchase.getTranNo();
        
        return jsonobj.get("status").toString();
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
