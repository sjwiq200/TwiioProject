package com.twiio.good.service.transaction;

import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Refund;
import com.twiio.good.service.domain.Transaction;

public interface TransactionDao {

	// ��ǰ �ŷ�
	public void addTransaction(Transaction transaction) throws Exception;

	// �ŷ� ����
	public Transaction getTransaction(int tranNo) throws Exception;

	// public Purchase getPurchase2(int ProdNo) throws Exception;

	// �ŷ� ����Ʈ
	public Map<String, Object> listTransaction(Search search, int userNo) throws Exception;

	// ȯ�� �ڵ� ����
	public void updateTransactionCode(int tranNo) throws Exception;

	// ȯ�� ��û
	public void addRefund(Refund refund) throws Exception;

	// ȯ�� �Ϸ� confirmDate
	public void updateRefund(Refund refund) throws Exception;

	// ȯ�� ���
	public void deleteRefund(int tranNo) throws Exception;
}
