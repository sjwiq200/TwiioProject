package com.twiio.good.service.product;

import java.util.List;
import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Product;
import com.twiio.good.service.domain.Transaction;


public interface ProductService {
	
	// ��ǰ ���
	public void addProduct(Product product) throws Exception;

	// ��ǰ ����
	public Product getProduct(int productNo) throws Exception;

	// ��ǰ ����Ʈ
	public Map<String,Object> listProduct(Search search) throws Exception;

	// ��ǰ ���� ����	
	public void updateProduct(Product product) throws Exception;
	
	// ��ǰ ��ȸ�� ����
	//public void updateViewCount(int productNo) throws Exception;
	
	// ��ǰ ����
	public void deleteProduct(int productNo) throws Exception;
	
	// ��ǰ ���� �� �ϱ�
	public void addStarEvalProduct(Transaction transaction) throws Exception;
	
	// ��ǰ ���� �� ����Ʈ
	public Map<String,Object> listStarEvalProduct(Search search, int productNo) throws Exception;
	
	// ��ǰ ���� ����
	public Transaction getEvalProduct(int productNo) throws Exception;
	
	// ����Ʈ ��ǰ ����Ʈ
	public List<Transaction> listBestProduct(Search search) throws Exception;
	
}
