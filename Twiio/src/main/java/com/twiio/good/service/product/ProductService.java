package com.twiio.good.service.product;

import java.util.List;
import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Product;
import com.twiio.good.service.domain.Transaction;


public interface ProductService {
	
	// 상품 등록
	public void addProduct(Product product) throws Exception;

	// 상품 정보
	public Product getProduct(int productNo) throws Exception;

	// 상품 리스트
	public Map<String,Object> listProduct(Search search) throws Exception;

	// 상품 정보 수정	
	public void updateProduct(Product product) throws Exception;
	
	// 상품 조회수 증가
	//public void updateViewCount(int productNo) throws Exception;
	
	// 상품 삭제
	public void deleteProduct(int productNo) throws Exception;
	
	// 상품 별점 평가 하기
	public void addStarEvalProduct(Transaction transaction) throws Exception;
	
	// 상품 별점 평가 리스트
	public Map<String,Object> listStarEvalProduct(Search search, int productNo) throws Exception;
	
	// 상품 평점 보기
	public Transaction getEvalProduct(int productNo) throws Exception;
	
	// 베스트 상품 리스트
	public List<Transaction> listBestProduct(Search search) throws Exception;
	
}
