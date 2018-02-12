package com.twiio.good.web.information;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.jrockit.jfr.FlightRecorder;
import com.sun.xml.internal.bind.v2.runtime.output.StAXExStreamWriterOutput;
import com.twiio.good.service.domain.Flight;
import com.twiio.good.service.domain.Hotel;
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
	
	@RequestMapping( value="json/cityAutoComplete/" )
	public List<String>  cityAutoComplete(@RequestBody String keyword ) throws Exception{
		
		System.out.println("/information/json/cityAutoComplete");
		
		String decoding = URLDecoder.decode(keyword, "UTF-8");
		
		String[] word = decoding.split("=");
		
		 String str = word[1];
		
		 System.out.println(str);
		 
		List<String> item  = informationService.findCity(str);
		
		return item;
	}
	
	@RequestMapping( value="json/countryAutoComplete/" )
	public List<String>  countryAutoComplete(@RequestBody String keyword ) throws Exception{
		
		System.out.println("/information/json/countryAutoComplete");
		
		String decoding = URLDecoder.decode(keyword, "UTF-8");
		
		String[] word = decoding.split("=");
		
		 String str = word[1];
		
		List<String> item  = informationService.findCountry(str);
		
		return item;
	}
	
	@RequestMapping( value="json/continentAutoComplete/" )
	public List<String>  continentAutoComplete(@RequestBody String keyword ) throws Exception{
		
		System.out.println("/information/json/continentAutoComplete");
		
		String decoding = URLDecoder.decode(keyword, "UTF-8");
		
		String[] word = decoding.split("=");
		
		 String str = word[1];
		
		List<String> item  = informationService.findContinent(str);
		
		return item;
	}


	@RequestMapping(value="json/searchNowWeather",method=RequestMethod.GET)
	public Map<String,List> searchNowWeather(@RequestParam String cityName) throws Exception {
		
		System.out.println("/information/json/searchNowWeather");
		System.out.println(" cityName : " + cityName);
       
		Map<String,List> map = informationService.searchNowWeather(cityName);
		
		Map<String,Object> result = new HashMap<String,Object>();
		
		List<String>  dateList = map.get("dateList");
		List<WeatherMain> mainList = map.get("mainList");
		
		List<String> resultDate = new ArrayList<>();
		List<Long> resultTemp = new ArrayList<>();

		for(int i =0; i<dateList.size()-1; i++) {
			String[] str = dateList.get(i).split(" ");
			resultDate.add(str[0]);
			i = i+3;
		}
		System.out.println(resultDate.size());
		
		for(int i =0; i<mainList.size()-1; i++) {
			Double tmp = Double.parseDouble(mainList.get(i).getTemp());
			System.out.println("tmp"+tmp);
			resultTemp.add(Math.round(tmp-273));
			i = i+3;
		}
		System.out.println(resultTemp.size());
		
		map.put("resultDate", resultDate);
		map.put("resultTemp", resultTemp);
		
		
		//		String str = (String) map.get("weather");
//		
//		String[] context =  str.split(",");
//		String[] temp  = context[0].split("=");
//		String[] pressure = context[1].split("=");
//		String[] humidity = context[2].split("=");
//		String[] temp_min = context[3].split("=");
//		String[] temp_max = context[4].split("=");
//		
//		if(context.length>5) {
//			String[] grnd_level = context[5].split("=");
//			String[] sea_level = context[6].split("=");
//			
//			result.put("grnd_level", grnd_level[1]);
//			result.put("sea_level", sea_level[1]);
//		
//		}
//		result.put("temp", temp[1]);
//		result.put("pressure", pressure[1]);
//		result.put("humidity", humidity[1]);
//		result.put("temp_min", temp_min[1]);
//		result.put("temp_max", temp_max[1]);
		
		return map;
	}

	@RequestMapping(value="json/searchHistoryWeather",method=RequestMethod.GET)
	public Map<String,List> searchHistoryWeather(@RequestParam String cityName) throws Exception {

		System.out.println("/imformation/json/searchHistoryWeather ");
		
		String name = URLDecoder.decode(cityName, "UTF-8");
		
		System.out.println("cityName : " + name);
		
		Map<Object,String[]> map = informationService.searchHistoryWeather(name);
		
		List<String> list = new ArrayList<String>();
		List<String> data = new ArrayList<String>();
		
		String[] simple = map.get("quickInfo");
		for(int i = 0; i<simple.length; i++) {
			String[] str = simple[i].split(" ");
			
			list.add(str[0]+" "+str[1]);
			data.add(str[2]+" "+str[3]+" "+str[4]+" "+str[5]);
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
			last.put("data", data);
			last.put("month", month);
			last.put("min", min);
			last.put("max", max);
			last.put("rain", rain);
		
	
		return last;

	}
	
	@RequestMapping( value="json/getFlightList")
	public Map<String, List> getFlightList(@RequestBody String flightInfo) throws Exception{
		
		System.out.println("/information/json/getFlightList");
		System.out.println(flightInfo);
		
		
		String decoding = URLDecoder.decode(flightInfo, "UTF-8");
		System.out.println(decoding);
		
		String[] context =  decoding.split("&");
		String[] flightType  = context[0].split("=");
		String[] departure = context[1].split("=");
		String[] arrival = context[2].split("=");
		String[] departureDate = context[3].split("=");
		String[] arrivalDate = context[4].split("=");
		String[] headCount = context[5].split("=");
		
		Flight flight = new Flight();
		flight.setFlightType(flightType[1]);
		flight.setDeparture(departure[1]);
		flight.setArrival(arrival[1]);
		flight.setDepartureDate(departureDate[1]);
		flight.setArrivalDate(arrivalDate[1]);
		flight.setHeadCount(headCount[1]);
		
		Map<String, List<String>> result  = informationService.getFlightList(flight);
		List<String> url = result.get("url");
		List<String> list = result.get("list");
		List<String> currentUrl  = new ArrayList<String>();
		
		currentUrl.add(url.get(0));
		
			List<String> info = new ArrayList<>();
			List<String> price = new ArrayList<>();
			List<String> type = new ArrayList<>();
		
		for(int i = 0; i<list.size()-6; i++) {
			info.add((list.get(i))+"\n"+(list.get(i+1))+"\n"+(list.get(i+2))+"\n"+(list.get(i+3)));
			
			if(list.get(i+4).matches(	".*[a-zA-Z].*")) {
				
				price.add(list.get(i+5));
				type.add(list.get(i+7));
				i=i+7;
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
			
		return end;
	}
	
	@RequestMapping( value="json/getFlightListReturn")
	public Map<String, String>  getFlightListReturn(@RequestBody String flightInfo) throws Exception{
		
		System.out.println("/information/json/getFlightListReturn");
		System.out.println(flightInfo);
		
		String[] context =  flightInfo.split("&");
		String[] clickNum  = context[0].split("=");
		String[] currentUrl = context[1].split("=");
		
		String decoding = URLDecoder.decode(currentUrl[1], "UTF-8");
		System.out.println(decoding);
		String[] str = decoding.split("\\[");
		String[] str2 = str[1].split("\\]");
		
		Flight flight = new Flight();
		flight.setClickNum(clickNum[1]);
		flight.setReturnUrl(str2[0]);
		
		List<String> list = informationService.getFlightListUrl(flight);
		
		Map<String, String> map = new HashMap<>();
		map.put("list", list.get(0));
		
		return map;
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
		
		System.out.println("¹¹ÇÏ´Ï");
		
		Map<String, List> end = new HashMap();
		
		end.put("con", con);
		end.put("loc", loc);
		end.put("price", price);
		end.put("url", url);
		end.put("image", image);
		
		return end;
	}

	@RequestMapping( value="json/listNightLife", produces = "application/json; charset=utf8" )
	public  Map<String,List>  listNightLife(@RequestBody String city ) throws Exception{
		
		System.out.println("/information/json/listNightLife");
		
		String decoding = URLDecoder.decode(city, "UTF-8");
		
		System.out.println(decoding);
		
		String[] cityName = decoding.split("=");
		
		System.out.println(cityName[1]);
		
		Map<String, List<String>> map = informationService.listNightLife(cityName[1]);
		
		List<String> context = map.get("context");
		List<String> url = map.get("hrefs");
		List<String> image = map.get("image");
		
		
		List<String> name = new ArrayList<>();
		List<String> no = new ArrayList<>();
		List<String> type = new ArrayList<>();
		
		for(int i = 0; i<context.size()-2; i++) {
			
			name.add(context.get(i));
			no.add(context.get(i+1));
			type.add(context.get(i+2));
			
			i = i+2;
				
		}
		
		Map<String, List> end = new HashMap();
		
		end.put("name", name);
		end.put("no", no);
		end.put("type", type);
		end.put("url", url);
		end.put("image", image);
		
		return end;
	}
	
	@RequestMapping( value="json/getUnsafeRegion")
	public  Map<String,String>  getUnsafeRegion(@RequestBody String country ) throws Exception{
		
		System.out.println("/information/json/getUnsafeRegion");
		
		String decoding = URLDecoder.decode(country, "UTF-8");
		
		String[] countryName = decoding.split("=");
		
		List<String> list = informationService.getUnsafeRegion(countryName[1]);
		
		String img  = list.get(1);
		String info = list.get(0);
		
		Map<String, String> end = new HashMap();
		
		end.put("img", img);
		end.put("info", info);
		
		return end;
	}

}
