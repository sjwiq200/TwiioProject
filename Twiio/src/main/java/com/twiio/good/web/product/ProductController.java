package com.twiio.good.web.product;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Product;
import com.twiio.good.service.domain.Transaction;
import com.twiio.good.service.product.ProductService;
import com.twiio.good.service.transaction.TransactionService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("transactionServiceImpl")
	private TransactionService transactionService;

	public ProductController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="addProduct", method=RequestMethod.GET)
	public String addProduct() throws Exception {

		System.out.println("/product/addProduct : GET");
		
		return "redirect:/product/addProductView.jsp";
	}
	
	@RequestMapping(value="addProduct", method=RequestMethod.POST)//썸네일
	public String addProduct(@ModelAttribute("product") Product product, Map<String, Object> map) throws Exception {

		System.out.println("/product/addProduct : POST");
		productService.addProduct(product);
		
		return "forward:/product/addProduct.jsp";
	}
	
	@RequestMapping(value="getProduct", method=RequestMethod.GET)
	public String getProduct( @RequestParam("productNo") int productNo, Map<String, Object> map) throws Exception {
		
		System.out.println("/product/getProduct : GET");
		Product product = productService.getProduct(productNo);
		
		map.put("product", product);
		
		return "forward:/product/readProduct.jsp";
	}
	
	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
	public String updateProduct( @RequestParam("productNo") int productNo, Map<String, Object> map) throws Exception {
		
		System.out.println("/product/updateProduct : GET");
		
		Product product = productService.getProduct(productNo);
		
		map.put("product", product);
		
		return "forward:/product/readProduct.jsp";
	}
	
	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product, Map<String, Object> map) throws Exception {
		
		System.out.println("/product/updateProduct : POST");
		
		productService.updateProduct(product);
		
		return "forward:/product/readProduct.jsp";
	}
	
	@RequestMapping(value="listProduct")///검색조건 추가
	public String listProduct( @ModelAttribute("search") Search search, Map<String, Object> map) throws Exception {
		
		System.out.println("/product/listProduct ");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(20);//20개씩 더보기로
		
		map = productService.listProduct(search);
		
		//List<Product> list = (List<Product>)map.get("list");
		
		//map.put("list", (List<Product>)map.get("list"));
		//map.put("totalCount", ((Integer)map.get("totalCount")).intValue());
		//map.put("search", search);
		
		return "forward:/product/readProduct.jsp";
	}
	
	@RequestMapping(value="addStarEvalProduct", method=RequestMethod.POST)
	public String addStarEvalProduct( @ModelAttribute("transaction") Transaction transaction, Map<String, Object> map) throws Exception {
		
		System.out.println("/product/addStarEvalProduct : POST ");
		
		transactionService.addStarEvalProduct(transaction);
		
		return "forward:/product/readProduct.jsp";
	}
	
	@RequestMapping(value="listStarEvalProduct")
	public String listStarEvalProduct( @ModelAttribute("search") Search search, @RequestParam int productNo, Map<String, Object> map) throws Exception {
		
		System.out.println("/product/listStarEvalProduct ");
		
		map = transactionService.listStarEvalProduct(search, productNo);
		
		return "forward:/product/readProduct.jsp";
	}
	
	@RequestMapping(value="getEvalProduct")
	public String getEvalProduct( @RequestParam int productNo, Map<String, Object> map) throws Exception {
		
		System.out.println("/product/getEvalProduct ");
		
		Transaction transaction = transactionService.getEvalProduct(productNo);
		int productEval = transaction.getEvalProduct();
		
		map.put("productEval", productEval);
		
		return "forward:/product/readProduct.jsp";
	}
	
	@RequestMapping(value="listBestProduct")//사진 이름 평점 보여주기
	public String listBestProduct( @ModelAttribute("search") Search search, Map<String, Object> map) throws Exception {
		
		System.out.println("/product/listBestProduct ");
		
		search.setCurrentPage(1);
		search.setPageSize(10);//10등까지
		
		List<Transaction> list = transactionService.listBestProduct(search);
				
		
		//map.put("list", productService.listBestProduct(search));
		
		return "forward:/product/readProduct.jsp";
	}

}
