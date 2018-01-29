package com.twiio.good.web.product;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Product;
import com.twiio.good.service.domain.Transaction;
import com.twiio.good.service.product.ProductService;
import com.twiio.good.service.user.UserService;


//==> 회원관리 Controller
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
		
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
		
		
	@RequestMapping(value="json/listStarEvalProduct")
	public Map<String, Object> listStarEvalProduct( @PathVariable int productNo, @RequestBody Search search ) throws Exception {
		
		System.out.println("/product/json/listStarEvalProduct : ");
		System.out.println("productNo :: "+productNo);
		System.out.println("search :: "+search);
		
		//Business Logic	
		Map<String, Object> map = productService.listStarEvalProduct(search, productNo);
		return map;
	}
	
	@RequestMapping(value="json/getEvalHost/{hostNo}", method=RequestMethod.GET)
	public double getEvalHost( @PathVariable int hostNo ) throws Exception{
		
		System.out.println("/product/json/getEvalHost : GET");
		
		String evalType="host";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productNo", hostNo);
		map.put("evalType", evalType);
		
		Transaction transaction = userService.getEvalHost(hostNo);
		double hostEval = transaction.getEvalHost();
		return hostEval;
	}
		
		
	//@RequestMapping("/listProduct.do")
	@RequestMapping( value="json/listStarEvalHost" )
	public Map<String, Object> listStarEvalHost( @RequestBody Search search, @PathVariable int hostNo) throws Exception{
		
		System.out.println("/product/json/listStarEvalHost : ");
		System.out.println("hostNo :: "+hostNo);
		System.out.println("search :: "+search);
		
		// Business logic 수행
		Map<String , Object> map=userService.listStarEvalHost(search, hostNo);
		
//		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//		System.out.println(resultPage);
//				
//		map.put("resultPage", resultPage);
//		map.put("search", search);
				
		return map;
	}
	
	@RequestMapping( value="/json/autoComplate" )
	public List<String> autoComplate( @RequestBody String autoComplate ) throws Exception{
		
		System.out.println("/product/json/autoComplate : GET / POST");
		System.out.println("autoComplate"+autoComplate);
		
		String[] strings= autoComplate.split("[=&]");
		System.out.println("URL: "+URLDecoder.decode(strings[3], "UTF-8"));
		Search search = new Search();	
		search.setSearchKeyword(URLDecoder.decode(strings[3], "UTF-8"));
		search.setSearchCondition(strings[1]);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=productService.listProduct(search);
		
//		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//		System.out.println(resultPage);
		
		List<Product> list =(List<Product>)map.get("list");
		List<String> list02= new ArrayList<>();
//		String string="";
		for(int i=0; i < list.size(); i++) {
			list02.add(list.get(i).getProductName());
		}
//		
//		String[] prodNames = string.split(",");
		System.out.println(list02);				
		return list02;
	}	
	
}