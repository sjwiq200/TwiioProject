package com.twiio.good.service.product;

import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Product;


public interface ProductService {
	
	// ��ǰ ���
	public void addProduct(Product product) throws Exception;

	// ��ǰ ����
	public Product getProduct(int prodNo) throws Exception;

	// ��ǰ ����Ʈ
	public Map<String,Object> listProduct(Search search) throws Exception;

	// ��ǰ ���� ����	
	public void updateProduct(Product product) throws Exception;
	
	// ��ǰ ����
	public void deleteProduct(int productNo) throws Exception;
	
//	// ��ǰ ���� �� �ϱ�
//	public void addStarEvalProduct(Product product) throws Exception;
//	
//	// ��ǰ ���� �� ����
//	public void getStarEvalProduct(Product product) throws Exception;
//	
//	// ��ǰ ���� ����
//	public void getEvalProduct(Product product) throws Exception;
//	
//	// ����Ʈ ��ǰ ����Ʈ
//	public void listBestProduct(Product product) throws Exception;
	
}
