package com.twiio.good.service.transaction;

import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Refund;
import com.twiio.good.service.domain.Transaction;

public interface TransactionDao {

	// 상품 거래
	public void addTransaction(Transaction transaction) throws Exception;

	// 거래 정보
	public Transaction getTransaction(int tranNo) throws Exception;

	// public Purchase getPurchase2(int ProdNo) throws Exception;

	// 거래 리스트
	public Map<String, Object> listTransaction(Search search, int userNo) throws Exception;

	// 환불 코드 변경
	public void updateTransactionCode(int tranNo) throws Exception;

	// 환불 신청
	public void addRefund(Refund refund) throws Exception;

	// 환불 완료 confirmDate
	public void updateRefund(Refund refund) throws Exception;

	// 환불 취소
	public void deleteRefund(int tranNo) throws Exception;
}
