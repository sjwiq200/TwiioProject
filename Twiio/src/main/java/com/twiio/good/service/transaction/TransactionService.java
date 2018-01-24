package com.twiio.good.service.transaction;

import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Refund;
import com.twiio.good.service.domain.Transaction;



public interface TransactionService {
	
	// 카카오페이 거래
	public void kakaoPayReady(Transaction transaction) throws Exception;

	// 카카오페이 거래
	public void kakaoApproval(Transaction transaction) throws Exception;

	// 카카오페이 거래
	public void kakaoCancel(Transaction transaction) throws Exception;

	// 카카오페이 거래
	public void kakaoFail(Transaction transaction) throws Exception;

	// 카카오페이 거래
	public void kakaoOrder(Transaction transaction) throws Exception;

	// 페이팔 거래
	public void payPal(Transaction transaction) throws Exception;
	
	// 거래 정보	
	public Transaction getTransaction(int tranNo) throws Exception;
	
	//public Purchase getPurchase2(int ProdNo) throws Exception;
	
	// 거래 리스트
	public Map<String,Object> listTransaction(Search search,int buyerNo) throws Exception;
	
	// 호스트 판매 리스트
	public Map<String,Object> listTransactionHost(Search search,int hostNo) throws Exception;
	
	// 환불 코드 변경
	public void updateTransactionCode(int tranNo) throws Exception;
	
	// 환불 신청
	public void addRefund(Refund refund) throws Exception;
	
	// 환불 완료 confirmDate 
	public void updateRefund(Refund refund) throws Exception;
	
	// 환불 리스트
	public Map<String, Object> listRefund(Search search) throws Exception;
	
	// 환불 취소
	public void deleteRefund(int tranNo) throws Exception;
	

}
