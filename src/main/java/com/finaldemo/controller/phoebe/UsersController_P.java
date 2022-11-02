package com.finaldemo.controller.phoebe;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finaldemo.model.Foundation;
import com.finaldemo.model.Users;
import com.finaldemo.service.PhoebeService;

@Controller
public class UsersController_P {

	@Autowired
	private PhoebeService UsersService;
	
	@PostMapping("/phoebe/signUp.controller")
	public String signUp(@ModelAttribute Users user, Model model) {
		user.setPhotoPath("/img/userimg/none.png");
		if(user.getCategory() == 2) {
			user.setFoundation(new Foundation());
		}
		UsersService.signUp(user);
		
		return "redirect:/phoebe/login";
	}
	
	@PostMapping("/phoebe/checkLogin.controller")
	public String checkLoginProcess(@RequestParam String email, @RequestParam String password, Model m, HttpSession session) {
		Map<String,String> errors = new HashMap<String,String>();
		m.addAttribute("errors", errors);
		if (email == null || email.length()==0) {
			errors.put("email", "Email is required");
		}
		if (password == null || password.length()==0) {
			errors.put("pwd", "Password is required");
		}
		if(errors!=null && !errors.isEmpty()) {
			return "redirect:phoebe/login";
		}
		Users u = UsersService.checkLogin(email, password);
		if (u != null) {
			session.setAttribute("user", u);
			System.out.println("登入成功");
			return "redirect:/getMainPagePosts.controller";
		}
		errors.put("failed", "login failed");
		return "redirect:phoebe/login";
	}
	
	@GetMapping("/phoebe/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/phoebe/";
	}
}
