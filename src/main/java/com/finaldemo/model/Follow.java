package com.finaldemo.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Follow")
public class Follow {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne(fetch = FetchType.EAGER, targetEntity = Users.class)
	@JoinColumn(name="fk_user_fans_id", referencedColumnName = "userId")
	private Users fans;
	
	@ManyToOne(fetch = FetchType.EAGER, targetEntity = Users.class)
	@JoinColumn(name="fk_user_follow_id", referencedColumnName = "userId")
	private Users follow;
	
	public Follow() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public Users getFans() {
		return fans;
	}

	public void setFans(Users fans) {
		this.fans = fans;
	}

	public Users getFollow() {
		return follow;
	}

	public void setFollow(Users follow) {
		this.follow = follow;
	}
	
}
