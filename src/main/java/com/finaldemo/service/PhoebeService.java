package com.finaldemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finaldemo.model.Comments;
import com.finaldemo.model.CommentsRepository;
import com.finaldemo.model.FollowRepository;
import com.finaldemo.model.LikePost;
import com.finaldemo.model.LikePostRepository;
import com.finaldemo.model.Notification;
import com.finaldemo.model.NotificationRepository;
import com.finaldemo.model.PostImg;
import com.finaldemo.model.PostImgRepository;
import com.finaldemo.model.Posts;
import com.finaldemo.model.PostsRepository;
import com.finaldemo.model.Users;
import com.finaldemo.model.UsersRepository;

@Service
@Transactional
public class PhoebeService {

	// UsersService
	@Autowired
	private UsersRepository UsersRepository;

	// UserService
	public void signUp(Users user) {
		user.setPhotoPath("/img/userimg/none.png");
		UsersRepository.save(user);
	}

	public Users checkLogin(String email, String password) {
		return UsersRepository.selectUserByNameAndPwd(email, password);
	}
	
	public Users getUserById(Integer id) {
		return UsersRepository.findById(id).get();
	}

	// PostService
	@Autowired
	private PostsRepository PostsRepository;
	@Autowired
	private PostImgRepository PostImgRepository;

	public List<Posts> getPostsByUserId(Integer userId) {
		return PostsRepository.findPostsByUserId(userId);
	}
	
	public List<Posts> getPostForFansByUserId(Integer userId) {
		return PostsRepository.getPostForFansByUserId(userId);
	}
	
	public List<Posts> getPostsByWhoCanSeeIt(Integer whoCanSeeIt) {
		return PostsRepository.getPostsByWhoCanSeeIt(whoCanSeeIt);
	}

	public List<PostImg> getPostImgsByPostId(Integer postId) {
		return PostImgRepository.findPostImgsByPostId(postId);
	}

	public Posts getPostByPostId(Integer postId) {
		return PostsRepository.findPostByPostId(postId);
	}

	public Posts addPost(Posts newPost) {
		return PostsRepository.save(newPost);
	}

	public void addPostImg(PostImg newImg) {
		PostImgRepository.addPostImgs(newImg.getPost().getPostId(), newImg.getPostImgPath());
	}

	public void editPost(Posts newPost) {
		PostsRepository.save(newPost);
	}

	public void deleteExtraImgs(Integer postId) {
		PostImgRepository.deleteImgByPostId(postId);
	}

	public void movePostToTrash(Integer whoCanSeeIt, Integer postId) {
		PostsRepository.changeWhoCanSeeItById(whoCanSeeIt, postId);
	}
	
	public void reportPost(Integer isReport, Integer postId) {
		PostsRepository.reportPost(isReport, postId);
	}

	public List<Users> searchPeople(String search) {
		return UsersRepository.searchPeopleByNickName(search);
	}
	
	public List<Posts> searchPost(String search) {
		return PostsRepository.searchPostsByText(search);
	}
	
	// Follow
	@Autowired
	private FollowRepository FollowRepository;
	
	public List<Integer> findUpId(Integer fanId){
		return FollowRepository.findUpId(fanId);
	}
	
	public List<Integer> findfans(Integer upId){
		return FollowRepository.findfans(upId);
	}
	
	// Notification
	@Autowired
	private NotificationRepository NotificationRepository;
	
	public void addNotification(Notification newNotification) {
		NotificationRepository.save(newNotification);
	}
	
	public List<Notification> findNotificationByUserId(Integer loginUserId){
		return NotificationRepository.findNotificationByUserId(loginUserId);
	}
	
	// LikeService
	@Autowired
	private LikePostRepository LikePostRepository;
	
	public LikePost findLikedPost(Integer userId, Integer postId) {
		return LikePostRepository.findLikedPost(userId, postId);
	}
	
	public void deleteLikedPost(LikePost LikePost) {
		LikePostRepository.delete(LikePost);
	}
	
	public void saveLikedPost(LikePost LikePost) {
		LikePostRepository.save(LikePost);
	}
	
	public List<LikePost> findLikedPostByPostId(Integer postId){
		return LikePostRepository.findLikedPostByPostId(postId);
	}
	
	// CommentsService
	@Autowired 
	private CommentsRepository CommentsRepository;
	
	public Comments addComment(Comments newComment) {
		return CommentsRepository.save(newComment);
	}
	
	public void deleteComment(Integer commentId) {
		CommentsRepository.deleteById(commentId);
	}
	
}
