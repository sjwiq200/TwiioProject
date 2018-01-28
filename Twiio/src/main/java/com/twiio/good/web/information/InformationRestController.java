package com.twiio.good.web.information;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.jrockit.jfr.FlightRecorder;
import com.sun.xml.internal.bind.v2.runtime.output.StAXExStreamWriterOutput;
import com.twiio.good.service.domain.Flight;
import com.twiio.good.service.domain.Hotel;
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
	public Map<String,List> searchHistoryWeather(@RequestParam String cityName) throws Exception {

		System.out.println("json/searchHistoryWeather ");
		System.out.println("cityName : " + cityName);
		
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
		
		Map<String,List> last = new HashMap();
		
			last.put("list", list);
			last.put("month", month);
			last.put("min", min);
			last.put("max", max);
			last.put("rain", rain);
		
	
		return last;

	}
	
	@RequestMapping( value="json/getFlightList")
	public Map<String, List>  getFlightList(@RequestBody String pram) throws Exception{
		
		System.out.println("/information/json/getFlightList");
		
		System.out.println(pram);
		String[] str = pram.split("&");
		String[] splitNum = str[0].split("=");
		String num = splitNum[1];
		String[] splitUrl = str[1].split("=");
		String url = splitUrl[1];
		
		
		Map<String, List<String>> map= informationService.getFlightListRetrun(url, num);
		List<String> urlList= map.get("urlReturn");
		List<String> currentUrl  = new ArrayList<String>();
				
		currentUrl.add(urlList.get(0));
		
		List<String> list = map.get("list");
		
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
		
			Map<String, List> end = new HashMap();
			
			end.put("info", info);
			end.put("price", price);
			end.put("type", type);
			end.put("currentUrl", currentUrl);
		
			
		return end;
	}
	
	@RequestMapping( value="json/getHotel" )
	public  Map<String,List>  getHotel(@RequestBody String hotel ) throws Exception{
		
		System.out.println("/information/json/getHotel");
		
		String decoding = URLDecoder.decode(hotel, "UTF-8");
		System.out.println(decoding);
		
		String[] str = decoding.split("&");
		
		String[] city = str[0].split("=");
		String[] checkIn = str[1].split("=");
		String[] checkOut = str[2].split("=");
		String[] headCount = str[3].split("=");
		
		Hotel info = new Hotel();
		
		info.setCity(city[1]);
		info.setCheckIn(checkIn[1]);
		info.setCheckOut(checkOut[1]);
		info.setHeadCount(headCount[1]);
		
		
		Map<String, List<String>> map= informationService.getHotel(info);
		
		List<String> list = map.get("list");
		List<String> url = map.get("url");
		List<String> image = map.get("image");
		
		List<String> con = new ArrayList<>();
		List<String> loc = new ArrayList<>();
		List<String> price = new ArrayList<>();
		
		for(int i = 0; i<list.size()-5; i++) {
			
			con.add(list.get(i)+list.get(i+2));
			loc.add(list.get(i+3));
			
			if(list.get(i+5).matches(	".*[¤¡-¤¾¤¿-¤Ó°¡-ÆR]+.*")) {
				
					System.out.println("°É·¯Áö´Ï@@"+list.get(i+5));
					price.add(list.get(i+4));
					i=i+4;
				}else {
					price.add(list.get(i+5));
					i=i+5;
				}
				
		}
		
//		List<String> type = new ArrayList<>();
//		for(int i = 6; i<list.size(); i++) {
//			type.add(list.get(i));
//			i=i+6;
//		}
		
		Map<String, List> end = new HashMap();
		
		end.put("con", con);
		end.put("loc", loc);
		end.put("price", price);
		end.put("url", url);
		end.put("image", image);
		
		return end;
	}

	

}
