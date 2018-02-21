package com.twiio.good.web.product;

import java.io.File;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.twiio.good.common.Page;
import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Community;
import com.twiio.good.service.domain.Product;
import com.twiio.good.service.domain.Transaction;
import com.twiio.good.service.product.ProductService;
import com.twiio.good.service.user.UserService;


//==> È¸ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ Controller
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
		
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ï¿½ï¿½ï¿½ï¿½ ï¿½Ò°ï¿½
	//==> ï¿½Æ·ï¿½ï¿½ï¿½ ï¿½Î°ï¿½ï¿½ï¿½ ï¿½Ö¼ï¿½ï¿½ï¿½ Ç®ï¿½ï¿½ ï¿½Ç¹Ì¸ï¿½ È®ï¿½ï¿½ ï¿½Ò°ï¿½
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@Value("#{commonProperties['productContentImagesPath']}")
	String productContentImagesPath;
	
	
	@RequestMapping(value="json/uploadProContentImages")
	public JSONObject uploadProContentImages(Product product) {
		//String rootPath = request.getSession().getServletContext().getRealPath("/");
		System.out.println("rootPath :: "+productContentImagesPath);
	    String uploadPath = productContentImagesPath;
		String fileName =  System.currentTimeMillis()+product.getFile().getOriginalFilename();
		
		System.out.println("µé¾î¿À´Ï");
		try {
			System.out.println("µé¾î¿À´Ï1");
			File file = new File(productContentImagesPath, fileName);
			product.getFile().transferTo(file);
			System.out.println("µé¾î¿À´Ï5");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		uploadPath += fileName;
		JSONObject jobj = new JSONObject();	
		String filePath = "/resources/images/productContentImages/"+fileName;
		jobj.put("url", uploadPath);
		jobj.put("relativeUrl", filePath);
		System.out.println("µé¾î¿À´Ï6");
		try {
		Thread.sleep(3500);
		}catch(InterruptedException e) {
		
		}
		return jobj;
	}
		
	@RequestMapping(value="/json/listStarEvalProduct")
	public Map<String, Object> listStarEvalProduct( @RequestBody String search ) throws Exception {
		
		System.out.println("/product/json/listStarEvalProduct ");
		System.out.println(search);
		Search search2 = new Search();
		String[] str = search.split("[&=]");
		if(Integer.parseInt(str[1])==0) {
			search2.setCurrentPage(1);
		}else {
			search2.setCurrentPage(Integer.parseInt(str[1]));
		}
		search2.setPageSize(5);
		Map<String, Object> starMap = productService.listStarEvalProduct(search2, Integer.parseInt(str[3]));
		Page resultPage = new Page( search2.getCurrentPage(), ((Integer)starMap.get("totalCount")).intValue(), pageUnit, search2.getPageSize());
		starMap.put("resultPage", resultPage);
						
		return starMap;
	}
	
	@RequestMapping(value="/json/getEvalProduct/{productNo}", method=RequestMethod.GET)
	public double getEvalProduct( @PathVariable int productNo) throws Exception {
		
		System.out.println("/product/json/getEvalProduct ");
		System.out.println("productNo :: "+productNo);
		Transaction transaction = productService.getEvalProduct(productNo);
		double productEval = transaction.getEvalProduct();
		System.out.println("productEval :: "+productEval);
				
		return productEval;
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
		
		// Business logic ï¿½ï¿½ï¿½ï¿½
		Map<String , Object> map=userService.listStarEvalHost(search, hostNo);
		
//		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//		System.out.println(resultPage);
//				
//		map.put("resultPage", resultPage);
//		map.put("search", search);
				
		return map;
	}
	
	@RequestMapping( value="json/findCount" )
	public int findCount( @RequestBody String product) throws Exception{
		
		System.out.println("/product/json/findCount : ");
		System.out.println("prodcut :: "+product);
		int productNo =Integer.parseInt(product.split("[=&]")[3]);
		String tripDate = URLDecoder.decode(product.split("[=&]")[1],"UTF-8");
		System.out.println("tripDate :: "+tripDate);
		int num=0;
		// Business logic ï¿½ï¿½ï¿½ï¿½
		Product dbProduct=productService.getProduct(productNo);
		String[] str=dbProduct.getTripDate().split("[,]");
		for(int i=0; i<str.length; i++) {
			if(tripDate.equals(str[i].substring(0, 10))) {
				num= Integer.parseInt(str[i].split("=")[1]);
			}
		}
		return num;
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
		search.setPageSize(10);
		
		// Business logic ï¿½ï¿½ï¿½ï¿½
		Map<String , Object> map=productService.listProduct(search);
		
//		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//		System.out.println(resultPage);
		
		List<Product> list =(List<Product>)map.get("list");
		List<String> list02= new ArrayList<>();
//		String string="";
		for(int i=0; i < list.size(); i++) {
			if(search.getSearchCondition().equals("0")) {
				list02.add(list.get(i).getCountry());
			}else if(search.getSearchCondition().equals("1")) {
				list02.add(list.get(i).getCity());
			}else if(search.getSearchCondition().equals("2")) {
				list02.add(list.get(i).getProductName());
			}else if(search.getSearchCondition().equals("3")) {
				list02.add(list.get(i).getHostName());
			}
			
		}
//		
//		String[] prodNames = string.split(",");
		System.out.println(list02);				
		return list02;
	}	
	
	@RequestMapping(value="/json/listProduct")///ï¿½Ë»ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ß°ï¿½
	public List<Product> listProduct(@RequestBody Search search) throws Exception {
		
		System.out.println("/product/json/listProduct ");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(12);//12ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
				
		Map<String, Object> productMap = productService.listProduct(search);
		//Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, search.getPageSize());
		//map.put("list", productMap.get("list"));
		
		//List<Product> list = (List<Product>)map.get("list");
		System.out.println("map :: "+productMap);
		//map.put("list", (List<Product>)productMap.get("list"));
		//map.put("totalCount", ((Integer)productMap.get("totalCount")).intValue());
		//map.put("resultPage", resultPage);
		//map.put("search", search);
		
		return (List<Product>)productMap.get("list");
	}
	
}