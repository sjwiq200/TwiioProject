package com.twiio.good.service.information.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.twiio.good.service.domain.City;
import com.twiio.good.service.domain.Currency;
import com.twiio.good.service.domain.Flight;
import com.twiio.good.service.domain.Hotel;
import com.twiio.good.service.information.InformationDao;
import com.twiio.good.service.information.InformationService;


@Service("informationServiceImpl")
public class InformationServiceImpl implements InformationService {

	@Autowired
	@Qualifier("informationDaoImpl")
	private InformationDao informationDao;
	public void setInformationDao(InformationDao informationDao) {
		this.informationDao = informationDao;
	}
	
	public InformationServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public List<Currency> addCurrency() throws Exception {
		return informationDao.addCurrency();
	}
	
	@Override
	public Double getCurrency(String country) throws Exception {
		return informationDao.getCurrency(country);
	}
	
	@Override
	public List<String> findCity(String city) throws Exception {
		return informationDao.findCity(city);
	}
	
	@Override
	public  Map<String,Object>  searchNowWeather(String cityName) throws Exception {
		return informationDao.searchNowWeather(cityName);
	}

	
	@Override
	public Map<Object, String[]> searchHistoryWeather( String cityName) throws Exception {
		return informationDao.searchHistoryWeather(cityName);
	}
	
	
	@Override
	public Map<String, List<String>> getFlightList(Flight flight) throws Exception {
		return informationDao.getFlightList(flight);
	}
	
	@Override
	public Map<String, List<String>> getFlightListRetrun(String url, String num) throws Exception {
		return informationDao.getFlightListRetrun( url,  num);
	}

	@Override
	public Map<String, List<String>> getHotel(Hotel hotel) throws Exception {
		return informationDao.getHotel(hotel);
	}

	@Override
	public List getUnsafeRegion() throws Exception {
		return informationDao.getUnsafeRegion();
	}

	@Override
	public List listNightLife() throws Exception {
		return informationDao.listNightLife();
	}

	@Override
	public List getNightLifeDetail() throws Exception {
		return informationDao.getNightLifeDetail();
	}


}
