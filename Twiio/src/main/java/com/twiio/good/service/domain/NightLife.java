package com.twiio.good.service.domain;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class NightLife {
	
	private String detailUrl;
	private String city;

	public NightLife() {
	}

	public String getDetailUrl() {
		return detailUrl;
	}

	public void setDetailUrl(String detailUrl) {
		this.detailUrl = detailUrl;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Override
	public String toString() {
		return "NightLife [detailUrl=" + detailUrl + ", city=" + city + "]";
	}
	

}
