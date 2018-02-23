package com.twiio.good.service.information.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
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
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.twiio.good.service.domain.City;
import com.twiio.good.service.domain.Continent;
import com.twiio.good.service.domain.Country;
import com.twiio.good.service.domain.Currency;
import com.twiio.good.service.domain.Flight;
import com.twiio.good.service.domain.Hotel;
import com.twiio.good.service.domain.NightLife;
import com.twiio.good.service.domain.WeatherMain;
import com.twiio.good.service.information.InformationDao;


@Repository("informationDaoImpl")
public class InformationDaoImpl implements InformationDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	@Value("#{apikeyProperties['currencykey']}")
	String currencyKey;
	
	@Value("#{apikeyProperties['unsaferegion']}")
	String unsafeKey;
	
	@Value("#{apikeyProperties['regioncontact']}")
	String contactKey;
	
	@Value("#{commonProperties['chromeDriver']}")
	String chromeDriver;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public InformationDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public List<Currency> addCurrency() throws Exception {

		String req = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey="+currencyKey+"&searchdate=20180221&data=AP01";

		//String key = "4RKuUFR6wEpqdppFDxmGS1RkUztGUN9W";

		URL url = new URL(req);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("GET");
        
        int responseCode = con.getResponseCode();
		
        BufferedReader br = null;
        System.out.println(responseCode);
	        if(responseCode==200) { 
	            br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
	        } else {  // ���� �߻�
	            br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
	        }
      //JSON Data �б�
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
		
		if(standard[1].contains("�Ϻ�")||standard[1].contains("������")||standard[1].contains("�ε��׽þ�")||standard[1].contains("���¸�")) {
			result = result/100;
		}
		
		if(compare[1].contains("�Ϻ�")||standard[1].contains("������")||standard[1].contains("�ε��׽þ�")||standard[1].contains("���¸�")) {
			result = result*100;
		}
		return Double.parseDouble(String.format("%.4f", result));
	}
	
	@Override
	public  Map<String,List>  searchNowWeather(String cityName) throws Exception {
		
		URL url = new URL("http://api.openweathermap.org/data/2.5/forecast?q="+cityName.trim()+"&mode=json&APPID=e03e75ae10d25e9ba1f6bfcb21b91d4b");
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
        ObjectMapper objectMapper = new ObjectMapper();

        JSONArray jsonobjTemp = (JSONArray) jsonobj.get("list");
        List<String> dateList = new ArrayList<>();
        List<WeatherMain> mainList = new ArrayList<>();
        
        for(int i = 0 ; i<jsonobjTemp.size(); i++) {
        	JSONObject data =(JSONObject)jsonobjTemp.get(i);
        	String dt_txt = (String) data.get("dt_txt");
        	JSONObject main = (JSONObject)data.get("main");
        	WeatherMain weatherMain = objectMapper.readValue(main.toString(), WeatherMain.class);
        	dateList.add(dt_txt);
        	mainList.add(weatherMain);
        }
        
        Map<String,List> map = new HashMap<String,List>();
        map.put("dateList", dateList);
        map.put("mainList", mainList);
		
		return map;
	}
	
	@Override
	public Map<Object, String[]> searchHistoryWeather( String cityName) throws Exception {
		
		System.setProperty("webdriver.chrome.driver",chromeDriver);
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
	public Map<String, List<String>> getFlightList(Flight flight) throws Exception {
		
		System.setProperty("webdriver.chrome.driver",chromeDriver);
		DesiredCapabilities capabilities = DesiredCapabilities.chrome();
		capabilities.setCapability("marionette", true);
		String[] result =null;
		
		List<String> list = new ArrayList<String>();
		Map<String, List<String>> map = new HashMap<>();
		try {
			
			WebDriver driver = new ChromeDriver();
			driver.get("https://www.expedia.co.kr/air");
			Thread.sleep(1000);
			WebElement searchField = (new WebDriverWait(driver, 100))
					.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//label[@class='text icon-before autocomplete-arrow gcw-flights-from']")));
			driver.findElement(By.cssSelector("#flight-origin-flp")).sendKeys(" "+flight.getDeparture());//����� �Է�
			 searchField = (new WebDriverWait(driver, 100))
						.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("#flight-destination-flp")));
			driver.findElement(By.cssSelector("#flight-destination-flp")).sendKeys(" "+flight.getArrival());//������ �Է�
			driver.findElement(By.cssSelector("#flight-departing-flp")).sendKeys(flight.getDepartureDate());//����� �Է�
			driver.findElement(By.cssSelector("#flight-returning-flp")).clear();
			driver.findElement(By.cssSelector("#flight-returning-flp")).sendKeys(flight.getArrivalDate());//������ �Է�
			
			
			if(Integer.parseInt(flight.getHeadCount()) >1) {
					
					JavascriptExecutor js = (JavascriptExecutor) driver;
					searchField = (new WebDriverWait(driver, 50))
							.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//select[@id='flight-adults-flp']")));
					js.executeScript("$('#flight-adults-flp').val("+flight.getHeadCount()+")"); //�ο� �Է�
			}
			driver.findElement(By.xpath("//button[@class='btn-primary btn-action gcw-submit']")).click();//�˻� ������
			
	///////////////////////////�����Է½� �ּ� ����////////////////////////		
	//		searchField = (new WebDriverWait(driver, 50))
	//				.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//button[@id='continue-search']")));//������ �̵� ��ٸ���
	//		
	//		driver.findElement(By.xpath("//button[@id='continue-search']")).click();//���� �Է� �� ������ 2���϶� '��� ������'
	//////////////////////////////////////////////////////////////////////////		
			
			searchField = (new WebDriverWait(driver, 100))
					.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//span[@class='visuallyhidden']")));//������ �̵� ��ٸ���
			
		searchField = (new WebDriverWait(driver, 150))
				.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//button[@class='btn-secondary btn-action t-select-btn']")));//������ �̵� ��ٸ���
		
		searchField = (new WebDriverWait(driver, 150))
				.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("a[href*='#route-happy']")));
		
		String departFlight  = driver.findElement(By.id("flightModuleList")).getText();
		
		 result = departFlight.split("\n");
		
		for(int i = 0 ; i<result.length; i++ ) {
			System.out.println("::"+result[i]);
			list.add(result[i]);
		}
		
		Iterator<String> iter = list.iterator();
		while (iter.hasNext()) {
			String s = iter.next();
		 
			if (s.contains("wifi")||s.contains("�������θ�Ʈ")||s.contains("power")||s.contains("����")||s.contains("����")||s.contains("�ͽ��ǵ�ƿ���")||s.contains("����")
					||s.contains("����")||s.contains("����")||s.contains("����")||s.contains("�˻�")||s.contains("����")||s.contains("����")||s.contains("���")||s.contains("����")
					||s.contains("������")||s.equals("")||s.contains("���Ϲ�")) {
				iter.remove();
			}
		}
		
		for(int i = 0 ; i<list.size(); i++) {
			System.out.println("**"+list.get(i));
		}
		
		List<String > url = new ArrayList();
		url.add(driver.getCurrentUrl());
		map.put("list", list);
		map.put("url", url);
		
		driver.close();
	 
		}catch (Exception e) {
			System.out.println(e);

		}
		return map;
	}
	
	@Override
	public Map<String, List<String>> getFlightListRetrun(String url, String num) throws Exception {
		
		System.setProperty("webdriver.chrome.driver",chromeDriver);
		DesiredCapabilities capabilities = DesiredCapabilities.chrome();
		capabilities.setCapability("marionette", true);
		
		List<String> list = new ArrayList<String>();
		Map<String, List<String>> map = new HashMap<>();
		try {
			
			WebDriver driver = new ChromeDriver();
			int number = Integer.parseInt(num)+1;
			String decoding = URLDecoder.decode(url, "UTF-8");
			
			driver.get(decoding);
			
			WebElement searchField = (new WebDriverWait(driver, 150))
					.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("a[href*='#route-happy']")));
			
			searchField = (new WebDriverWait(driver, 150))
					 .until(ExpectedConditions.presenceOfElementLocated(By.xpath("//span[contains(text(), '��� "+number+"')]/parent::span/parent::button")));
			
			 driver.findElement(By.xpath("//span[contains(text(), '��� "+number+"')]/parent::span/parent::button")).click();//ù��° ������ ����
			
			 System.out.println("1111");
			  searchField = (new WebDriverWait(driver, 150))
						.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("#wizard-summary")));
