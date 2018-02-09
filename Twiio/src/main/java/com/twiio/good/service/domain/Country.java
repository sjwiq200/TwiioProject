package com.twiio.good.service.domain;

public class Country {
	
	private int countryNo;
	private String countryKoName;
	private String countryEnName;
	private String countryCode;

	public Country() {
		// TODO Auto-generated constructor stub
	}

	public int getCountryNo() {
		return countryNo;
	}

	public void setCountryNo(int countryNo) {
		this.countryNo = countryNo;
	}

	public String getCountryKoName() {
		return countryKoName;
	}

	public void setCountryKoName(String countryKoName) {
		this.countryKoName = countryKoName;
	}

	public String getCountryEnName() {
		return countryEnName;
	}

	public void setCountryEnName(String countryEnName) {
		this.countryEnName = countryEnName;
	}
	
	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	@Override
	public String toString() {
		return "Country [countryNo=" + countryNo + ", countryKoName=" + countryKoName + ", countryEnName="
				+ countryEnName + ", countryCode=" + countryCode + "]";
	}

	
}
