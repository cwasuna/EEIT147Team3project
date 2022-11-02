package com.finaldemo.model;

import java.util.Date;
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
import javax.persistence.Table;

@Entity
@Table(name="Posts")
public class Posts {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer postId;
	
	private String postText;
	
	private String postVideoSrc;
	
	private Integer whoCanSeeIt;
	
	private Date postTime;
	
	private Integer whoShare;
	
	private Integer postLike;
	
	private Integer isReport;
	
	private Integer isBanned;
	
	@ManyToOne(fetch = FetchType.EAGER, targetEntity = Users.class)
	@JoinColumn(name = "fk_user_id", referencedColumnName = "userId")
	private Users postUser;
	
	@ManyToOne(fetch = FetchType.EAGER, targetEntity = Posts.class)
	@JoinColumn(name = "fk_post_id", referencedColumnName = "postId")
	private Posts postBeShared;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "post",cascade = CascadeType.ALL)
	private Set<Comments> Comments = new LinkedHashSet<Comments>();
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "post",cascade = CascadeType.ALL)
	private Set<PostImg> PostImg = new LinkedHashSet<PostImg>();
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "likedPost",cascade = CascadeType.ALL)
	private Set<LikePost> LikePost = new LinkedHashSet<LikePost>();
	
	public Posts() {
	}

	public Integer getPostId() {
		return postId;
	}

	public void setPostId(Integer postId) {
		this.postId = postId;
	}

	public String getPostText() {
		return postText;
	}

	public void setPostText(String postText) {
		this.postText = postText;
	}

	public String getPostVideoSrc() {
		return postVideoSrc;
	}

	public void setPostVideoSrc(String postVideoSrc) {
		this.postVideoSrc = postVideoSrc;
	}

	public Integer getWhoCanSeeIt() {
		return whoCanSeeIt;
	}

	public void setWhoCanSeeIt(Integer whoCanSeeIt) {
		this.whoCanSeeIt = whoCanSeeIt;
	}

	public Date getPostTime() {
		return postTime;
	}

	public void setPostTime(Date postTime) {
		this.postTime = postTime;
	}

	public Integer getWhoShare() {
		return whoShare;
	}

	public void setWhoShare(Integer whoShare) {
		this.whoShare = whoShare;
	}

	public Integer getPostLike() {
		return postLike;
	}

	public void setPostLike(Integer postLike) {
		this.postLike = postLike;
	}

	public Integer getIsReport() {
		return isReport;
	}

	public void setIsReport(Integer isReport) {
		this.isReport = isReport;
	}

	public Users getPostUser() {
		return postUser;
	}

	public void setPostUser(Users postUser) {
		this.postUser = postUser;
	}

	public Set<Comments> getComments() {
		return Comments;
	}

	public void setComments(Set<Comments> comments) {
		Comments = comments;
	}

	public Set<PostImg> getPostImg() {
		return PostImg;
	}

	public void setPostImg(Set<PostImg> postImg) {
		PostImg = postImg;
	}

	public Integer getIsBanned() {
		return isBanned;
	}

	public Set<LikePost> getLikePost() {
		return LikePost;
	}

	public void setIsBanned(Integer isBanned) {
		this.isBanned = isBanned;
	}

	public void setLikePost(Set<LikePost> likePost) {
		LikePost = likePost;
	}

	public Posts getPostBeShared() {
		return postBeShared;
	}

	public void setPostBeShared(Posts postBeShared) {
		this.postBeShared = postBeShared;
	}
	
}
