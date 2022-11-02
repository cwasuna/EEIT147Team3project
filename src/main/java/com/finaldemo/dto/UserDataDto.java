package com.finaldemo.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class UserDataDto {
	
	@JsonProperty("value")
	private String value;
	
	@JsonProperty("header")
	private String header;
	
	public UserDataDto() {
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}
	
}
