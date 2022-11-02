package com.finaldemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finaldemo.model.FollowRepository;
import com.finaldemo.model.Pets;
import com.finaldemo.model.PetsRepository;
import com.finaldemo.model.PostImg;
import com.finaldemo.model.PostImgRepository;
import com.finaldemo.model.Posts;
import com.finaldemo.model.PostsRepository;
import com.finaldemo.model.Users;
import com.finaldemo.model.UsersRepository;

@Service
@Transactional
public class TimmyService {
	
	@Autowired
	private UsersRepository uDao;
	
	@Autowired
	private PostsRepository pDao;
	
	@Autowired
	private PetsRepository peDao;
	
	@Autowired
	private FollowRepository fDao;
	
	@Autowired
	private PostImgRepository piDao;
	
	public Users getUserById(Integer id) {
		return uDao.findById(id).get();
	}
	
	public List<Posts> getPostsByUserId(Integer id){
		Users u1 = uDao.findById(id).get();
		List<Posts> posts = pDao.findPostsByUserId(u1.getUserId());
		return posts;
	}
	
	public Posts getPostById(Integer id) {
		return pDao.findById(id).get();
	}
	
	public PostImg getPostImgById(Integer id) {
		return piDao.findById(id).get();
	}
	
	public List<PostImg> getAllPostImg(){
		return piDao.findAll();
	}
	
	public List<PostImg> getPostImgListByPostId(Integer id){
		return piDao.findPostImgsByPostId(id);
	}
	
	public List<PostImg> getPostImgListByPostIdOrderById(Integer postId){
		return piDao.findByFk_post_idOrderByPostImgIdDesc(postId);
	}
	
	public Pets getPetByPetId(Integer id) {
		return peDao.findById(id).get();
	}
	
	public List<Users> getUsersByEmail(String email){
		return uDao.findByEmail(email);
	}
	
	public Users insertNewUser(Users user) {
		return uDao.save(user);
	}
	
	public Posts insertNewPost(Posts post) {
		return pDao.save(post);
	}
	
	public PostImg savePostImg(PostImg postImg) {
		return piDao.save(postImg);
	}
	
	public Pets savePet(Pets pet) {
		return peDao.save(pet);
	}
	
	public void deleteAllPost() {
		pDao.deleteAll();
	}
	
	public void deleteAllUser() {
		uDao.deleteAll();
	}

	public boolean checkEmail(String email) {
		List<Users> userList = uDao.findAll();
		for (Users user:userList) {
			if (email.equals(user.getEmail()) && user.getEmail() != null) {
				return false;
			}
		}
		System.out.println("here1");
		return true;
	}
	
	public Users checkLogin(String email, String password) {
		return uDao.selectUserByNameAndPwd(email, password);
	}
	
	public void deletePetById(Integer id) {
		peDao.deleteById(id);
	}
	
	public void deleteFollowRelation(Integer fansId, Integer followId) {
		fDao.deleteFollowByFansIdAndFollowsId(fansId, followId);
	}
	
	public void deletePostImgById(Integer id) {
		piDao.deleteById(id);
	}
}
