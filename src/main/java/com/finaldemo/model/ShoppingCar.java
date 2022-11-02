package com.finaldemo.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name="ShoppingCar")
public class ShoppingCar {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer shoppingCarId;
	
	private Integer quantity;
	
	private Integer unitPrice;
	
	private Integer totalPrice;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_user_id")
	private Users shopUser;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_product_id")
	private Products products;


	public ShoppingCar() {
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ShoppingCar [shoppingCarId=");
		builder.append(shoppingCarId);
		builder.append(", quantity=");
		builder.append(quantity);
		builder.append(", unitPrice=");
		builder.append(unitPrice);
		builder.append(", totalPrice=");
		builder.append(totalPrice);
		builder.append(", shopUser=");
		builder.append(shopUser);
		builder.append(", products=");
		builder.append(products);
		builder.append("]");
		return builder.toString();
	}


	public Integer getShoppingCarId() {
		return shoppingCarId;
	}


	public void setShoppingCarId(Integer shoppingCarId) {
		this.shoppingCarId = shoppingCarId;
	}


	public Integer getQuantity() {
		return quantity;
	}


	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}


	public Integer getUnitPrice() {
		return unitPrice;
	}


	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}


	public Integer getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}


	public Users getShopUser() {
		return shopUser;
	}


	public void setShopUser(Users shopUser) {
		this.shopUser = shopUser;
	}


	public Products getProducts() {
		return products;
	}


	public void setProducts(Products products) {
		this.products = products;
	}

}
