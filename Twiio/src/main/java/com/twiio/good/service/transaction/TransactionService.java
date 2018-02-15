package com.twiio.good.service.transaction;

import java.util.List;
import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Refund;
import com.twiio.good.service.domain.Transaction;
import com.twiio.good.service.domain.User;



public interface TransactionService {
	
	//�ŷ�
	public void addTransaction(Transaction transaction) throws Exception;
	
	// �ŷ� ����	
	public Transaction getTransaction(int tranNo) throws Exception;
	
	//public Purchase getPurchase2(int ProdNo) throws Exception;
	
	// �ŷ� ����Ʈ
	public Map<String,Object> listTransaction(Search search,User user) throws Exception;
	
	// ȣ��Ʈ �Ǹ� ����Ʈ
	//public Map<String,Object> listTransactionHost(Search search,int hostNo) throws Exception;
	
//	// ȯ�� �ڵ� ����
//	public void updateTransactionCode(Transaction transaction) throws Exception;
	
	public Refund getRefund(int userNo) throws Exception;
	// ȯ�� ��û
	public void addRefund(Refund refund) throws Exception;
	
	// ȯ�� �Ϸ� confirmDate 
	public void updateRefund(Refund refund) throws Exception;

	// ȯ�� ����Ʈ
	public Map<String, Object> listRefund(Search search, User user) throws Exception;

	// ȯ�� ���
	public void deleteRefund(int tranNo) throws Exception;
	
	public void deleteTransaction(int tranNo) throws Exception;
	
	public void updateTransactionEval(Transaction transaction) throws Exception;
	
	public int getTransactionCount(Transaction transaction) throws Exception;

}
