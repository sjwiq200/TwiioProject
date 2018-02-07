package com.model2.mvc.service.product.test;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Product;
import com.twiio.good.service.domain.Transaction;
import com.twiio.good.service.product.ProductService;
import com.twiio.good.service.transaction.TransactionService;
import com.twiio.good.service.user.UserService;




/*
 *	FileName :  UserServiceTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml" ,
																		"classpath:config/context-aspect.xml",
																		"classpath:config/context-mybatis.xml",
																		"classpath:config/context-transaction.xml" })
public class ProductServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("transactionServiceImpl")
	private TransactionService transactionService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	//@Test
	public void testAddProduct() throws Exception {
		//Date date =new Date(2018-02-01);
		
		Product product = new Product();
		product.setProductName("침사추이 맛집투어");
		product.setProductPrice(50000);
		product.setProductType("1");
		product.setTripDate("18/03/01");
		product.setCountry("홍콩");
		product.setCity("침사추이");
		product.setHostNo(14);
		product.setTourHeadCount(5);
		product.setProductCount(5);
				
		productService.addProduct(product);
		
		//product = productService.getProduct(10067);
		
		//==> console 확인
		//System.out.println(product);
		
		//==> API 확인
		//Assert.assertEquals("testpro", product.getProdName());
		
	}
	
	//@Test
	public void testGetProduct() throws Exception {
		
		Product product = productService.getProduct(21);
		//==> 필요하다면...
//		user.setUserId("testUserId");
//		user.setUserName("testUserName");
//		user.setPassword("testPasswd");
//		user.setSsn("1111112222222");
//		user.setPhone("111-2222-3333");
//		user.setAddr("경기도");
//		user.setEmail("test@test.com");
		
		//product = productService.getProduct(10067);

		//==> console 확인
		System.out.println(product);
		
		//==> API 확인
//		Assert.assertEquals("testpro", product.getProdName());
//
//		Assert.assertNotNull(productService.getProduct(10067));
		
	}
	
	//@Test
	 public void testUpdateProduct() throws Exception{
		 
		Product product = productService.getProduct(21);
//		Assert.assertNotNull(product);
//		
//		Assert.assertEquals("testpro", product.getProdName());

		product.setProductPrice(20000);
		
		
		productService.updateProduct(product);
		
//		product = productService.getProduct(10067);
//		Assert.assertNotNull(product);
//		
//		//==> console 확인
//		System.out.println(product);
//			
//		//==> API 확인
//		Assert.assertEquals("testchange", product.getProdName());
		
	 }

	 //==>  주석을 풀고 실행하면....
	@Test
	 public void testListProduct() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("THAILAND");
	 	search.setPriceCondition("");
	 	search.setProdSearchType("");
	 	Map<String,Object> map = productService.listProduct(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	System.out.println("list :: "+list);
	 	//Search [currentPage=1, searchCondition=0, searchKeyword=THAILAND, 
	 	//pageSize=12, endRowNum=0, startRowNum=0, priceCondition=, prodSearchType=, productNo=0]}
	 	int totalCount = (Integer)map.get("totalCount");
	 	System.out.println("totalCount :: "+totalCount);
//	 	Assert.assertEquals(3, list.size());
//	 	
//		//==> console 확인
//	 	System.out.println(list);
//	 	
//	 	Integer totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 	
//	 	System.out.println("=======================================");
//	 	
//	 	search.setCurrentPage(1);
//	 	search.setPageSize(3);
//	 	search.setSearchCondition("2");
//	 	//search.setSearchCondition("0");
//	 	//search.setSearchKeyword("10014");
//	 	search.setSearchKeyword("2000~3000");
//	 	map = productService.getProductList(search);
//	 	
//	 	
//	 	System.out.println(map);
//	 	list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(3, list.size());
//	 	
//	 	//==> console 확인
//	 	System.out.println(list);
//	 	
//	 	totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 	
	 }
	 
	// @Test
	 public void testDeleteProduct() throws Exception{
		 
	 	productService.deleteProduct(21);
	 	
	 }
	 
	 //@Test
	 public void testAddStarEvalProduct() throws Exception{
		 	
		 	Transaction transaction = transactionService.getTransaction(25);
		 	transaction.setStarEvalProduct(5);
		 	productService.addStarEvalProduct(transaction);
		 	
		 }

	 //@Test
	public void testGetEvalProduct() throws Exception {

		
		Transaction transaction = productService.getEvalProduct(23);
		double productEval = transaction.getEvalProduct();
		System.out.println(productEval);

	}
	 
	//@Test
	public void testlistBestProduct() throws Exception {
		
		Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(10);
		List<Transaction> list = productService.listBestProduct(search);
		
		System.out.println(list);

	}
	 
	 //@Test
	 public void testListStarEvalProduct() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	
	 	//search.setSearchCondition("1");
	 	//search.setSearchKeyword("의자");
	 	Map<String, Object> map = productService.listStarEvalProduct(search, 23);
	 	
	 	
	 	//double productEval = transaction.getEvalProduct();
	 	System.out.println(map);
	 	
//	 	List<Object> list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(3, list.size());
//	 	
//		//==> console 확인
//	 	System.out.println(list);
//	 	
//	 	Integer totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 	
//	 	System.out.println("=======================================");
//	 	
//	 	search.setSearchCondition("1");
//	 	search.setSearchKeyword("");
//	 	map = productService.getProductList(search);
//	 		 	
//	 	list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(3, list.size());
//	 	
//		//==> console 확인
//	 	System.out.println(list);
//	 	
//	 	totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
	 }	 
}