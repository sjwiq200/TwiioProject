package com.twiio.good.web.information;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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

	@RequestMapping(value="json/searchNowWeather",method=RequestMethod.GET)
	public Map<String,Object> searchNowWeather(@RequestParam String cityName) throws Exception {
	//public Map<String,Object> searchNowWeather(@RequestBody Search search) throws Exception {
		System.out.println("searchNowWeather Controller  ");

		System.out.println(" cityName : " + cityName);

		

		//URL url = new URL("http://api.openweathermap.org/data/2.5/weather?q="+cityName.trim()+"&mode=json&APPID=e03e75ae10d25e9ba1f6bfcb21b91d4b");
		URL url = new URL("http://api.openweathermap.org/data/2.5/weather?q=Kismaayo&mode=json&APPID=e03e75ae10d25e9ba1f6bfcb21b91d4b");
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("GET");


		// Response Code GET
        int responseCode = con.getResponseCode();

        BufferedReader br = null;

        if(responseCode==200) { 
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else {  
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }

        String jsonData = "";
        StringBuffer response = new StringBuffer();

        while ((jsonData = br.readLine()) != null) {
            response.append(jsonData);
        }

        String reader = response.toString();
        br.close();

        JSONObject jsonobj = (JSONObject)JSONValue.parse(reader);
        System.out.println("jsonobj : " + jsonobj);
        ObjectMapper objectMapper = new ObjectMapper();

        JSONObject jsonobjTemp = (JSONObject) jsonobj.get("main");
        System.out.println("jsonobjTemp : " + jsonobjTemp);
        WeatherMain weatherMain = objectMapper.readValue(jsonobjTemp.toString(), WeatherMain.class);

       JSONArray array = (JSONArray) jsonobj.get("weather");
       String weatherResult = array.get(0).toString();
       System.out.println("weatherResult : " + weatherResult);

       
       //WeatherState weatherState = objectMapper.readValue(weatherResult.toString(), WeatherState.class);

        System.out.println("1.weatherMain : " + weatherMain);
        //System.out.println("2.weahterState : " + weatherState); 

        

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("weatherMain", weatherMain);
        //map.put("weatherState", weatherState);
        //map.put("weatherResult", weatherResult);

		return map;

	}

	@RequestMapping(value="json/searchHistoryWeather",method=RequestMethod.GET)
	public Map<Object, String[]> searchHistoryWeather(@RequestParam String cityName) throws Exception {

		System.out.println("searchHistoryWeather Controller ");
		System.out.println("cityName : " + cityName);
		
		System.setProperty("webdriver.chrome.driver","C:\\Users\\장은애\\Desktop\\chromedriver\\chromedriver.exe");
		DesiredCapabilities capabilities = DesiredCapabilities.firefox();
		capabilities.setCapability("marionette", true);
		String[] string = null; 
		String[] tempResult =null; // historyWeather 
		try {
			
			//WebDriver driver = new FirefoxDriver();
			WebDriver driver = new ChromeDriver();
			
			//driver.manage().window().maximize();
			driver.get("https://www.timeanddate.com/weather/south-korea/seoul/historic");
			
			//DesiredCapabilities capabilities = DesiredCapabilities.chrome();
			//capabilities.setCapability("marionette", true);
			
			String title = driver.getTitle();
			System.out.println(title);
			
			driver.findElement(By.cssSelector("#wcquery")).sendKeys(cityName); 
			driver.findElement(By.cssSelector(".submit-citypicker")).click();	
			
			driver.findElement(By.cssSelector("a[href*='uk']")).click();
			driver.findElement(By.cssSelector("a[title*='Historic weather']")).click();
			
			//List<WebElement> inputs = driver.findElements(By.xpath("//th"));
			
			List<WebElement> rows = driver.findElements(By.cssSelector(".tb-minimal")); // Quick Info Class 
			
			List<String> quickInfo = new ArrayList<String>();
			
			WebElement row = rows.get(0);
			
			List<WebElement> cellsMonth = row.findElements(By.cssSelector("tbody"));
			
			WebElement element = (WebElement)cellsMonth.get(0);
			
			String result = element.getText();
			
			string = result.split("\n");
			
			for(String quickResult : string) {
				System.out.println("History Weather : " +quickResult);
			}
			
	    	quickInfo.add(element.getText());
	    	
			List<WebElement> averageMonth = driver.findElements(By.cssSelector("#climategraph"));
			
			WebElement rowAverageMonth = averageMonth.get(0);
			String rowAverageMonthText = rowAverageMonth.getText();
			tempResult = rowAverageMonthText.split("\n");
			
			for(String allResult : tempResult) {
				System.out.println("History Weather : " + allResult);
			}
			
			Thread.sleep(1800);
			
			driver.close(); 
		
		}catch(Exception e) {
			System.out.println("Error占쌩삼옙 : " + e);
		}
		
		
		Map<Object,String[]> map = new HashMap<Object,String[]>();
		map.put("quickInfo", string);
		map.put("historyWeather", tempResult);
	
		
		return map;

	}

	

}
