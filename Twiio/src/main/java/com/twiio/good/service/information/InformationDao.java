package com.twiio.good.service.information;

import java.util.List;

import com.twiio.good.service.domain.Currency;

public interface InformationDao {

	public  List<Currency> getCurrency() throws Exception;
	
	public  List getFlight() throws Exception;
	
	public  List  getHotel() throws Exception;
	
	public  List getUnsafeRegion() throws Exception;
	
	public  List getWeather() throws Exception;
	
	public  List listNightLife() throws Exception;
	
	public  List getNightLifeDetail() throws Exception;
	
}
