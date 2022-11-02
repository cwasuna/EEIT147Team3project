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
@Table(name="LikePost")
public class LikePost {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne(fetch = FetchType.EAGER, targetEntity = Users.class)
	@JoinColumn(name="fk_user_id", referencedColumnName = "userId")
	private Users user;
	
	@ManyToOne(fetch = FetchType.EAGER, targetEntity = Posts.class)
	@JoinColumn(name="fk_post_id", referencedColumnName = "postId")
	private Posts likedPost;
	
	public LikePost() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Posts getLikedPost() {
		return likedPost;
	}

	public void setLikedPost(Posts likedPost) {
		this.likedPost = likedPost;
	}
	
}
