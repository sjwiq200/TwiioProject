package com.twiio.good.service.transaction.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Refund;
import com.twiio.good.service.domain.Transaction;
import com.twiio.good.service.transaction.TransactionDao;

@Repository("transactionDaoImpl")
public class TransactionDaoImpl implements TransactionDao {

	// Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlsession;

	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	public TransactionDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public void addTransaction(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert("TransactionMapper.addTransaction", transaction);
	}

	@Override
	public Transaction getTransaction(int tranNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("TransactionMapper.getTransaction", tranNo);
	}

	@Override//Search search, int buyerNo
	public List<Transaction> listTransaction(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList("TransactionMapper.listTransaction", map);
	}

	@Override
	public void updateTransactionCode(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update("TransactionMapper.updateTransactionCode", transaction);
	}

	@Override
	public int getTotalCount(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("TransactionMapper.getTotalCount", map);
	}

	@Override
	public void addRefund(Refund refund) throws Exception {
		// TODO Auto-generated method stub
		Transaction transaction = new Transaction();
		transaction.setRefundCode("2");
		transaction.setTranNo(refund.getTranNo());
		
		sqlsession.update("TransactionMapper.updateTransactionCode",transaction);
		sqlsession.insert("TransactionMapper.addRefund", refund);
	}

	@Override
	public void updateRefund(Refund refund) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update("TransactionMapper.updateRefund", refund);
	}

	@Override
	public List<Refund> listRefund(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList("TransactionMapper.listRefund", map);
	}

	@Override
	public void deleteRefund(int refundNo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.delete("TransactionMapper.deleteRefund", refundNo);
	}

	@Override
	public void addStarEvalProduct(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert("TransactionMapper.addStarEvalProduct", transaction);
	}

	@Override
	public List<Transaction> listStarEval(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList("TransactionMapper.listStarEval", map);
	}

	@Override
	public Transaction getEval(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("TransactionMapper.getEval", map);
	}

	@Override
	public List<Transaction> listBest(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList("TransactionMapper.listBest", map);
	}

	@Override
	public void addStarEvalHost(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert("TransactionMapper.listBest", transaction);
	}

	@Override
	public Refund getRefund(int userNo) throws Exception {
		// TODO Auto-generated method stub
			   
		return sqlsession.selectOne("TransactionMapper.getRefund", userNo);
	}

	@Override
	public void deleteTransaction(int tranNo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.delete("TransactionMapper.deleteTransaction",tranNo);
	}

	@Override
	public void updateTransactionEval(Transaction transaction) throws Exception {
		System.out.println("transactionEval GOGO");
		sqlsession.update("TransactionMapper.updateTransactionEval",transaction);	
	}

	@Override
	public int getTransactionCount(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("TransactionMapper.getTransactionCount",transaction);	
	}
}
