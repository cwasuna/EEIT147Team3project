package com.finaldemo.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ImageDto {
	
	@JsonProperty("id")
	private Integer id;
	
	@JsonProperty("img64")
	private String img64;
	
	@JsonProperty("type")
	private String type;
	
	public ImageDto() {
	}

	public String getImg64() {
		return img64;
	}

	public void setImg64(String img64) {
		this.img64 = img64;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

}
