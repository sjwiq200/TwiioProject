package com.model2.mvc.service.transaction.test;

import java.sql.Date;
import java.text.SimpleDateFormat;
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
import com.twiio.good.service.domain.Refund;
import com.twiio.good.service.domain.Transaction;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.product.ProductService;
import com.twiio.good.service.transaction.TransactionDao;
import com.twiio.good.service.transaction.TransactionService;
import com.twiio.good.service.user.UserService;


/*
 *	FileName :  UserServiceTest.java
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml" ,
																		"classpath:config/context-aspect.xml",
																		"classpath:config/context-mybatis.xml",
																		"classpath:config/context-transaction.xml" })
public class PurchaseServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("transactionServiceImpl")
	private TransactionService transactionService;
	
	@Autowired
	@Qualifier("transactionDaoImpl")
	private TransactionDao transactionDao;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	//@Test
	public void testAddTransaction() throws Exception {
		
		Transaction transaction = new Transaction();
		
		transaction.setTranPro(productService.getProduct(23));        
		transaction.setTripDate(new Date(2018-3-1));
		transaction.setPaymentType("1");
		transaction.setCount(1);
		transaction.setBuyerNo(12);
		transaction.setTotalPrice(50000);
		transaction.setPayToHostDate(new Date(2018-3-8));
		
		transactionDao.addTransaction(transaction);
		//==> console Ȯ��
		System.out.println(transaction);
		
		//==> API Ȯ��
//		Assert.assertEquals("�ָ�", purchase.getReceiverName());
//		Assert.assertEquals("user01", purchase.getBuyer().getUserId());
		
	}
	
	//@Test
	public void testGetPurchase() throws Exception {
		
		Transaction transaction = new Transaction();
				
		transaction = transactionService.getTransaction(21);

		//==> console Ȯ��
		System.out.println(transaction);
		
		
		
	}
	
	//@Test
		public void listTransactione() throws Exception {
			
			Search search = new Search();
		 	search.setCurrentPage(1);
		 	search.setPageSize(3);
		 	User user = userService.getUserInNo(5);
		 	Map<String,Object> map = transactionService.listTransaction(search, user);
		 	
		 	List<Object> list = (List<Object>)map.get("list");
		 	System.out.println("user list :: "+list);
		 	
		 	int totalCount = (Integer)map.get("totalCount");
		 	System.out.println("user totalcount :: "+totalCount);
		 	
		 	user = userService.getUserInNo(14);
		 	map = transactionService.listTransaction(search, user);
		 	
		 	list = (List<Object>)map.get("list");
		 	System.out.println("host list :: "+list);
		 	
		 	totalCount = (Integer)map.get("totalCount");
		 	System.out.println("host totalcount :: "+totalCount);
		 	

			//==> console Ȯ��
			//System.out.println(transaction);
			
//			//==> API Ȯ��
//			Assert.assertEquals("�ָ�", purchase.getReceiverName());
//			Assert.assertEquals("user01", purchase.getBuyer().getUserId());
//			Assert.assertEquals("1", purchase.getPaymentOption().trim());
//			Assert.assertEquals("1", purchase.getTranCode().trim());
//			System.out.println(purchase.getPaymentOption());
//			System.out.println(purchase.getPaymentOption().length());
//
//			Assert.assertNotNull(purchaseService.getPurchase2(10043));
//			
//			System.out.println("����");
			
		}
	
	
	//@Test
	 public void testAddRefund() throws Exception{
		 
		Refund refund = new Refund();
		refund.setTranNo(21);
		refund.setRefundPrice(50000);
		refund.setRefundAccount("123-123-123");
		refund.setRefundBank("�츮");
		
		transactionService.addRefund(refund);
//		//==> API Ȯ��
//		Assert.assertEquals("�´�", purchase.getReceiverName());
//		Assert.assertEquals("2", purchase.getPaymentOption().trim());
//		Assert.assertEquals("010-1234-1234", purchase.getReceiverPhone());
//		//Assert.assertEquals("2017-11-16", purchase.getDivyDate());
//		
//		System.out.println("����");
		
		
	 }
	 
	// @Test
	public void testUpdateRefund() throws Exception {

		Refund refund = new Refund();
		refund.setRefundNo(3);
		refund.setConfirmDate(new Date(2018-02-01));
		
		transactionService.updateRefund(refund);
		// //==> API Ȯ��
		// Assert.assertEquals("�´�", purchase.getReceiverName());
		// Assert.assertEquals("2", purchase.getPaymentOption().trim());
		// Assert.assertEquals("010-1234-1234", purchase.getReceiverPhone());
		// //Assert.assertEquals("2017-11-16", purchase.getDivyDate());
		//
		// System.out.println("����");

	}

	 //==>  �ּ��� Ǯ�� �����ϸ�....
	//@Test
	 public void testListRefund() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	User user = userService.getUserInNo(5);
	 	Map<String,Object> map = transactionService.listRefund(search, user);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	//Assert.assertEquals(3, list.size());
	 	
		//==> console Ȯ��
	 	System.out.println(list);
//	 	for (int i =0 ;  i < list.size() ; i++) {
//			System.out.println( "<"+ ( i +1 )+"> ��° ����.."+ list.get(i).toString() );
//		}
//		System.out.println("\n");
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	user = userService.getUserInNo(14);
	 	map = transactionService.listRefund(search, user);
	 		 	
	 	System.out.println(map);
	 	list = (List<Object>)map.get("list");
	 	//Assert.assertEquals(2, list.size());
	 	
	 	//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	 
	// @Test
	 public void testdeleteRefund() throws Exception{
		
		 transactionService.deleteRefund(3);
		
		//==> console Ȯ��
		//System.out.println(purchase);
			
//		//==> API Ȯ��
//		Assert.assertEquals("�´�", purchase.getReceiverName());
//		Assert.assertEquals("1", purchase.getTranCode().trim());
				
		System.out.println("����");
		
	 	
	 }	 
		 
}