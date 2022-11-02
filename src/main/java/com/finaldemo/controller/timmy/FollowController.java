package com.finaldemo.controller.timmy;

import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finaldemo.model.Follow;
import com.finaldemo.model.Users;
import com.finaldemo.service.TimmyService;


@Controller
public class FollowController {
	
	@Autowired
	private TimmyService service;
	
	@GetMapping("/timmy/addFollows")
	public String addFansById(@RequestParam("guestId") Integer guestId, HttpSession session) {
		Users userBefore = (Users) session.getAttribute("user");
		Users user = service.getUserById(userBefore.getUserId());
		Set<Follow> follows = user.getFollows(); // 追隨清單
		Follow fo1 = new Follow(); // 建立新關係
		fo1.setFans(service.getUserById(guestId)); // 被追隨者
		fo1.setFollow(user); // 追隨者
		follows.add(fo1); 
		service.insertNewUser(user);
		return "redirect:/timmy/readUserById/" + guestId.toString();
	}
	
	@GetMapping("/timmy/removeFollows")
	public String removeFollowById(@RequestParam("guestId") Integer guestId, HttpSession session) {
		Users userBefore = (Users) session.getAttribute("user");
		Users user = service.getUserById(userBefore.getUserId());
		service.deleteFollowRelation(guestId, user.getUserId());
		return "redirect:/timmy/readUserById/" + guestId.toString();
	}
	
	@PostMapping("/timmy/deleteFollowingByIdAjax")
	@ResponseBody
	public String deleteFollowingByIdAjax(@RequestBody String guestId, HttpSession session) {
		guestId = guestId.replaceAll("=", "");
		Users userBefore = (Users) session.getAttribute("user");
		Users user = service.getUserById(userBefore.getUserId());
		service.deleteFollowRelation(Integer.parseInt(guestId), user.getUserId());
		return guestId;
	}
	
	@PostMapping("/timmy/addFollowingByIdAjax")
	@ResponseBody
	public String addFollowingByIdAjax(@RequestBody String guestId, HttpSession session) {
		guestId = guestId.replaceAll("=", "");
		Users userBefore = (Users) session.getAttribute("user");
		Users user = service.getUserById(userBefore.getUserId());
		Set<Follow> follows = user.getFollows(); // 追隨清單
		Follow fo1 = new Follow(); // 建立新關係
		fo1.setFans(service.getUserById(Integer.parseInt(guestId))); // 被追隨者
		fo1.setFollow(user); // 追隨者
		follows.add(fo1); 
		service.insertNewUser(user);
		return guestId;
	}
	
	@PostMapping("/timmy/deleteFansByIdAjax")
	@ResponseBody
	public String deleteFansByIdAjax(@RequestBody String guestId, HttpSession session) {
		guestId = guestId.replaceAll("=", "");
		Users userBefore = (Users) session.getAttribute("user");
		Users user = service.getUserById(userBefore.getUserId());
		service.deleteFollowRelation(user.getUserId(), Integer.parseInt(guestId));
		return guestId;
	}
}
