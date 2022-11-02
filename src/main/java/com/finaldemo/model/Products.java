package com.finaldemo.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Products")
public class Products {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productId;

	private String productName;

	private Integer productPrice;

	private String productImg;

	private Integer buyCount;

	private String productContext;

	private Date productDate;

	private Integer productStatus;

	@ManyToOne(fetch = FetchType.EAGER, targetEntity = Foundation.class)
	@JoinColumn(name = "fk_foundation_id", referencedColumnName = "foundationId")
	private Foundation foundation;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "products", cascade = CascadeType.ALL)
	private List<OrderDetail> orderDetail = new ArrayList<OrderDetail>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "products", cascade = CascadeType.ALL)
	private List<ShoppingCar> shoppingCar = new ArrayList<ShoppingCar>();

	public Products() {
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Products [productId=");
		builder.append(productId);
		builder.append(", productName=");
		builder.append(productName);
		builder.append(", productPrice=");
		builder.append(productPrice);
		builder.append(", productImg=");
		builder.append(productImg);
		builder.append(", buyCount=");
		builder.append(buyCount);
		builder.append(", productContext=");
		builder.append(productContext);
		builder.append(", productDate=");
		builder.append(productDate);
		builder.append("]");
		return builder.toString();
	}

	public Integer getProductId() {
		return productId;
	}

	public String getProductName() {
		return productName;
	}

	public Integer getProductPrice() {
		return productPrice;
	}

	public String getProductImg() {
		return productImg;
	}

	public Integer getBuyCount() {
		return buyCount;
	}

	public String getProductContext() {
		return productContext;
	}

	public Date getProductDate() {
		return productDate;
	}

	public Foundation getFoundation() {
		return foundation;
	}

	public void setFoundation(Foundation foundation) {
		this.foundation = foundation;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}

	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}

	public void setBuyCount(Integer buyCount) {
		this.buyCount = buyCount;
	}

	public void setProductContext(String productContext) {
		this.productContext = productContext;
	}

	public void setProductDate(Date productDate) {
		this.productDate = productDate;
	}

	public List<OrderDetail> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(List<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}

	public List<ShoppingCar> getShoppingCar() {
		return shoppingCar;
	}

	public void setShoppingCar(List<ShoppingCar> shoppingCar) {
		this.shoppingCar = shoppingCar;
	}

	public Integer getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(Integer productStatus) {
		this.productStatus = productStatus;
	}

}
