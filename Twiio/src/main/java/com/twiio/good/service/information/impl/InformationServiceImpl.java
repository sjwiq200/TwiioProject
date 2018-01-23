package com.twiio.good.service.information.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.twiio.good.service.domain.Currency;
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
	public List<Currency> getCurrency() throws Exception {
		return informationDao.getCurrency();
	}

	@Override
	public List getFlight() throws Exception {
		return informationDao.getFlight();
	}

	@Override
	public List getHotel() throws Exception {
		return informationDao.getHotel();
	}

	@Override
	public List getUnsafeRegion() throws Exception {
		return informationDao.getUnsafeRegion();
	}

	@Override
	public List getWeather() throws Exception {
		return informationDao.getWeather();
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
