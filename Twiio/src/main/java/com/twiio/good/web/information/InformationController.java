package com.twiio.good.web.information;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.twiio.good.service.domain.Currency;
import com.twiio.good.service.domain.Flight;
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
		returnList = informationService.addCurrency();
	        
	        model.addAttribute("returnList", returnList);
	        System.out.println(returnList);
	        return "forward:/information/currency.jsp";
	}
	
	@RequestMapping( value="searchNowWeather" )
	public String searchNowWeather(Model model) throws Exception{
		
		System.out.println("/information/getWeather");
		
		Map<String,Object> map = informationService.searchNowWeather("Seoul");
		Map<String,Object> result = new HashMap<String,Object>();
		
		String str = (String) map.get("weather");
		String[] context =   str.split(",");
		String[] temp  = context[0].split("=");
		String[] pressure = context[1].split("=");
		String[] humidity = context[2].split("=");
		String[] temp_min = context[3].split("=");
		String[] temp_max = context[4].split("=");
		

		if(context.length>6) {
			String[] grnd_level = context[5].split("=");
			String[] sea_level = context[6].split("=");
			
			result.put("grnd_level", grnd_level[1]);
			result.put("sea_level", sea_level[1]);
		
		}
		
		Double temp1 =Double.parseDouble(temp[1]);
		Double pressure1 = Double.parseDouble( pressure[1]);
		Double humidity1 = Double.parseDouble( humidity[1]);
		Double temp_min1 = Double.parseDouble( temp_min[1]);
		Double temp_max1 = Double.parseDouble(temp_max[1]);
		
		result.put("temp", Math.round(temp1-273));
		result.put("pressure", pressure1);
		result.put("humidity", humidity1);
		result.put("temp_min", Math.round(temp_min1-273));
		result.put("temp_max",  Math.round(temp_max1-273));
		
		model.addAttribute("result",result);
	
	        return "forward:/information/searchNowWeather.jsp";
	}
	
	@RequestMapping( value="searchHistoryWeather" )
	public String searchHistoryWeather(Model model, @RequestParam("cityName") String cityName) throws Exception{
		
		System.out.println("/information/searchHistoryWeather");
		
		Map<Object,String[]> map = informationService.searchHistoryWeather(cityName);
		
		List<String> list = new ArrayList<String>();
		
		String[] simple = map.get("quickInfo");
		for(int i = 0; i<simple.length; i++) {
			list.add(simple[i]);
		}
		
		String[] past = map.get("historyWeather");
		
		List<String> month =  new ArrayList<String>();
		for(int i = 0; i<past.length;i++) {
			month.add(past[i]);
			i = i+3;
		}
		List<String> min =  new ArrayList<String>();
		for(int i = 1; i<past.length;i++) {
			min.add(past[i]);
			i = i+3;
		}
		List<String> max =  new ArrayList<String>();
		for(int i = 2; i<past.length;i++) {
			max.add(past[i]);
			i = i+3;
		}
		List<String> rain =  new ArrayList<String>();
		for(int i = 3; i<past.length;i++) {
			rain.add(past[i]);
			i = i+3;
		}
		
			
			model.addAttribute("list",list ).addAttribute("month",month).addAttribute("min",min).addAttribute("max",max).addAttribute("rain",rain);
		
	        return "forward:/information/searchHistoryWeather.jsp";
	}
	
	@RequestMapping( value="getFlight" )
	public String getFlight() throws Exception{
		
		System.out.println("/information/getFlight");
		
	        return  "forward:/information/flight.jsp";
	}
	
	
	@RequestMapping( value="getFlightList" )
	public String getFlightList(@ModelAttribute Flight flight, Model model) throws Exception{
		
		System.out.println("/information/getFlightList");
		System.out.println(flight);
		
		Map<String, List<String>> result  = informationService.getFlightList(flight);
		List<String> url = result.get("url");
		String currentUrl  = url.get(0);
		List<String> list = result.get("list");
		
		for(int i = 0; i<list.size(); i++) {
			System.out.println("**"+list.get(i));
			}
		
			List<String> info = new ArrayList<>();
			for(int i = 0; i<list.size()-3; i++) {
				info.add((list.get(i))+(list.get(i+1))+(list.get(i+2))+(list.get(i+3)));
				i=i+6;
			}
			
			List<String> price = new ArrayList<>();
			for(int i = 5; i<list.size(); i++) {
				price.add(list.get(i));
				i=i+6;
			}
			
			List<String> type = new ArrayList<>();
			for(int i = 6; i<list.size(); i++) {
				type.add(list.get(i));
				i=i+6;
			}
			
			model.addAttribute("info",info ).addAttribute("price",price).addAttribute("type",type).addAttribute("currentUrl",currentUrl);
		
	        return "forward:/information/flightList.jsp";
	}
	
	@RequestMapping( value="getHotel" )
	public String getHotel() throws Exception{
		
		System.out.println("/information/getHotel");
		
	        return  "forward:/information/hotel.jsp";
	}
	
	

}
