package com.twiio.good.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Product;
import com.twiio.good.service.domain.Transaction;
import com.twiio.good.service.product.ProductDao;
import com.twiio.good.service.product.ProductService;
import com.twiio.good.service.transaction.TransactionDao;

@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDao;	
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
//	@Autowired
//	@Qualifier("transactionDaoImpl")
//	private TransactionDao transactionDao;
//	public void setTransactionDao(TransactionDao transactionDao) {
//		this.transactionDao = transactionDao;
//	}

	public ProductServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public void addProduct(Product product) throws Exception {
		// TODO Auto-generated method stub
		productDao.addProduct(product);
	}

	@Override
	public Product getProduct(int productNo) throws Exception {
		// TODO Auto-generated method stub
		productDao.updateViewCount(productNo);//조회수 증가
		return productDao.getProduct(productNo);
	}

	@Override
	public Map<String, Object> listProduct(Search search) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		List<Product> list = productDao.listProduct(map);
		int totalCount = productDao.getTotalCount(map);
		
		//map.clear();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void updateProduct(Product product) throws Exception {
		// TODO Auto-generated method stub
		productDao.updateProduct(product);
	}
	
	@Override
	public void deleteProduct(int productNo) throws Exception {
		// TODO Auto-generated method stub
		productDao.deleteProduct(productNo);
	}	

}
