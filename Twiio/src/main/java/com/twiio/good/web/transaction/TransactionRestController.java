package com.twiio.good.web.transaction;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.DecimalFormat;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.twiio.good.common.Page;
import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Product;
import com.twiio.good.service.domain.Refund;
import com.twiio.good.service.domain.Transaction;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.information.InformationService;
import com.twiio.good.service.product.ProductService;
import com.twiio.good.service.transaction.TransactionService;
import com.twiio.good.service.user.UserService;


@RestController
@RequestMapping("/transaction/*")
public class TransactionRestController {

	@Autowired
	@Qualifier("transactionServiceImpl")
	private TransactionService transactionService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("informationServiceImpl")
	private InformationService informationService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 않음
		
	public TransactionRestController(){
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
	
	
	// @RequestMapping("/updatePurchase.do")
	@RequestMapping(value = "json/addRefund", method = RequestMethod.POST)
	public boolean addRefund(@RequestBody Refund refund) throws Exception {

		System.out.println("/transaction/addRefund : POST");
		
		// Business Logic		
		transactionService.addRefund(refund);


		return true;
	}
	
	//@RequestMapping("/updateTranCode.do")
	@RequestMapping(value="json/deleteRefund", method=RequestMethod.GET)
	public String deleteRefund(@RequestParam("tranNo") int tranNo
	) throws Exception {
		
		System.out.println("/transaction/deleteRefund : GET");
		
		transactionService.deleteRefund(tranNo);
		
		return"forward:/purchase/listPurchase";
	}
	
	//@RequestMapping("/updateTranCodeByProd.do")
	@RequestMapping(value="json/updateRefund", method=RequestMethod.GET)
	public String updateRefund(@ModelAttribute("refund") Refund refund) throws Exception {
		
		System.out.println("/transaction/updateRefund : GET");
				
		transactionService.updateRefund(refund);
		
		return "forward:/product/listProduct?menu=manage";
	}

}
