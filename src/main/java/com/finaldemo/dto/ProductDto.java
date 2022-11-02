package com.finaldemo.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ProductDto {
	
	@JsonProperty("productId")
	private String productId;
	
	@JsonProperty("productName")
	private String productName;
	
	@JsonProperty("productPrice")
	private String productPrice;
	
	@JsonProperty("description")
	private String description;
	
	public ProductDto() {
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}
	
}
