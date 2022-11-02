package com.finaldemo.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class SharePostDto {
	
	@JsonProperty("id")
	private String id;
	
	@JsonProperty("whoShare")
	private String whoShare;
	
	@JsonProperty("saySomeThing")
	private String saySomeThing;
	
	public SharePostDto() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWhoShare() {
		return whoShare;
	}

	public void setWhoShare(String whoShare) {
		this.whoShare = whoShare;
	}

	public String getSaySomeThing() {
		return saySomeThing;
	}

	public void setSaySomeThing(String saySomeThing) {
		this.saySomeThing = saySomeThing;
	}

}
