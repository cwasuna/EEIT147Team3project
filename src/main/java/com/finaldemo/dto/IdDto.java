package com.finaldemo.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class IdDto {
	
	@JsonProperty("id")
	private String id;
	
	public IdDto() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
