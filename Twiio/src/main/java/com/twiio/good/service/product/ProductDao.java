package com.twiio.good.service.product;

import java.util.List;
import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Product;

public interface ProductDao {

	// INSERT
	public void addProduct(Product product) throws Exception;

	// SELECT ONE
	public Product getProduct(int productNo) throws Exception;

	// SELECT LIST
	public List<Product> listProduct(Map<String, Object> map) throws Exception;

	// UPDATE
	public void updateProduct(Product product) throws Exception;
	
	// UPDATE
	public void updateViewCount(int productNo) throws Exception;

	// 게시판 Page 처리를 위한 전체Row(totalCount) return
	public int getTotalCount(Map<String, Object> map) throws Exception;

	// DELETE
	public void deleteProduct(int productNo) throws Exception;
	
}
