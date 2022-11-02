package com.finaldemo.controller.timmy;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finaldemo.model.Pets;
import com.finaldemo.model.Posts;
import com.finaldemo.model.Users;
import com.finaldemo.service.TimmyService;

@Controller
public class ActionController {

	@Autowired
	private TimmyService service;

	@PostMapping("/timmy/NewUserPage")
	@ResponseBody
	public Users newUserTest() {
		Calendar c = Calendar.getInstance();
		c.set(1997, 10, 14);
		Users u1 = new Users();
		u1.setNickName("jenny");
		u1.setPassword("1234");
		u1.setAddress("台南市永康區大橋兩百街100號");
		u1.setBirthday(c.getTime());
		u1.setCategory(3);
		u1.setEmail("timmy860930@gmail.com");
		u1.setGender(1);
		u1.setPhone("0970322377");
		u1.setSelfIntroduction("我好你好");
		return service.insertNewUser(u1);
	}

	@PostMapping("/timmy/NewUserPage2")
	@ResponseBody
	public Users newUserTest2() {
		Calendar c = Calendar.getInstance();
		c.set(1997, 10, 14);
		Users u1 = new Users();
		u1.setNickName("timmy");
		u1.setAddress("火星");
		u1.setBirthday(c.getTime());
		u1.setCategory(1);
		u1.setEmail("8787878@gmail.com");
		u1.setGender(1);
		u1.setPhone("0970322377");
		u1.setSelfIntroduction("87喔");
		return service.insertNewUser(u1);
	}

	@PostMapping("/timmy/NewPostPage")
	@ResponseBody
	public Posts newPostTest() {
		Users u1 = service.getUserById(10);
		Set<Posts> ps = u1.getPosts();
		Posts p1 = new Posts();
		p1.setPostText("第一次PO文");
		p1.setPostTime(new Date());
		p1.setIsReport(0);
		p1.setWhoCanSeeIt(1);
		p1.setPostUser(u1);
		ps.add(p1);
		u1.setPosts(ps);
		service.insertNewUser(u1);
		return p1;
	}

	@GetMapping("/timmy/DeleteTestPage")
	public void deletePostsTest() {
		service.deleteAllPost();
	}

	@GetMapping("/timmy/DeleteTestPage2")
	public void deleteUsersTest() {
		service.deleteAllUser();
	}

	@PostMapping("/timmy/updateUserPage")
	@ResponseBody
	public Users updateUserTest() {
		Calendar c = Calendar.getInstance();
		c.set(1997, 10, 14);
		Users u1 = service.getUserById(1);
		u1.setNickName("jenny");
		u1.setPassword("1234");
		u1.setAddress("台南市永康區大橋兩百街100號");
		u1.setBirthday(c.getTime());
		u1.setCategory(1);
		u1.setEmail("timmy860930@gmail.com");
		u1.setGender(1);
		u1.setPhone("0970322377");
		u1.setSelfIntroduction("安安你好");
		u1.setPhotoPath("/img/userimg/none.png");
		return service.insertNewUser(u1);
	}

	@GetMapping("/timmy/accountsetting.controller")
	public String testgivingSession(HttpSession session, Model m) {
		Users userBefore = (Users) session.getAttribute("user");
		Users userAfter = service.getUserById(userBefore.getUserId());
		session.setAttribute("user", userAfter);
		m.addAttribute("newPet", new Pets());
		List<Posts> postsToShow = new ArrayList<>();
		if ((Users) session.getAttribute("user") != null) {
			postsToShow.addAll(service.getPostsByUserId(userAfter.getUserId())); // 取得登入者發的貼文
		}
		postsToShow.sort(Comparator.comparing(Posts::getPostId).reversed());

		m.addAttribute("postsToShow", postsToShow);
		return "timmy/NormalMember";
	}

	@GetMapping("/timmy/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/getMainPagePosts.controller";
	}
}
