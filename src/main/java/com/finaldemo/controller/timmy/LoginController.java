package com.finaldemo.controller.timmy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finaldemo.model.Foundation;
import com.finaldemo.model.Users;
import com.finaldemo.service.TimmyService;

@Controller
public class LoginController {
	
	@Autowired
	private TimmyService service;
	
	@Autowired
	private JavaMailSender mailSender;
	 
	
	@GetMapping("/timmy/signUp")
	public String editMessage(Model model) {
		model.addAttribute("users", new Users()); // signUp.jsp的ModelAttribute需要
		return "timmy/signUp";
	}
	
//	@PostMapping("/timmy/signUp.controller")
//	public String checkLoginController(@ModelAttribute Users user, Model m) {
//		List<Users> usersByEmail = service.getUsersByEmail(user.getEmail());
//		if (usersByEmail.size() != 0) {
//			m.addAttribute("error", "the email has been used");
//			return "/timmy/signUp";
//		}
//		
//		user.setPhotoPath("/img/userimg/none.png");
//		if(user.getCategory() == 2) {
//			user.setFoundation(new Foundation());
//		}
//		service.insertNewUser(user);
//		m.addAttribute("newAccountToBuild", "success");
//		return "timmy/login";
//	}
	
	@PostMapping("/timmy/signUp.controller")
    public String checkLoginController(@ModelAttribute Users user, Model m) {
        List<Users> usersByEmail = service.getUsersByEmail(user.getEmail());
        if (usersByEmail.size() != 0) {
            m.addAttribute("error", "the email has been used");
            return "/timmy/signUp";
        }
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("eeit14719@outlook.com");
        message.setTo(user.getEmail());
        message.setSubject("Welcome");
        message.setText("Welcome to PEEiT147.com" );
        mailSender.send(message);
        user.setPhotoPath("/img/userimg/none.png");
        if(user.getCategory() == 2) {
            user.setFoundation(new Foundation());
        }
        service.insertNewUser(user);
        m.addAttribute("newAccountToBuild", "success");
        return "timmy/login";
    }
	
	@PostMapping("/timmy/checkLogin.controller")
	public String checkLoginProcess(@RequestParam String email, @RequestParam String password,
			@RequestParam(defaultValue = "off") String rememberMe, Model m, HttpSession session, HttpServletResponse response) {
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		if (email == null || email.length() == 0) {
			errors.put("email", "Email is required");
		}
		if (password == null || password.length() == 0) {
			errors.put("pwd", "Password is required");
		}
		if (errors != null && !errors.isEmpty()) {
			return "redirect:/timmy/";
		}
		Users u = service.checkLogin(email, password);
		if (u != null && u.getCategory()!=0) {
			if (rememberMe.equals("on")) {
				Cookie cookie = new Cookie("userCookie", u.getEmail());
				cookie.setMaxAge(7*24*60*60);
				response.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("userCookie", u.getEmail());
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			session.setAttribute("user", u);
			return "redirect:/getMainPagePosts.controller";
		}
		errors.put("failed", "login failed");
		return "timmy/login";
	}
	@GetMapping("/timmy/")
	public String loginPage() {
		return "timmy/login";
	}
}
