package com.twiio.good.service.transaction;

import java.util.List;
import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Refund;
import com.twiio.good.service.domain.Transaction;
import com.twiio.good.service.domain.User;



public interface TransactionService {
	
	// īī������ �ŷ�
	public void kakaoPayReady(Transaction transaction) throws Exception;

	// īī������ �ŷ�
	public void kakaoApproval(Transaction transaction) throws Exception;

	// īī������ �ŷ�
	public void kakaoCancel(Transaction transaction) throws Exception;

	// īī������ �ŷ�
	public void kakaoFail(Transaction transaction) throws Exception;

	// īī������ �ŷ�
	public void kakaoOrder(Transaction transaction) throws Exception;

	// ������ �ŷ�
	public void payPal(Transaction transaction) throws Exception;
	
	// �ŷ� ����	
	public Transaction getTransaction(int tranNo) throws Exception;
	
	//public Purchase getPurchase2(int ProdNo) throws Exception;
	
	// �ŷ� ����Ʈ
	public Map<String,Object> listTransaction(Search search,User user) throws Exception;
	
	// ȣ��Ʈ �Ǹ� ����Ʈ
	//public Map<String,Object> listTransactionHost(Search search,int hostNo) throws Exception;
	
	// ȯ�� �ڵ� ����
	public void updateTransactionCode(Transaction transaction) throws Exception;
	
	// ȯ�� ��û
	public void addRefund(Refund refund) throws Exception;
	
	// ȯ�� �Ϸ� confirmDate 
	public void updateRefund(Refund refund) throws Exception;

	// ȯ�� ����Ʈ
	public Map<String, Object> listRefund(Search search, User user) throws Exception;

	// ȯ�� ���
	public void deleteRefund(int tranNo) throws Exception;

	// ��ǰ ���� �� �ϱ�
	public void addStarEvalProduct(Transaction transaction) throws Exception;

	// ��ǰ ���� �� ����Ʈ
	public Map<String, Object> listStarEvalProduct(Search search, int productNo) throws Exception;

	// ��ǰ ���� ����
	public Transaction getEvalProduct(int productNo) throws Exception;

	// ����Ʈ ��ǰ ����Ʈ
	public List<Transaction> listBestProduct(Search search) throws Exception;
	

}
