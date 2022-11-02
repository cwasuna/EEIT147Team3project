package com.finaldemo.controller.James;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.finaldemo.model.Users;
import com.finaldemo.service.JamesService;



//@Controller
@SessionAttributes(names = { "memlogin" })
public class UserLoginController {

	@Autowired
	private JamesService memService;

	@Autowired
	private HttpSession session;

	private Integer user;

	@RequestMapping(path = "/userlogin.controller", method = RequestMethod.GET)
	public String processMainPageAction() {

		if (session.getAttribute("memlogin") != null) {
			return "loginSuccess";
		}

		return "memberLogin";
	}

	@RequestMapping(path = "/memberchecklogin.controller", method = RequestMethod.POST)
	public String processAction(@RequestParam("email") String email, @RequestParam("userPwd") String pwd, Model m) {

		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (email == null || email.length() == 0) {
			errors.put("email", "請輸入mail");
		}

		if (pwd == null || pwd.length() == 0) {
			errors.put("pwd", "請輸入密碼");
		}

		if (errors != null && !errors.isEmpty()) {
			return "memberLogin";
		}

		Users memBean = new Users();
		memBean.setUserId(user);
		memBean.setPassword(pwd);
		Users account = memService.findByUserId(memBean);


		if (account != null) {
			m.addAttribute("memlogin", account);
			return "memberLoginSuccess";
		} else {
			errors.put("msg", "帳號密碼有誤");
			return "memberLogin";
		}

		
//		return "memberLogin";
		
		
//		return null;

	}

}
