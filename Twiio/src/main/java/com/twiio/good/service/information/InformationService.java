package com.twiio.good.service.information;

import java.util.List;
import java.util.Map;

import com.twiio.good.service.domain.City;
import com.twiio.good.service.domain.Currency;
import com.twiio.good.service.domain.Flight;
import com.twiio.good.service.domain.Hotel;
import com.twiio.good.service.domain.NightLife;

public interface InformationService {
	
	
	public  List<Currency> addCurrency() throws Exception;
	
	public  Double getCurrency(String country) throws Exception;
	
	public List<String> findCity(String city) throws Exception;
	
	public List<String> findCountry(String city) throws Exception;
	
	public List<String> findContinent(String keyword) throws Exception;
	
	public  Map<String,List> searchNowWeather(String cityName) throws Exception;
	
	public Map<Object, String[]> searchHistoryWeather( String cityName) throws Exception;
	
	public  Map<String, List<String>> getFlightList(Flight flight) throws Exception;
	
	public Map<String, List<String>> getFlightListRetrun(String url, String num) throws Exception;
	
	public List<String> getFlightListUrl(Flight flight) throws Exception;
	
	public  Map<String, List<String>>  getHotel(Hotel hotel) throws Exception;
	
	public  List<String> getUnsafeRegion( String country) throws Exception;

	public  Map<String, List<String>> listNightLife(String city) throws Exception;
	
	public   Map<String, List<String>> getNightLifeDetail(NightLife nightLife) throws Exception;
	

}
