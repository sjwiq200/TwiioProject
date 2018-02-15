package com.twiio.good.service.transaction;

import java.util.List;
import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Refund;
import com.twiio.good.service.domain.Transaction;
import com.twiio.good.service.domain.User;



public interface TransactionService {
	
	//거래
	public void addTransaction(Transaction transaction) throws Exception;
	
	// 거래 정보	
	public Transaction getTransaction(int tranNo) throws Exception;
	
	//public Purchase getPurchase2(int ProdNo) throws Exception;
	
	// 거래 리스트
	public Map<String,Object> listTransaction(Search search,User user) throws Exception;
	
	// 호스트 판매 리스트
	//public Map<String,Object> listTransactionHost(Search search,int hostNo) throws Exception;
	
//	// 환불 코드 변경
//	public void updateTransactionCode(Transaction transaction) throws Exception;
	
	public Refund getRefund(int userNo) throws Exception;
	// 환불 신청
	public void addRefund(Refund refund) throws Exception;
	
	// 환불 완료 confirmDate 
	public void updateRefund(Refund refund) throws Exception;

	// 환불 리스트
	public Map<String, Object> listRefund(Search search, User user) throws Exception;

	// 환불 취소
	public void deleteRefund(int tranNo) throws Exception;
	
	public void deleteTransaction(int tranNo) throws Exception;
	
	public void updateTransactionEval(Transaction transaction) throws Exception;
	
	public int getTransactionCount(Transaction transaction) throws Exception;

}
