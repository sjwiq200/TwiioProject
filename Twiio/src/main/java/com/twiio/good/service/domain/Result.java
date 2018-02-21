package com.twiio.good.service.domain;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Result {

	private String translatedText;
	private String tarLangType;
	private String srcLangType;
	
	public Result() {
		// TODO Auto-generated constructor stub
	}
	
	public String getTranslatedText() {
		return translatedText;
	}
	public void setTranslatedText(String translatedText) {
		this.translatedText = translatedText;
	}
	public String getTarLangType() {
		return tarLangType;
	}
	public void setTarLangType(String tarLangType) {
		this.tarLangType = tarLangType;
	}
	public String getSrcLangType() {
		return srcLangType;
	}
	public void setSrcLangType(String srcLangType) {
		this.srcLangType = srcLangType;
	}

}