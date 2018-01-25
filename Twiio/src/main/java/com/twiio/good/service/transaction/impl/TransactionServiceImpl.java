package com.twiio.good.service.transaction.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	@Qualifier("TransactionDaoImpl")
	private TransactionDao transactionDao;	
	public void setTransactionDao(TransactionDao transactionDao) {
		this.transactionDao = transactionDao;
	}

	public TransactionServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void kakaoPayReady(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void kakaoApproval(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void kakaoCancel(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void kakaoFail(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void kakaoOrder(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		
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
		user=null;
		map.remove("user");
		map.put("user", user);
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
	}
	
	@Override
	public void addStarEvalProduct(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		transactionDao.addStarEvalProduct(transaction);
	}

	@Override
	public Map<String, Object> listStarEvalProduct(Search search, int productNo) throws Exception {
		// TODO Auto-generated method stub
		String evalType="product";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("productNo", productNo);
		map.put("evalType", evalType);
		List<Transaction> list = transactionDao.listStarEval(map);
		int totalCount = transactionDao.getTotalCount(map);
		
		//map.clear();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public Transaction getEvalProduct(int productNo) throws Exception {
		// TODO Auto-generated method stub
		String evalType="product";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productNo", productNo);
		map.put("evalType", evalType);
		return transactionDao.getEval(map);
	}

	@Override
	public List<Transaction> listBestProduct(Search search) throws Exception {
		// TODO Auto-generated method stub
		String evalType="product";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("Search", search);
		map.put("evalType", evalType);
		
		return transactionDao.listBest(map);
	}

}
