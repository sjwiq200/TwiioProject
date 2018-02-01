package com.twiio.good.service.domain;


public class Continent {


	private int continentNo;
	private String continentKoName; 
	private String continentEnName; 
	
	public Continent() {
	}

	public int getContinentNo() {
		return continentNo;
	}

	public void setContinentNo(int continentNo) {
		this.continentNo = continentNo;
	}

	public String getContinentKoName() {
		return continentKoName;
	}

	public void setContinentKoName(String continentKoName) {
		this.continentKoName = continentKoName;
	}

	public String getContinentEnName() {
		return continentEnName;
	}

	public void setContinentEnName(String continentEnName) {
		this.continentEnName = continentEnName;
	}

	@Override
	public String toString() {
		return "Continent [continenttNo=" + continentNo + ", continentKoName=" + continentKoName + ", continenEnName="
				+ continentEnName + "]";
	}

		

}
