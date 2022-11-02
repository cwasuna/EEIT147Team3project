package com.finaldemo.controller.phoebe;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finaldemo.model.Pets;
import com.finaldemo.model.Posts;
import com.finaldemo.model.Users;
import com.finaldemo.service.PhoebeService;
import com.finaldemo.service.TimmyService;

@Controller
public class PageController_P {

	@Autowired
	private PhoebeService service;
	@Autowired
	private TimmyService TimmyService;
	
	@GetMapping("/phoebe/")
	public String welcomeIndex(HttpSession session) {
		return "phoebe/index";
	}

	@GetMapping("/phoebe/login")
	public String login() {
		return "phoebe/login";
	}

	@GetMapping("/phoebe/signUp")
	public String editMessage(Model model) {
		model.addAttribute("users", new Users()); // signUp.jsp的ModelAttribute需要
		return "phoebe/signUp";
	}
	
	@GetMapping("/phoebe/search")
	public String search(@RequestParam String search, Model model) {
		List<Users> userList = service.searchPeople(search);
		model.addAttribute("userList", userList);
		
		List<Posts> postList = service.searchPost(search);
		postList.sort(Comparator.comparing(Posts::getPostId).reversed());
		model.addAttribute("postList", postList);
		
		return "phoebe/searchResult";
	}
	
	//測試用
	@PostMapping("/phoebe/NewPet")
	@ResponseBody
	public Pets newPostTest() {
		Users u1 = TimmyService.getUserById(1);
		Set<Pets> ps = u1.getPets();
		Pets p1 = new Pets();
		p1.setPetBirthday(new Date());
		p1.setPetDescription("這是一隻狗勾");
		p1.setPetGender(0);
		p1.setPetName("狗勾的名字");
		p1.setPetPhotoPath("dog01");
		p1.setPetType(1);
		p1.setPetUser(u1);
		ps.add(p1);
		u1.setPets(ps);
		TimmyService.insertNewUser(u1);
//		service.insertNewPost(p1);
		return p1;
	}
	
}
