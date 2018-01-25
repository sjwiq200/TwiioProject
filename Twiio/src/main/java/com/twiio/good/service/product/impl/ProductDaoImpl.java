package com.twiio.good.service.product.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.twiio.good.service.domain.Product;
import com.twiio.good.service.product.ProductDao;

@Repository("productDaoImpl")
public class ProductDaoImpl implements ProductDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public ProductDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public void addProduct(Product product) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("ProductMapper.addProduct", product);
	}

	@Override
	public Product getProduct(int productNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ProductMapper.getProduct", productNo);
	}

	@Override
	public List<Product> listProduct(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ProductMapper.listProduct", map);
	}

	@Override
	public void updateProduct(Product product) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("ProductMapper.updateProduct", product);
	}

	@Override
	public void updateViewCount(int productNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("ProductMapper.updateViewCount", productNo);
	}

	@Override
	public int getTotalCount(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ProductMapper.getTotalCount", map);
	}

	@Override
	public void deleteProduct(int productNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("ProductMapper.deleteProduct", productNo);
	}

	

}
