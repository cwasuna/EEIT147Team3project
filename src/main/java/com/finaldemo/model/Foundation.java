package com.finaldemo.model;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Foundation")
public class Foundation {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer foundationId;

	private Integer foundationMoney;

	private String foundationGmail;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "foundation", cascade = CascadeType.ALL)
	private List<Products> products = new ArrayList<Products>();

	@OneToOne(mappedBy = "foundation")
	private Users user;

	public Foundation() {
	}

	public List<Products> getProducts() {
		return products;
	}

	public void setProducts(List<Products> products) {
		this.products = products;
	}

	public Integer getFoundationId() {
		return foundationId;
	}

	public Integer getFoundationMoney() {
		return foundationMoney;
	}

	public String getFoundationGmail() {
		return foundationGmail;
	}

	public void setFoundationId(Integer foundationId) {
		this.foundationId = foundationId;
	}

	public void setFoundationMoney(Integer foundationMoney) {
		this.foundationMoney = foundationMoney;
	}

	public void setFoundationGmail(String foundationGmail) {
		this.foundationGmail = foundationGmail;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Foundation [foundationId=");
		builder.append(foundationId);
		builder.append(", foundationMoney=");
		builder.append(foundationMoney);
		builder.append(", foundationGmail=");
		builder.append(foundationGmail);
		builder.append(", products=");
		builder.append(products);
		builder.append("]");
		return builder.toString();
	}

}