//			  
//			  searchField = (new WebDriverWait(driver, 100))
//						.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//span[@class='visuallyhidden']")));//������ �̵� ��ٸ���
//				
//			searchField = (new WebDriverWait(driver, 150))
//					.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//button[@class='btn-secondary btn-action t-select-btn']")));//������ �̵� ��ٸ���
			
			Thread.sleep(1000);
			System.out.println("222");
			   searchField = (new WebDriverWait(driver, 150))
						.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("a[href*='#route-happy']")));
			   System.out.println("3333");
				 String returnFlight  = driver.findElement(By.id("flightModuleList")).getText();
					
					String[] info2 = returnFlight.split("\n");
					
					for(int i = 0 ; i<info2.length; i++ ) {
						System.out.println("::"+info2[i]);
						list.add(info2[i]);
					}
					
					Iterator<String> iter = list.iterator();
					while (iter.hasNext()) {
						String s = iter.next();
					 
						if (s.contains("wifi")||s.contains("�������θ�Ʈ")||s.contains("power")||s.contains("����")||s.contains("����")||s.contains("�ͽ��ǵ�ƿ���")||s.contains("����")
								||s.contains("����")||s.contains("����")||s.contains("����")||s.contains("�˻�")||s.contains("����")||s.contains("����")||s.contains("���")||s.contains("����")
								||s.contains("������")||s.equals("")||s.contains("���Ϲ�")) {
							iter.remove();
						}
					}
					
					for(int i = 0 ; i<list.size(); i++) {
						System.out.println("**"+list.get(i));
					}
					
					List<String > urlReturn = new ArrayList();
					urlReturn.add(driver.getCurrentUrl());
					map.put("list", list);
					map.put("urlReturn", urlReturn);
							
					driver.close();
					
					}catch (Exception e) {
						System.out.println(e);
					}
		
		return map;
	}
	
	@Override
	public List<String> getFlightListUrl(Flight flight) throws Exception {
		
		System.setProperty("webdriver.chrome.driver",chromeDriver);
		DesiredCapabilities capabilities = DesiredCapabilities.chrome();
		capabilities.setCapability("marionette", true);
		
		List<String> list = new ArrayList<String>();
		Map<String, List<String>> map = new HashMap<>();
		
		 List<String > urlReturn = new ArrayList();
		try {
			
			WebDriver driver = new ChromeDriver();
			int number = Integer.parseInt(flight.getClickNum())+1;
			String decoding = URLDecoder.decode(flight.getReturnUrl(), "UTF-8");

			driver.get(decoding);
			Thread.sleep(1000);
			
			WebElement	searchField = (new WebDriverWait(driver, 150))
				.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("a[href*='#route-happy']")));
					
			driver.findElement(By.xpath("//span[contains(text(), '��� "+number+"')]/parent::span/parent::button")).click();//ù��° ������ ����
					
					/////////////////////////��� url�޾ƿ���////////////////////////////////
					 
			List<String> tabs = new ArrayList<String> (driver.getWindowHandles());
			 driver.switchTo().window(tabs.get(1));
			 
			urlReturn.add(driver.getCurrentUrl());
				 
					}catch (Exception e) {
						System.out.println(e);
					}
		
		return urlReturn;
	}

	@Override
	public Map<String, List<String>> getHotel(Hotel hotel) throws Exception {
		System.setProperty("webdriver.chrome.driver",chromeDriver);
		
		DesiredCapabilities capabilities = DesiredCapabilities.chrome();
		
		capabilities.setCapability("marionette", true);
		List<String> list = new ArrayList<String>();
		List<String> url = new ArrayList<String>();
		List<String> image = new ArrayList<String>();
		Map<String, List<String>> map = new HashMap<>();
		
		try {
		WebDriver driver = new ChromeDriver();
		
		driver.get("https://www.expedia.co.kr/Hotels");
		
		Thread.sleep(1000);
		
		WebElement searchField = (new WebDriverWait(driver, 50))
				.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("#hotel-destination-hlp")));

		driver.findElement(By.cssSelector("#hotel-destination-hlp")).sendKeys(" "+hotel.getCity());//������ �Է�
		
		driver.findElement(By.cssSelector("#hotel-checkin-hlp")).clear();
		
		driver.findElement(By.cssSelector("#hotel-checkin-hlp")).sendKeys(hotel.getCheckIn());//üũ�� �Է�

		driver.findElement(By.cssSelector("#hotel-checkout-hlp")).clear();
		
		driver.findElement(By.cssSelector("#hotel-checkout-hlp")).sendKeys(hotel.getCheckOut());//üũ�ƿ� �Է�
		
		JavascriptExecutor js = (JavascriptExecutor) driver;
		
