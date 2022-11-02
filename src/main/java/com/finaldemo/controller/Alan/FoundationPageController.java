package com.finaldemo.controller.Alan;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.finaldemo.model.Users;
import com.finaldemo.service.AlanService;

@Controller
public class FoundationPageController {

	@Autowired
	private AlanService alanService;
	
	

	/*** 
	 * 取得所有基金會資料
	 */
	@GetMapping("/Alan/foundation")
	public String getFoundation(Model model) {
		List<Users> usersList = alanService.findAllCharities();
		System.out.println("usersList"+usersList);
		model.addAttribute("usersList", usersList);
		return "Alan/foundation";
	}
	
	

}
