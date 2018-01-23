package com.twiio.good.service.product;

import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Product;


public interface ProductService {
	
	// 상품 등록
	public void addProduct(Product product) throws Exception;

	// 상품 정보
	public Product getProduct(int prodNo) throws Exception;

	// 상품 리스트
	public Map<String,Object> listProduct(Search search) throws Exception;

	// 상품 정보 수정	
	public void updateProduct(Product product) throws Exception;
	
	// 상품 삭제
	public void deleteProduct(int productNo) throws Exception;
	
//	// 상품 별점 평가 하기
//	public void addStarEvalProduct(Product product) throws Exception;
//	
//	// 상품 별점 평가 보기
//	public void getStarEvalProduct(Product product) throws Exception;
//	
//	// 상품 평점 보기
//	public void getEvalProduct(Product product) throws Exception;
//	
//	// 베스트 상품 리스트
//	public void listBestProduct(Product product) throws Exception;
	
}
