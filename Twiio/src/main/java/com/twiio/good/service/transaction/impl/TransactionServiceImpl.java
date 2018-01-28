package com.twiio.good.service.transaction.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Refund;
import com.twiio.good.service.domain.Transaction;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.transaction.TransactionDao;
import com.twiio.good.service.transaction.TransactionService;

@Service("transactionServiceImpl")
public class TransactionServiceImpl implements TransactionService {

	@Autowired
	@Qualifier("transactionDaoImpl")
	private TransactionDao transactionDao;	
	public void setTransactionDao(TransactionDao transactionDao) {
		this.transactionDao = transactionDao;
	}
	
	private String cid="TC0ONETIME";
	private String tid;
	private String partner_user_id;
	private String partner_order_id="TWIIO";

	public TransactionServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public String kakaoPayReady(Transaction transaction) throws Exception {
		
		// String cid="TC0ONETIME";
		//partner_order_id = "TWIIO";
		//System.out.println("여기");
		// String partner_user_id=URLEncoder.encode(buyerId, "UTF-8");
		// String item_name=URLEncoder.encode(product.getProdName(), "UTF-8");
		partner_user_id = transaction.getUserName();
		String item_name = transaction.getTranPro().getProductName();
		//System.out.println("요기");
		String item_code = String.valueOf(transaction.getTranPro().getProductNo());
		int quantity = transaction.getCount();
		int total_amount = transaction.getTotalPrice();
		int tax_free_amount = 0;
		String approval_url = "http://127.0.0.1:8080/transaction/kakaoApproval";
		String cancel_url = "http://127.0.0.1:8080/transaction/kakaoCancel";
		String fail_url = "http://127.0.0.1:8080/transaction/kakaoFail";
		String readyPayURL = "https://kapi.kakao.com/v1/payment/ready";

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
		sb.append("&partner_user_id=" + partner_user_id);
		sb.append("&item_name=" + URLEncoder.encode(item_name, "UTF-8"));
		sb.append("&item_code=" + item_code);
		sb.append("&quantity=" + quantity);
		sb.append("&total_amount=" + total_amount);
		sb.append("&tax_free_amount=" + tax_free_amount);
		sb.append("&approval_url=" + approval_url);
		sb.append("&cancel_url=" + cancel_url);
		sb.append("&fail_url=" + fail_url);

		// sb.append("&partner_order_id=partner_order_id");
		// sb.append("&partner_user_id=partner_user_id");
		// sb.append("&item_name=초코파이");
		// //sb.append("&item_code="+item_code);
		// sb.append("&quantity=1");
		// sb.append("&total_amount=2200");
		// sb.append("&vat_amount=200");
		// sb.append("&tax_free_amount=0");
		// sb.append("&approval_url="+"http://127.0.0.1:8001/kakaoPay/approvalPurchase");
		// sb.append("&cancel_url="+"http://127.0.0.1:8080");
		// sb.append("&fail_url="+"http://127.0.0.1:8080");

		OutputStreamWriter out = new OutputStreamWriter(con.getOutputStream(), "UTF-8");
		out.write(sb.toString());
		out.flush();
		out.close();

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

		// Business Logic
		// purchaseService.addPurchase(purchase);

		// map.put("purchase", purchase);

		return "redirect:" + redirectPCURL;
		
	}

	@Override
	public void kakaoApproval(String pgToken) throws Exception {
		// TODO Auto-generated method stub
		//System.out.println("pgToken : "+pgToken);
		
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
        
        //tid = jsonobj.get("tid").toString();//server에 값저장
        System.out.println("item_name : "+URLDecoder.decode(jsonobj.get("item_name").toString(), "UTF-8"));
        System.out.println("tid : "+jsonobj.get("tid"));
        System.out.println("amount : "+jsonobj.get("amount"));       
		
	}

	@Override
	public void kakaoCancel(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
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
		        
        
//		//Business Logic
//		Purchase purchase = purchaseService.getPurchase(tranNo);
//		// Model 과 View 연결
//		model.addAttribute("purchase", purchase);		
//		
//		return "forward:/purchase/getPurchase.jsp";
		
	}

	@Override
	public void kakaoFail(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String kakaoOrder() throws Exception {
		// TODO Auto-generated method stub
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

	@Override
	public void payPal(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Transaction getTransaction(int tranNo) throws Exception {
		// TODO Auto-generated method stub
		return transactionDao.getTransaction(tranNo);
	}

	@Override
	public Map<String, Object> listTransaction(Search search, User user) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("user", user);
		List<Transaction> list = transactionDao.listTransaction(map);
		//user=null;
		//map.remove("user");
		//map.put("user", user);
		int totalCount = transactionDao.getTotalCount(map);
		
		map.clear();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}	

//	@Override
//	public void updateTransactionCode(Transaction transaction) throws Exception {
//		// TODO Auto-generated method stub
//		transactionDao.updateTransactionCode(transaction);
//	}

	@Override
	public void addRefund(Refund refund) throws Exception {
		// TODO Auto-generated method stub
		Transaction transaction =transactionDao.getTransaction(refund.getTranNo());
		transaction.setRefundCode("2");
		transactionDao.updateTransactionCode(transaction);
		transactionDao.addRefund(refund);
	}

	@Override
	public void updateRefund(Refund refund) throws Exception {
		// TODO Auto-generated method stub
		transactionDao.updateRefund(refund);
	}

	@Override//session userNo userType, search
	public Map<String, Object> listRefund(Search search, User user) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("user", user);
		List<Refund> list = transactionDao.listRefund(map);
		int totalCount = transactionDao.getTotalCount(map);
		
		map.clear();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public void deleteRefund(int tranNo) throws Exception {
		// TODO Auto-generated method stub		
		transactionDao.deleteRefund(tranNo);
		Transaction transaction = transactionDao.getTransaction(tranNo);
		transaction.setRefundCode("1");
		transactionDao.updateTransactionCode(transaction);
	}	

}
