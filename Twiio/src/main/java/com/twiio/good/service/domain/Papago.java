package com.twiio.good.service.domain;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.json.simple.JSONObject;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Papago {
	
	private MessagePapago messagePapago;
	private String translate;
	private String papagoCompareCountry;
	private String papagoMyCountry; 
	private String compare;
	private int dailyPlanNo;

	public Papago() {
		// TODO Auto-generated constructor stub
	}

	public MessagePapago getMessage() {
		return messagePapago;
	}

	public void setMessage(MessagePapago message) {
		this.messagePapago = message;
	}

	public String getTranslate() {
		return translate;
	}

	public void setTranslate(String translate) {
		this.translate = translate;
	}

	public String getPapagoCompareCountry() {
		return papagoCompareCountry;
	}

	public void setPapagoCompareCountry(String papagoCompareCountry) {
		this.papagoCompareCountry = papagoCompareCountry;
	}

	public String getPapagoMyCountry() {
		return papagoMyCountry;
	}

	public void setPapagoMyCountry(String papagoMyCountry) {
		this.papagoMyCountry = papagoMyCountry;
	}

	public String getCompare() {
		return compare;
	}

	public void setCompare(String compare) {
		this.compare = compare;
	}

	public int getDailyPlanNo() {
		return dailyPlanNo;
	}

	public void setDailyPlanNo(int dailyPlanNo) {
		this.dailyPlanNo = dailyPlanNo;
	}	

}