package com.finaldemo.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="OrderDetail")
public class OrderDetail {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderDetailId;
	
	private Integer orderSubtotal;
	
	private Integer orderQuantity;
	
	private Integer totalPrice;
	
	@ManyToOne(fetch = FetchType.EAGER, targetEntity = Orders.class)
	@JoinColumn(name="fk_order_id", referencedColumnName = "orderId")
	private Orders orders;
	
	@ManyToOne(fetch = FetchType.EAGER, targetEntity = Products.class)
	@JoinColumn(name="fk_product_id", referencedColumnName = "productId")
	private Products products;
	
	public OrderDetail() {
	}

	public Integer getOrderDetailId() {
		return orderDetailId;
	}

	public Integer getOrderSubtotal() {
		return orderSubtotal;
	}

	public Integer getOrderQuantity() {
		return orderQuantity;
	}

	public Integer getTotalPrice() {
		return totalPrice;
	}

	public Orders getOrders() {
		return orders;
	}

	public Products getProducts() {
		return products;
	}

	public void setOrderDetailId(Integer orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	public void setOrderSubtotal(Integer orderSubtotal) {
		this.orderSubtotal = orderSubtotal;
	}

	public void setOrderQuantity(Integer orderQuantity) {
		this.orderQuantity = orderQuantity;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public void setProducts(Products products) {
		this.products = products;
	}
	
	
	
}
