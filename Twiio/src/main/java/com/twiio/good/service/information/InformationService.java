package com.twiio.good.service.information;

import java.util.List;
import java.util.Map;

import com.twiio.good.service.domain.City;
import com.twiio.good.service.domain.Currency;

public interface InformationService {
	
	
	public  List<Currency> addCurrency() throws Exception;
	
	public  Double getCurrency(String country) throws Exception;
	
	public List<String> findCity(String city) throws Exception;
	
	public  Map<String,Object>  searchNowWeather(String cityName) throws Exception;
	
	public Map<Object, String[]> searchHistoryWeather( String cityName) throws Exception;
	
	public  List getFlight() throws Exception;
	
	public  List  getHotel() throws Exception;
	
	public  List getUnsafeRegion() throws Exception;

	public  List listNightLife() throws Exception;
	
	public  List getNightLifeDetail() throws Exception;
	

}