//		int k = 2;
//		
//		js.executeScript("$('#hotel-rooms-hlp').val("+k+")"); //���ǰ��� �Է�
//		
//		searchField = (new WebDriverWait(driver, 50))
//				.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("#room"+k+"-data-hlp")));
//
//		
//		for(int h = 1 ; h<=k ; h++) {
//		
//			js.executeScript("$('#hotel-"+h+"-adults-hlp').val("+2+")");
//			
//			js.executeScript("$('#hotel-"+h+"-children-hlp').val("+0+")");
//			
//		}
		///���Ǵ��� ����
		
		js.executeScript("$('#hotel-1-adults-hlp').val("+hotel.getHeadCount()+")"); //�ο� �Է�
		
		searchField = (new WebDriverWait(driver, 50))
				.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("#hotel-1-adults-hlp")));
		
		
		driver.findElement(By.xpath("//button[@class='btn-primary btn-action  gcw-submit']")).click();//�˻� ������
		
		searchField = (new WebDriverWait(driver, 50))
				.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("#hotelResultTitle")));
		
			searchField = (new WebDriverWait(driver, 50))
					.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("#hotelResultTitle")));
			
			String content  = driver.findElement(By.id("resultsContainer")).getText();
			
			String[] str2 = content.split("\n");
	
			for(int i = 0 ; i<str2.length; i++ ) {
			//System.out.println("++++++++++++++++++++++++++++++++++++\n"+str2[i]);
				list.add(str2[i]);
			}
			
			System.out.println("return���̱���"+list.size());
			
			Iterator<String> iter = list.iterator();
			while (iter.hasNext()) {
				String s = iter.next();
			 
				if (s.contains("�̰��� ")||s.contains("Guest")||s.contains("/")||s.contains("Based ")||s.contains("�Ǹ�")||s.contains("����")||s.contains("�����")
						||s.contains("�����ϰ�")||s.contains("����")||s.contains("Price")||s.contains("���")||s.contains("����")||s.contains("Ŭ��")||s.contains("����Ʈ")
						||s.contains("VIP")||s.equals("")||s.contains("���θ�����")||s.contains("����")||s.contains("Price")||s.contains("���")||s.contains("����")
						||s.contains("����")||s.contains("�ı�")||s.contains("this")||s.contains("����")||s.contains("����")||s.contains("������")||s.contains("����")
						||s.contains("����")||s.contains("����")||s.contains("More")||s.contains("�ͽ��ǵ��")||s.contains("�α�")||s.contains("���")
						||s.contains("Ȯ��")||s.contains("����")||s.contains("02")||s.contains("�ͽ��ǵ��")||s.contains("�α�")||s.contains("���")) {
					iter.remove();
				}
			}
			
			 ///////////////////////////////////////////////////////������ ���� �� url ��������/////////////////////////////////////////////////////
			 List<WebElement> links = driver.findElements(By.xpath("//div[@class='flex-link-wrap']/a"));
			 
	         //System.out.println(links.size()); 
	         
	         List<String> hrefs = new ArrayList<String>();
	         
	         for ( WebElement anchor : links ) {
	        	    hrefs.add(anchor.getAttribute("href"));
	        	}
	         
	         
	         List<WebElement> images  = driver.findElements(By.xpath("//div[@class='hotel-thumbnail']"));
			 
	         for ( WebElement anchor : images ) {
	        	    image.add(anchor.getAttribute("data-image"));
	        	}
				
	         	
	         for(int i = 0; i < hrefs.size(); i++) {
	        	 url.add(hrefs.get(i));
	         }
	     	map.put("list", list);
	     	map.put("url", url);
	     	map.put("image", image);
	     	
	    	Thread.sleep(1000);
	     	
	     	driver.close();

		}catch (Exception e) {
			System.out.println(e);

		}
		return map;
	}

	@Override
	public List<String> getUnsafeRegion( String country) throws Exception {
		
		StringBuilder unsafe = new StringBuilder("http://apis.data.go.kr/1262000/TravelWarningService/getTravelWarningList");
		StringBuilder contact = new StringBuilder("http://apis.data.go.kr/1262000/ContactService/getContactList");/*URL*/
		
		List<String> result = new ArrayList<>();
		
		Country countryCode = new Country();
		
		String ssn = null;
		String unsafeImg = null;
		
		try {
			unsafe.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+unsafeKey); /*Service Key*/
			unsafe.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("3", "UTF-8")); /*�� ������ ��� ��*/
			unsafe.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*������ ��ȣ*/
			
			contact.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+contactKey);
			contact.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("3", "UTF-8")); /*�� ������ ��� ��*/
			contact.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*������ ��ȣ*/
			
			if(country.matches(	".*[a-zA-Z].*")) {
					countryCode = sqlSession.selectOne("InformationMapper.findEnCountry", country);
				}else {
					countryCode= sqlSession.selectOne("InformationMapper.findKoCountry", country);
				}
			
			unsafe.append("&" + URLEncoder.encode("isoCode1","UTF-8") + "=" + URLEncoder.encode(countryCode.getCountryCode(), "UTF-8")); 
			contact.append("&" + URLEncoder.encode("isoCode1","UTF-8") + "=" + URLEncoder.encode(countryCode.getCountryCode(), "UTF-8")); 
			
			System.out.println(unsafe.toString());
			System.out.println(contact.toString());
       
        URL unsafeUrl = new URL(unsafe.toString());
        URL contactUrl = new URL(contact.toString());
        HttpURLConnection unsafeConn = (HttpURLConnection) unsafeUrl.openConnection();
        HttpURLConnection contactConn = (HttpURLConnection) contactUrl.openConnection();
        unsafeConn.setRequestMethod("GET");
        contactConn.setRequestMethod("GET");
        unsafeConn.setRequestProperty("Content-type", "application/json");
        contactConn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + unsafeConn.getResponseCode());
        System.out.println("Response code: " + contactConn.getResponseCode());
        BufferedReader unsafeRd;
        BufferedReader contactRd;
        
        if(unsafeConn.getResponseCode() >= 200 && unsafeConn.getResponseCode() <= 300) {
        	unsafeRd = new BufferedReader(new InputStreamReader(unsafeConn.getInputStream()));
        } else {
        	unsafeRd = new BufferedReader(new InputStreamReader(unsafeConn.getErrorStream()));
        }
        
        if(contactConn.getResponseCode() >= 200 && contactConn.getResponseCode() <= 300) {
        	contactRd = new BufferedReader(new InputStreamReader(contactConn.getInputStream()));
        } else {
        	contactRd = new BufferedReader(new InputStreamReader(contactConn.getErrorStream()));
        }
        
        
        StringBuilder unsafeSb = new StringBuilder();
        String unsafeLine;
        while ((unsafeLine = unsafeRd.readLine()) != null) {
        	unsafeSb.append(unsafeLine);
        }
        
        StringBuilder contactSb = new StringBuilder();
        String contactLine;
        while ((contactLine = contactRd.readLine()) != null) {
        	contactSb.append(contactLine);
        }
        
        unsafeRd.close();
        unsafeConn.disconnect();
        contactRd.close();
        contactConn.disconnect();
        
        String unsafeStr = URLDecoder.decode(unsafeSb.toString(), "UTF-8");
        String contactStr = URLDecoder.decode(contactSb.toString(), "UTF-8");
        
        String[] unsafeSplit = unsafeStr.split("imgUrl2");
        
        if(unsafeSplit.length<2) {
        	 unsafeImg ="none";
        }else{
        	 unsafeImg = unsafeSplit[1].replaceAll("\\>", "").replaceAll("\\</", "").replaceAll("amp;", "");
        }
        InputSource is=new InputSource();
        is.setCharacterStream(new StringReader(contactStr));
        Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
	   XPath  xpath = XPathFactory.newInstance().newXPath();
	   String expression = "//*/contact";
	   NodeList  cols = (NodeList) xpath.compile(expression).evaluate(document, XPathConstants.NODESET);
	   
	   for( int idx=0; idx<cols.getLength(); idx++ ){
	   		 ssn=cols.item(idx).getTextContent();
	   }
        
	   if(ssn!=null) {
			   if(ssn.contains("img")) {
				   ssn = ssn.replaceAll("style=\"", "style=\"max-width:100%; max-height:100%; ");
			   }else {
				   ssn = ssn+"";
			   }
	   }else {
		   ssn="������ �����ϴ� :(";
	   }
        result.add(ssn);
        result.add(unsafeImg);
        
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Map<String, List<String>> listNightLife(String city) throws Exception {
		
		System.setProperty("webdriver.chrome.driver",chromeDriver);
		
		DesiredCapabilities capabilities = DesiredCapabilities.chrome();
		capabilities.setCapability("marionette", true);
		
		List<String> context = new ArrayList<>();
		Map<String, List<String>> map = new HashMap<>();
		
		try {
			WebDriver driver = new ChromeDriver();
		driver.get("https://www.tripadvisor.co.kr/Search-q%ED%8C%8C%EB%A6%AC#&ssrc=a&o=0");
		Thread.sleep(1000);
		driver.findElement(By.id("taplc_global_nav_geopill_0")).click();//������ �Է�
		
		WebElement searchField = (new WebDriverWait(driver, 50))
				.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//div[@class='ui_overlay ui_flyout null ppr_rup ppr_dyn ppr_priv_global_nav_geopill']")));
		driver.findElement(By.xpath("//input[@class='ui_input_text']")).sendKeys(city);//���� �Է�
		searchField = (new WebDriverWait(driver, 50))
				.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//div[@class='selected']")));
		driver.findElement(By.xpath("//div[@class='selected']")).click(); //���� ���� ����
	
		
		searchField = (new WebDriverWait(driver, 50))
				.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//li[@class='attractions twoLines']")));
		
		driver.findElement(By.xpath("//li[@class='attractions twoLines']")).click();//�����Ÿ����� 
		driver.findElement(By.xpath("//div[@class='more reduced_height']")).click();//������ ����
		driver.findElement(By.cssSelector("a[href*='c20']")).click();//����Ʈ������ �ڵ� ����
		
		 WebDriverWait wait = new WebDriverWait(driver, 15); 
		 
		 wait.until(ExpectedConditions.titleContains("����Ʈ"));
			 
		 String text  = driver.findElement(By.id("AL_LIST_CONTAINER")).getText();
		 String[] str = text.split("\n");
			
			for(int i = 0 ; i<str.length; i++ ) {
				context.add(str[i]);
			}
			
			Iterator<String> iters = context.iterator();
			while (iters.hasNext()) {
				String s = iters.next();
			 
				if (s.contains("����")||s.contains("����")||s.contains("��")||s.contains("??")||s.contains("����")||s.contains("����")||s.length()<=1) {
					iters.remove();
				}
			}
			   Thread.sleep(500);
			
		 List<WebElement> images  = driver.findElements(By.tagName("img"));
        List<String> image = new ArrayList();
		 
		 for ( WebElement anchor : images ) {
        	    image.add(anchor.getAttribute("src"));
        	}
		 
		 System.out.println("return���̱���"+image.size());
			
			Iterator<String> iter = image.iterator();
			while (iter.hasNext()) {
				String s = iter.next();
			 
				if (s.contains("static")||s.contains("smartertravel")) {
					iter.remove();
				}
			}
			
			System.out.println("return������"+image.size());
		
		 
		 ///////////////////////////////////////////////////////������ ���� �� url ��������/////////////////////////////////////////////////////
		 List<WebElement> links = driver.findElements(By.xpath("//div[@class='listing_commerce']/a"));
		 
         System.out.println(links.size()); 
         
         List<String> hrefs = new ArrayList<String>();
         
         for ( WebElement anchor : links ) {
        	    hrefs.add(anchor.getAttribute("href"));
        	}
         	
         
         Thread.sleep(1000);
         
         driver.close();
         
         map.put("context", context);
         map.put("hrefs", hrefs);
         map.put("image", image);
		
		}catch (Exception e) {
			System.out.println(e);

		}
		
		
		return map;
	}

	@Override
	public  Map<String, List<String>> getNightLifeDetail(NightLife nightLife) throws Exception {
		
		System.setProperty("webdriver.chrome.driver",chromeDriver);
		
		DesiredCapabilities capabilities = DesiredCapabilities.chrome();
		
		capabilities.setCapability("marionette", true);
		List<String> context = new ArrayList<>();
		List<String> google = new ArrayList<>();
		List<String> infom = new ArrayList<>();
		Map<String, List<String>> map = new HashMap<>();
		
		try {
			WebDriver driver = new ChromeDriver();
		
		driver.get(nightLife.getDetailUrl());//��������
		
		WebElement searchField = (new WebDriverWait(driver, 50))
				.until(ExpectedConditions.presenceOfElementLocated(By.id("taplc_location_detail_above_the_fold_attractions_0")));//��ٸ���

		 String text  = driver.findElement(By.id("taplc_location_detail_header_attractions_0")).getText();
			
		 String[] strs = text.split("\n");
			
			for(int i = 0 ; i<strs.length; i++ ) {
				
					if(strs[i].contains("�� �����Ͻ��� �����ϰ� ��Ű���?")) {
						strs[i]=strs[i].replaceAll("�� �����Ͻ��� �����ϰ� ��Ű���?", "").replaceAll("\\?", "");
					}
				context.add(strs[i]);
			}
			
			Iterator<String> iters = context.iterator();
			while (iters.hasNext()) {
				String s = iters.next();
			 
				if (s.contains("������Ʈ")||s.contains("����")||s.contains("�̸���")||s.contains("�����ϱ�")||s.contains("����")||s.contains("����")||s.length()<=1) {
					iters.remove();
				}
			}
			
			String detail  = driver.findElement(By.xpath("//div[@id='taplc_attraction_detail_listing_0']")).getText();
			
			if(detail.contains("��ġ")) {
				detail = detail.replaceAll("��ġ", "��ġ : ");
			}
			if(detail.contains("����ó")) {
				detail = detail.replaceAll("����ó", " \n ����ó : ").replaceAll("������Ʈ", "");
			}
			if(detail.contains("�� ������ ���� �����ϱ�")) {
				detail = detail.replaceAll("�� ������ ���� �����ϱ�", "");
			}
			
			infom.add(detail);
		
		
		List<WebElement> list = driver.findElements(By.xpath("//span[@class='imgWrap '] /img"));
		
		List<String> hrefs = new ArrayList<String>();
	      
	      for ( WebElement anchor : list ) {
	     	    hrefs.add(anchor.getAttribute("src"));
	     	}
	      
	      Iterator<String> iter = hrefs.iterator();
			while (iter.hasNext()) {
				String s = iter.next();
			 
				if (s.contains("static")) {
					iter.remove();
				}
			}
	      	
	      for(int i = 0; i < hrefs.size(); i++) {
	     	 System.out.println(hrefs.get(i));
	      }
	         
			///////////////////////////////////////////////////////�������� ���� ��������/////////////////////////////////////////////////////
	      Thread.sleep(1000);
	      WebElement str = driver.findElement(By.xpath("//div[@class='prw_rup prw_common_static_map_no_style staticMap']//img"));
			
			System.out.println("+++++++++++\n\n"+str.getAttribute("src")+"\n\n+++++++++++\n\n");
			google.add(str.getAttribute("src"));
			
			
			map.put("google", google);
			map.put("hrefs", hrefs);
			map.put("context", context);
			map.put("infom", infom);
			
			Thread.sleep(1000);
			
			driver.close();
			
		}catch (Exception e) {
			System.out.println(e);
		}
		return map;
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
	
	@Override
	public List<String> findCountry(String country) throws Exception {
		
		String str = country.trim();
		
		List<String> item = new ArrayList<String>();
		
		if(str.matches(	".*[a-zA-Z].*")) {
			
			List<Country> list = sqlSession.selectList("InformationMapper.getEnCountry", str);
			
			for(int i = 0 ; i<list.size(); i++) {
				item.add(list.get(i).getCountryEnName());
				}
			
			}else {
				
			List<Country> list = sqlSession.selectList("InformationMapper.getKoCountry", str);
			
			for(int i = 0 ; i<list.size(); i++) {
				item.add(list.get(i).getCountryKoName());
				}
			
			}
		return item;
	}
	
	@Override
	public List<String> findContinent(String keyword) throws Exception {
		
		String str = keyword.trim();
		
		List<String> item = new ArrayList<String>();
		
		if(str.matches(	".*[a-zA-Z].*")) {
			
			List<Continent> list = sqlSession.selectList("InformationMapper.getEnContinent", str);
			
			for(int i = 0 ; i<list.size(); i++) {
				item.add(list.get(i).getContinentEnName());
				}
			
			}else {
				
			List<Continent> list = sqlSession.selectList("InformationMapper.getKoContinent", str);
			
			for(int i = 0 ; i<list.size(); i++) {
				item.add(list.get(i).getContinentKoName());
				}
			
			}
		return item;
	}



}
