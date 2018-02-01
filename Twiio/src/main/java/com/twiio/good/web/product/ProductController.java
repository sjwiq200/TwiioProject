package com.twiio.good.web.product;

import java.io.File;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.twiio.good.common.Page;
import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Product;
import com.twiio.good.service.domain.Transaction;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.product.ProductService;
import com.twiio.good.service.transaction.TransactionService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Value("#{commonProperties['productFilePath']}")
	String productFilePath;
//	@Autowired
//	@Qualifier("transactionServiceImpl")
//	private TransactionService transactionService;
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	public ProductController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="addProduct", method=RequestMethod.GET)
	public String addProduct() throws Exception {

		System.out.println("/product/addProduct : GET");
		
		return "redirect:/product/addProductView.jsp";
	}
	
	@RequestMapping(value="addProduct", method=RequestMethod.POST)//썸네일
	public String addProduct(@ModelAttribute("product") Product product, HttpSession session, Map<String, Object> map) throws Exception {

		System.out.println("/product/addProduct : POST");
		//System.out.println("date :: "+product.getTripDate());
		String[] str = product.getTripDate().split(",");
		//System.out.println("length :: "+str.length);
		product.setProductCount(product.getTourHeadCount()*str.length);
		String tripDate="";
		for(int i=0; i<str.length; i++) {
//			String[] date = str[i].split("-");
//			if(i != str.length-1) {
//				tripDate += date[0].substring(2)+"/"+date[1]+"/"+date[2]+"="+product.getTourHeadCount()+",";
//			}else {
//				tripDate += date[0].substring(2)+"/"+date[1]+"/"+date[2]+"="+product.getTourHeadCount();
//			}
			if(i != str.length-1) {
				tripDate += str[i]+"="+product.getTourHeadCount()+",";
			}else {
				tripDate += str[i]+"="+product.getTourHeadCount();
			}	
		}
		product.setTripDate(tripDate);
		User user = (User)session.getAttribute("user");
		product.setHostNo(user.getUserNo());
		System.out.println("섬네일등록전");
		//////////////////////////썸네일 등록/////////////////////////////
		if(!product.getFile().isEmpty()) {			
			String thumbnail = user.getUserNo()+"="+product.getFile().getOriginalFilename();
			File file = new File(productFilePath, thumbnail);
			product.getFile().transferTo(file);
			
			product.setThumbnail(thumbnail);
			System.out.println(product);
			productService.addProduct(product);
		}else {
			System.out.println(product);
			productService.addProduct(product);
		}
		
		
		return "forward:/product/addProduct.jsp";
	}
	
	@RequestMapping(value="getProduct", method=RequestMethod.GET)
	public String getProduct( @RequestParam("productNo") int productNo, @ModelAttribute("search") Search search, Map<String, Object> map) throws Exception {
		
		System.out.println("/product/getProduct : GET");
		Product product = productService.getProduct(productNo);
		Transaction transaction = productService.getEvalProduct(productNo);
		
		//Search search = new Search();
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}		
		search.setPageSize(5);
		Map<String, Object> starMap = productService.listStarEvalProduct(search, productNo);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)starMap.get("totalCount")).intValue(), pageUnit, search.getPageSize());
		
		map.put("list", (List<Transaction>)starMap.get("list"));
		map.put("totalCount", starMap.get("totalCount"));
		map.put("resultPage", resultPage);
		map.put("product", product);
		map.put("transaction", transaction);
		
		return "forward:/product/getProduct.jsp";
	}
	
	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
	public String updateProduct( @RequestParam("productNo") int productNo, Map<String, Object> map) throws Exception {
		
		System.out.println("/product/updateProduct : GET");
		
		Product product = productService.getProduct(productNo);
		
		map.put("product", product);
		
		return "forward:/product/listProduct.jsp";
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
				
		Map<String, Object> productMap = productService.listProduct(search);
		//Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, search.getPageSize());
		//map.put("list", productMap.get("list"));
		
		//List<Product> list = (List<Product>)map.get("list");
		System.out.println("map :: "+map);
		map.put("list", (List<Product>)productMap.get("list"));
		map.put("totalCount", ((Integer)productMap.get("totalCount")).intValue());
		//map.put("resultPage", resultPage);
		map.put("search", search);
		
		return "forward:/product/listProduct.jsp";
	}
	
	@RequestMapping(value="addStarEvalProduct", method=RequestMethod.POST)
	public String addStarEvalProduct( @ModelAttribute("transaction") Transaction transaction, Map<String, Object> map) throws Exception {
		
		System.out.println("/product/addStarEvalProduct : POST ");
		
		productService.addStarEvalProduct(transaction);
		
		return "forward:/product/readProduct.jsp";
	}
	
	@RequestMapping(value="listStarEvalProduct")
	public String listStarEvalProduct( @ModelAttribute("search") Search search, @RequestParam int productNo, Map<String, Object> map) throws Exception {
		
		System.out.println("/product/listStarEvalProduct ");
		
		map = productService.listStarEvalProduct(search, productNo);
		
		return "forward:/product/readProduct.jsp";
	}
	
	@RequestMapping(value="getEvalProduct")
	public String getEvalProduct( @RequestParam int productNo, Map<String, Object> map) throws Exception {
		
		System.out.println("/product/getEvalProduct ");
		
		Transaction transaction = productService.getEvalProduct(productNo);
		double productEval = transaction.getEvalProduct();
		
		map.put("productEval", productEval);
		
		return "forward:/product/readProduct.jsp";
	}
	
	@RequestMapping(value="listBestProduct")//사진 이름 평점 보여주기
	public String listBestProduct( @ModelAttribute("search") Search search, Map<String, Object> map) throws Exception {
		
		System.out.println("/product/listBestProduct ");
		
		search.setCurrentPage(1);
		search.setPageSize(10);//10등까지
		
		//List<Transaction> list = productService.listBestProduct(search);				
		
		map.put("list", (List<Transaction>)productService.listBestProduct(search));
		
		return "forward:/product/best10.jsp";
	}

}
