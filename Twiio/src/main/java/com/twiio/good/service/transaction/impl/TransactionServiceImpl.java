package com.twiio.good.service.transaction.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Product;
import com.twiio.good.service.domain.Refund;
import com.twiio.good.service.domain.Transaction;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.product.ProductDao;
import com.twiio.good.service.product.ProductService;
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
	
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDao;
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	public TransactionServiceImpl() {
		System.out.println(this.getClass());
	}	

	@Override
	public void addTransaction(Transaction transaction) throws Exception {
		
		/////////////////////////////입금날짜 계산/////////////////////////////		
		Date tripDate = transaction.getTripDate();
		System.out.println("tripDate :: "+tripDate.toString());
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(tripDate);
		calendar.add(Calendar.DATE, 7);
		Date tripDate01 = calendar.getTime();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		System.out.println("tripDate :: "+tripDate01.toString());
		java.sql.Date tripDate02 = java.sql.Date.valueOf(simpleDateFormat.format(tripDate01));
		System.out.println("tripDate02 :: "+tripDate02);
		transaction.setPayToHostDate(tripDate02);
		//String tripDateToString = simpleDateFormat.format(tripDate);
		
		////////////////////////////재고정리////////////////////////
		int count = transaction.getCount();
		String[] str = productDao.getProduct(transaction.getTranPro().getProductNo()).getTripDate().split(",");
		String proTripDate="";
		//System.out.println("tripDateToString :: "+tripDateToString);		
		for(int i=0; i<str.length; i++) {
			//if(str[i].substring(0, 10).equals(tripDateToString)) {
			if(str[i].substring(0, 10).equals(tripDate.toString())) {
				System.out.println("오세요");
				System.out.println("str :: "+str[i]);
				String num = str[i].substring(11);
				System.out.println("num :: "+num);
				int proCount = Integer.parseInt(str[i].substring(11));
				System.out.println("또오세요");
				if(proCount!=0 && proCount>count) {
					count = proCount-count;
					if(i != str.length-1) {
						proTripDate += str[i].substring(0, 11)+count+",";
					}else {
						proTripDate += str[i].substring(0, 11)+count;
					}
					//transaction.getTranPro().setTripDate(tripDate);					
				}
			}else {
				if(i != str.length-1) {
					proTripDate += str[i]+",";
				}else {
					proTripDate += str[i];
				}				
			}			
		}
		Product dbProduct = productDao.getProduct(transaction.getTranPro().getProductNo());
		dbProduct.setTripDate(proTripDate);
		productDao.updateProduct(dbProduct);
		
		///////////////////////////////거래 추가///////////////////////////////////
		transactionDao.addTransaction(transaction);
		
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

	@Override
	public void updateTransactionCode(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		transactionDao.updateTransactionCode(transaction);
	}

	@Override
	public void addRefund(Refund refund) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("service refund :: "+refund);
		Transaction transaction =transactionDao.getTransaction(refund.getTranNo());
		transaction.setRefundCode("2");
		transactionDao.updateTransactionCode(transaction);
		transactionDao.addRefund(refund);
	}

	@Override
	public void updateRefund(Refund refund) throws Exception {
		System.out.println("serviceimpl refund :: "+refund);
		Transaction transaction =transactionDao.getTransaction(refund.getTranNo());
		transaction.setRefundCode("3");
		System.out.println("transaction :: "+transaction);
		transactionDao.updateTransactionCode(transaction);
		transactionDao.updateRefund(refund);
	}

	@Override//session userNo userType, search
	public Map<String, Object> listRefund(Search search) throws Exception {
		// TODO Auto-generated method stub
		
		int totalCountRefund = transactionDao.getTotalCountRefund(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("totalCountRefund", totalCountRefund);
		map.put("list", transactionDao.listRefund(search));
		
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

	@Override
	public Refund getRefund(int userNo) throws Exception {
		return transactionDao.getRefund(userNo);
	}

	@Override
	public void deleteTransaction(int tranNo) throws Exception {
		transactionDao.deleteTransaction(tranNo);
		
	}

	@Override
	public void updateTransactionEval(Transaction transaction) throws Exception {
		transactionDao.updateTransactionEval(transaction);
		
	}

	@Override
	public int getTransactionCount(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		return transactionDao.getTransactionCount(transaction);
	}
	


}
