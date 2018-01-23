package com.twiio.good.web.information;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.twiio.good.service.domain.Currency;
import com.twiio.good.service.information.InformationService;

@Controller
@RequestMapping("/information/*")
public class InformationController {
	
	@Autowired
	@Qualifier("informationServiceImpl")
	private InformationService informationService;
	

	public InformationController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="getCurrency" )
	public String getCurrency(Model model) throws Exception{
		
		System.out.println("/information/getCurrency");
	
		List<Currency> returnList= new ArrayList<Currency>();
		returnList = informationService.getCurrency();
	        
	        model.addAttribute("returnList", returnList);
	        System.out.println(returnList);
	        return "forward:/information/currency.jsp";
	}

}
