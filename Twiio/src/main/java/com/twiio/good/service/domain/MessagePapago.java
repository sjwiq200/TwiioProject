package com.twiio.good.service.domain;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class MessagePapago {

	private Result result;
	
	public MessagePapago() {
		// TODO Auto-generated constructor stub
	}
	
	public Result getResult() {
		return result;
	}
	public void setResult(Result result) {
		this.result = result;
	}

}