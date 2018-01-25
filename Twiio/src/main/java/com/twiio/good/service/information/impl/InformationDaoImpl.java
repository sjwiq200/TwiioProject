package com.twiio.good.service.information.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
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
import org.springframework.stereotype.Repository;

import com.twiio.good.service.domain.City;
import com.twiio.good.service.domain.Currency;
import com.twiio.good.service.domain.WeatherMain;
import com.twiio.good.service.information.InformationDao;


@Repository("informationDaoImpl")
public class InformationDaoImpl implements InformationDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	@Value("#{apikeyProperties['currencykey']}")
	String currencyKey;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public InformationDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public List<Currency> addCurrency() throws Exception {
		//String key = "4RKuUFR6wEpqdppFDxmGS1RkUztGUN9W";
		String req = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey="+currencyKey+"&data=AP01&searchdate=20180119";
		
		URL url = new URL(req);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("GET");
        
        int responseCode = con.getResponseCode();
		
        BufferedReader br = null;
        System.out.println(responseCode);
	        if(responseCode==200) { 
	            br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
	        } else {  // 에러 발생
	            br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
	        }
      //JSON Data 읽기
        String jsonData = "";
        JSONArray json = null;
        StringBuffer response = new StringBuffer();
        ObjectMapper objMapper = new ObjectMapper();
        List<Currency> returnList = new ArrayList<Currency>();
        
	        while ((jsonData = br.readLine()) != null) {
	        	//json = (JSONArray)JSONValue.parse(jsonData+"\n");
	        	response.append(jsonData); 
	        }
	        br.close();
	        //String jsonMany = objMapper.writeValueAsString(response);
	        returnList = objMapper.readValue(response.toString(),new TypeReference<List<Currency>>() {
			});
	        sqlSession.delete("InformationMapper.deleteCurrency");
	        for(int i = 0; i<returnList.size(); i++) {
	        	sqlSession.insert("InformationMapper.addCurrency", returnList.get(i));
	        }
		return returnList;
	}
	
	@Override
	public Double getCurrency(String country) throws Exception {
		
		String[] str  = country.split("&");
		String[] standard = str[0].split("=");
		String[] compare = str[1].split("=");
		String[] inputPrice = str[2].split("=");
		
		Currency standardCurrency = sqlSession.selectOne("InformationMapper.findCurrency", standard[1]);
		Currency comparedCurrency = sqlSession.selectOne("InformationMapper.findCurrency", compare[1]);
		
		int price = Integer.parseInt(inputPrice[1].trim());
		String stand = null;
		String com = null;
		
		if(standardCurrency.getDeal_bas_r().contains(",")) {
			 stand = standardCurrency.getDeal_bas_r().replaceAll(",", "");
		}else {
			stand = standardCurrency.getDeal_bas_r();
		}
		
		 if( comparedCurrency.getDeal_bas_r().contains(",")) {
				 com = comparedCurrency.getDeal_bas_r().replaceAll(",", "");
		 }else {
			 com = comparedCurrency.getDeal_bas_r();
		 }
		Double result = (Double.parseDouble(stand )*price)/(Double.parseDouble( com));
		
		if(standard[1].contains("일본")) {
			result = result/100;
		}
		
		if(compare[1].contains("일본")) {
			result = result*100;
		}
		return Double.parseDouble(String.format("%.4f", result));
	}
	
	@Override
	public  Map<String,Object>  searchNowWeather(String cityName) throws Exception {
		
		URL url = new URL("http://api.openweathermap.org/data/2.5/weather?q="+cityName.trim()+"&mode=json&APPID=e03e75ae10d25e9ba1f6bfcb21b91d4b");
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
       String weather = weatherMain.toString();
        System.out.println("1.weatherMain : " + weatherMain);
		
		
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("weather", weather);
		
		return map;
	}
	
	@Override
	public Map<Object, String[]> searchHistoryWeather( String cityName) throws Exception {
		
		System.setProperty("webdriver.chrome.driver","C:\\Users\\장은애\\Desktop\\chromedriver\\chromedriver.exe");
		DesiredCapabilities capabilities = DesiredCapabilities.chrome();
		capabilities.setCapability("marionette", true);
		String[] string = null; 
		String[] tempResult =null; // historyWeather 
		
		try {
			
			WebDriver driver = new ChromeDriver();
			
			driver.get("https://www.timeanddate.com/weather/south-korea/seoul/historic");
			
			String title = driver.getTitle();
			System.out.println(title);
			
			WebElement searchField = (new WebDriverWait(driver, 100))
					.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("#wcquery")));
			
			driver.findElement(By.cssSelector("#wcquery")).sendKeys(cityName); 
			
			new WebDriverWait(driver, 100);
			
			searchField = (new WebDriverWait(driver, 100))
					.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("a[href*='javascript:menc(0)']")));
			
			driver.findElement(By.cssSelector("a[href*='javascript:menc(0)']")).click();
			driver.findElement(By.cssSelector("a[title*='Historic weather']")).click();
			
			List<WebElement> rows = driver.findElements(By.cssSelector(".tb-minimal")); // Quick Info Class 
			
			List<String> quickInfo = new ArrayList<String>();
			
			WebElement row = rows.get(0);
			
			List<WebElement> cellsMonth = row.findElements(By.cssSelector("tbody"));
			
			WebElement element = (WebElement)cellsMonth.get(0);
			
			String result = element.getText();
			
			string = result.split("\n");
			
