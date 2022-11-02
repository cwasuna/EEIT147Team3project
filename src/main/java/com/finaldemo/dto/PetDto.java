package com.finaldemo.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class PetDto {
	
	@JsonProperty("id")
	private String id;
	
	@JsonProperty("file")
	private String file;
	
	@JsonProperty("name")
	private String name;
	
	@JsonProperty("birthday")
	private String birthday;
	
	@JsonProperty("gender")
	private String gender;
	
	@JsonProperty("introduction")
	private String introduction;
	
	public PetDto() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	
}
