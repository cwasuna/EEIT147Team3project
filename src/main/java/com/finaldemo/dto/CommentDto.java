package com.finaldemo.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CommentDto {
	
	@JsonProperty("postId")
	private String postId;
	
	@JsonProperty("commentText")
	private String commentText;
	
	public CommentDto() {
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getCommentText() {
		return commentText;
	}

	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}

}