//			for(String quickResult : string) {
//				System.out.println("History Weather : " +quickResult);
//			}
//			
	    	quickInfo.add(element.getText());
	    	
			List<WebElement> averageMonth = driver.findElements(By.cssSelector("#climategraph"));
			new WebDriverWait(driver, 100);
			WebElement rowAverageMonth = averageMonth.get(0);
			String rowAverageMonthText = rowAverageMonth.getText();
			
			tempResult = rowAverageMonthText.split("\n");
			
//			for(String allResult : tempResult) {
//				System.out.println("History Weather : " + allResult);
//			}
//			
			Thread.sleep(1800);
			
			driver.close(); 
		
		}catch(Exception e) {
			System.out.println("Error : " + e);
		}
		
		Map<Object,String[]> map = new HashMap<Object,String[]>();
		
		map.put("quickInfo", string);
		map.put("historyWeather", tempResult);
		
		return map;
	}
	
	@Override
	public List getFlight() throws Exception {
		
		System.setProperty("webdriver.chrome.driver","C:\\Users\\장은애\\Desktop\\chromedriver\\chromedriver.exe");
		
		DesiredCapabilities capabilities = DesiredCapabilities.chrome();
		
		capabilities.setCapability("marionette", true);
		
		try {
		WebDriver driver = new ChromeDriver();
		
		driver.get("https://www.expedia.co.kr/air");
		
		Thread.sleep(1000);
		
		WebElement searchField = (new WebDriverWait(driver, 100))
				.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//label[@class='text icon-before autocomplete-arrow gcw-flights-from']")));

		driver.findElement(By.cssSelector("#flight-origin-flp")).sendKeys("파리");//출발지 입력
		
		 searchField = (new WebDriverWait(driver, 100))
					.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("#flight-destination-flp")));
		
		driver.findElement(By.cssSelector("#flight-destination-flp")).sendKeys("프랑크푸르트");//도착지 입력
		
		driver.findElement(By.cssSelector("#flight-departing-flp")).sendKeys("2018.02.20");//출발일 입력

		driver.findElement(By.cssSelector("#flight-returning-flp")).clear();
		
		driver.findElement(By.cssSelector("#flight-returning-flp")).sendKeys("2018.02.28");//도착일 입력
		
		driver.findElement(By.xpath("//button[@class='btn-primary btn-action gcw-submit']")).click();//검색 누르기
		
///////////////////////////나라입력시 주석 제거////////////////////////		
//		searchField = (new WebDriverWait(driver, 50))
//				.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//button[@id='continue-search']")));//페이지 이동 기다리기
//		
//		driver.findElement(By.xpath("//button[@id='continue-search']")).click();//나라 입력 시 공항이 2개일때 '계속 누르기'
//////////////////////////////////////////////////////////////////////////		
		
		searchField = (new WebDriverWait(driver, 100))
				.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//span[@class='visuallyhidden']")));//페이지 이동 기다리기
		
		
		String departFlight  = driver.findElement(By.id("flightModuleList")).getText();
		//System.out.println(text);
		
		String[] info = departFlight.split("만점\\)");
		
		List list = new ArrayList();
		
		for(int i = 0 ; i<info.length; i++ ) {
			System.out.println("*****************************\n"+info[i]+"\n\n");
			list.add(info[i]);
		}
		
		searchField = (new WebDriverWait(driver, 150))
				.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//button[@class='btn-secondary btn-action t-select-btn']")));//페이지 이동 기다리기
		
		//driver.findElement(By.xpath("//span[text()='#결과 1']")).click();
		
	 
	 driver.findElement(By.xpath("//span[contains(text(), '결과 2')]/parent::span/parent::button")).click();//첫번째 가는편 선택

	 searchField = (new WebDriverWait(driver, 150))
				.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//button[@class='btn-secondary btn-action t-select-btn']")));//페이지 이동 기다리기
	 
	 
	 String returnFlight  = driver.findElement(By.id("flightModuleList")).getText();
		//System.out.println(text);
		
		String[] info2 = returnFlight.split("만점\\)");
		
		List list2 = new ArrayList();
		
		for(int i = 0 ; i<info2.length; i++ ) {
			System.out.println("*****************************\n"+info2[i]+"\n\n");
			list2.add(info2[i]);
		}
		
		
		driver.findElement(By.xpath("//span[contains(text(), '결과 2')]/parent::span/parent::button")).click();//첫번째 오는편 선택
		
		
		
		
		/////////////////////////결과 url받아오기////////////////////////////////
		 
		ArrayList<String> tabs = new ArrayList<String> (driver.getWindowHandles());
		    driver.switchTo().window(tabs.get(1));
		
		String url = driver.getCurrentUrl();
		
		System.out.println(url);
		
	 
		}catch (Exception e) {
			System.out.println(e);

		}
		return null;
	}

	@Override
	public List getHotel() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getUnsafeRegion() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List listNightLife() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getNightLifeDetail() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> findCity(String city) throws Exception {
		
		String str = city.trim();
		
		List<City> list = sqlSession.selectList("InformationMapper.getCity", str);
	
		List<String> item = new ArrayList<String>();
		
		for(int i = 0 ; i<list.size(); i++) {
			item.add(list.get(i).getCityName());
			//System.out.println(list.get(i).getCityName());
		}
		return item;
	}


}
