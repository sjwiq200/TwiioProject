package com.twiio.good.web.information;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.twiio.good.service.domain.City;
import com.twiio.good.service.domain.WeatherMain;
import com.twiio.good.service.information.InformationService;


@RestController
@RequestMapping("/information/*")
public class InformationRestController {
	
	@Autowired
	@Qualifier("informationServiceImpl")
	private InformationService informationService;
	
	
	
	public InformationRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/getCurrency/" )
	public Double  getCurrency(@RequestBody String standardCountry ) throws Exception{
		
		System.out.println("/information/json/getCurrency");
		
		String decoding = URLDecoder.decode(standardCountry, "UTF-8");
		
		Double result = informationService.getCurrency(decoding);
			
		return result;
	}
	
	@RequestMapping( value="json/autoComplete/" )
	public List<String>  autoComplete(@RequestBody String keyword ) throws Exception{
		
		System.out.println("/information/json/autoComplete");
		
		String decoding = URLDecoder.decode(keyword, "UTF-8");
		
		String[] word = decoding.split("=");
		
		 String str = word[1];
		
		 System.out.println(str);
		 
		List<String> item  = informationService.findCity(str);
		
		return item;
	}


	@RequestMapping(value="json/searchNowWeather",method=RequestMethod.GET)
	public Map<String,Object> searchNowWeather(@RequestParam String cityName) throws Exception {
		
		System.out.println("/information/json/searchNowWeather");
		System.out.println(" cityName : " + cityName);
       
		Map<String,Object> map = informationService.searchNowWeather(cityName);
		
		Map<String,Object> result = new HashMap<String,Object>();
		
		String str = (String) map.get("weather");
		
		String[] context =  str.split(",");
		String[] temp  = context[0].split("=");
		String[] pressure = context[1].split("=");
		String[] humidity = context[2].split("=");
		String[] temp_min = context[3].split("=");
		String[] temp_max = context[4].split("=");
		
		if(context.length>5) {
			String[] grnd_level = context[5].split("=");
			String[] sea_level = context[6].split("=");
			
			result.put("grnd_level", grnd_level[1]);
			result.put("sea_level", sea_level[1]);
		
		}
		result.put("temp", temp[1]);
		result.put("pressure", pressure[1]);
		result.put("humidity", humidity[1]);
		result.put("temp_min", temp_min[1]);
		result.put("temp_max", temp_max[1]);
		
		return result;
	}

	@RequestMapping(value="json/searchHistoryWeather",method=RequestMethod.GET)
	public Map<Object,String[]> searchHistoryWeather(@RequestParam String cityName) throws Exception {

		System.out.println("json/searchHistoryWeather ");
		System.out.println("cityName : " + cityName);
		
		Map<Object,String[]> map = informationService.searchHistoryWeather(cityName);
		
		List<String> list = new ArrayList<String>();
		
		String[] simple = map.get("quickInfo");
		String[] aver = {};
		for(int i = 0; i<simple.length; i++) {
			list.add(simple[i]);
			System.out.println("simple다오다오"+simple[i]);
		}
		
		String[] past = map.get("historyWeather");
		System.out.println("???????????????");
		for(int i = 0; i<past.length; i++) {
			for(int k = 0; k<k+4;) {
				aver[i]= past[k]+past[k+1]+past[k+2]+past[k+3];
				k=k+4;
			}
			System.out.println("붙었니....?"+aver[i]);
		}
		System.out.println("???????????????");
		Map<String,List> last = new HashMap();
		
			last.put("list", list);
		
	
		return map;

	}

	

}
