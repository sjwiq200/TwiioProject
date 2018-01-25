package com.twiio.good.service.transaction;

import java.util.List;
import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Refund;
import com.twiio.good.service.domain.Transaction;

public interface TransactionDao {

	// INSERT
	public void addTransaction(Transaction transaction) throws Exception;

	// SELECT ONE
	public Transaction getTransaction(int tranNo) throws Exception;

	// public Purchase getPurchase2(int ProdNo) throws Exception;

	// SELECT LIST
	public List<Transaction> listTransaction(Map<String, Object> map) throws Exception;
	
	// SELECT LIST
	//public Map<String, Object> listTransactionHost(Search search, int hostNo) throws Exception;

	// UPDATE
	public void updateTransactionCode(Transaction transaction) throws Exception;
	
	// 게시판 Page 처리를 위한 전체Row(totalCount) return
	public int getTotalCount(Map<String, Object> map) throws Exception;

	// INSERT
	public void addRefund(Refund refund) throws Exception;

	// UPDATE
	public void updateRefund(Refund refund) throws Exception;
	
	// SELECT LIST
	public List<Refund> listRefund(Map<String, Object> map) throws Exception;

	// DELETE
	public void deleteRefund(int refundNo) throws Exception;

	// UPDATE
	public void addStarEvalProduct(Transaction transaction) throws Exception;

	// SELECT LIST
	//public Map<String,Object> listStarEvalProduct(Search search, int productNo) throws Exception;
	
	// SELECT LIST  Search search, int productNo, String evalType
	public List<Transaction> listStarEval(Map<String,Object> map) throws Exception;

	// SELECT ONE 상품서비스
	//public void getEvalProduct(int productNo) throws Exception;
	
	// SELECT ONE 평점서비스  int productNo, String evalType
	public Transaction getEval(Map<String,Object> map) throws Exception;

	// SELECT LIST search
	public List<Transaction> listBest(Map<String,Object> map) throws Exception;

	// UPDATE
	public void addStarEvalHost(Transaction transaction) throws Exception;

	// SELECT LIST
	//public Map<String, Object> listStarEvalHost(Search search, int productNo) throws Exception;

	// SELECT ONE 회원관리 서비스
	//public void getEvalHost(int productNo) throws Exception;

	// SELECT LIST
	//public List<Transaction> listBestHost(Search search) throws Exception;
	
}
