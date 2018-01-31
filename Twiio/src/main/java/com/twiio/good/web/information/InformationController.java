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
import org.json.simple.JSONObject;
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
import com.twiio.good.service.domain.NightLife;
import com.twiio.good.service.domain.WeatherMain;
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
	        return "forward:/information/getCurrency.jsp";
	}
	
	@RequestMapping( value="searchNowWeather" )
	public String searchNowWeather(Model model) throws Exception{
		
		System.out.println("/information/getWeather");
		
		Map<String,List> map = informationService.searchNowWeather("Seoul");

		List<String>  dateList = map.get("dateList");
		List<WeatherMain> mainList = map.get("mainList");
		
		List<String> resultDate = new ArrayList<>();
		List<Long> resultTemp = new ArrayList<>();

		for(int i =0; i<dateList.size()-1; i++) {
			resultDate.add(dateList.get(i));
			i = i+1;
		}
		System.out.println(resultDate.size());
		
		for(int i =0; i<mainList.size()-1; i++) {
			Double tmp = Double.parseDouble(mainList.get(i).getTemp());
			System.out.println("tmp"+tmp);
			System.out.println("Math.round(tmp-273)"+Math.round(tmp-273));
			resultTemp.add(Math.round(tmp-273));
			i = i+1;
		}
		System.out.println(resultTemp.size());
		
			model.addAttribute("resultDate",resultDate).addAttribute("resultTemp",resultTemp);
//	
	        return "forward:/information/getNowWeather.jsp";
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
	        return "forward:/information/getHistoryWeather.jsp";
	}
	
	@RequestMapping( value="getFlightList" )
	public String getFlightList() throws Exception{
		
		System.out.println("/information/getFlightList");
		
	        return  "forward:/information/listFlight.jsp";
	}
	
	
	@RequestMapping( value="getFlightListReturn" )
	public String getFlightListReturn(@ModelAttribute Flight flight, Model model) throws Exception{
		
		System.out.println("/information/getFlightListReturn");
		
		System.out.println(flight);
		
		Map<String, List<String>> map= informationService.getFlightListRetrun(flight.getReturnUrl(), flight.getClickNum());
		List<String> urlList= map.get("urlReturn");
		List<String> currentUrl  = new ArrayList<String>();
				
		currentUrl.add(urlList.get(0));
		
		List<String> list = map.get("list");
		
			List<String> info = new ArrayList<>();
			List<String> price = new ArrayList<>();
			List<String> type = new ArrayList<>();
			
			for(int i = 0; i<list.size()-6; i++) {
				info.add((list.get(i))+(list.get(i+1))+(list.get(i+2))+(list.get(i+3)));
				
				if(list.get(i+4).matches(	".*[a-zA-Z].*")) {
					
					price.add(list.get(i+5));
					type.add(list.get(i+7));
					i=i+7;
				}else if(list.get(i+4).contains(":")){
					
					System.out.println("걸러지니?"+list.get(i+4));
					
					price.add("상세정보 확인");
					i=i+3;
					
				}else {
					price.add(list.get(i+5));
					type.add(list.get(i+6));
					i=i+6;
				}
			}
			
			Map<String, List> end = new HashMap();
			
			end.put("info", info);
			end.put("price", price);
			end.put("type", type);
			end.put("currentUrl", currentUrl);
		
			model.addAttribute("info",info ).addAttribute("price",price).addAttribute("type",type).addAttribute("currentUrl",currentUrl).addAttribute("flight",flight);
		
	        return "forward:/information/listFlightReturn.jsp";
	}
	
	@RequestMapping( value="getHotel" )
	public String getHotel() throws Exception{
		
		System.out.println("/information/getHotel");
		
	        return  "forward:/information/getHotel.jsp";
	}
	
	@RequestMapping( value="listNightLife" )
	public String listNightLife() throws Exception{
		
		System.out.println("/information/listNightLife");
		
	        return  "forward:/information/listNightLife.jsp";
	}
	
	@RequestMapping( value="getNightLifeDetail" )
	public String getNightLifeDetail(@ModelAttribute NightLife nightLife, Model model) throws Exception{
		
		System.out.println("/information/getNightLifeDetail");
		
		System.out.println(nightLife);
		
		Map<String, List<String>> map = informationService.getNightLifeDetail(nightLife);
		
		
		List<String> google = map.get("google");
		List<String> image = map.get("hrefs");
		List<String> context = map.get("context");
		List<String> info = map.get("infom");
		
		String location = google.get(0);
		String[] str = location.split("&");
		String[] center = str[7].split("=");
		
		String[] address = center[1].split(",");
		
		
		model.addAttribute("lat",address[0] ).addAttribute("lng",address[1] ).addAttribute("image",image).addAttribute("context",context)
						.addAttribute("info",info);
		
	        return  "forward:/information/getNightLifeDetail.jsp";
	}
	
	@RequestMapping( value="getUnsafeRegion" )
	public String getUnsafeRegion() throws Exception{
		
		System.out.println("/information/getUnsafeRegion");
		
	        return  "forward:/information/getUnsafeRegion.jsp";
	}
	
	
	

}
