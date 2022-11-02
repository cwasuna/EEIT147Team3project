package com.finaldemo.controller.Alan;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finaldemo.model.Foundation;
import com.finaldemo.model.Products;
import com.finaldemo.model.Users;
import com.finaldemo.service.AlanService;

@Controller
public class FoundationProductController {

	@Autowired
	private AlanService alanService;

	/***
	 * 取得基金會商品頁面
	 * @param foundationId
	 */
	@RequestMapping(path = "/Alan/foundationProduct")
	public String getFoundationProduct(@RequestParam("foundationId") String foundationId, Model model) {
		List<Foundation> foundationList = alanService.findAllFoundationProducts(foundationId);
		System.out.println("size: " + foundationList.size());
		System.out.println("foundationId=====:" + foundationId);
		List<Users> usersList = alanService.findFoundation(foundationId);
		model.addAttribute("foundationList", foundationList);
		model.addAttribute("usersList", usersList);
		System.out.println("foundationList:" + foundationList);
		System.out.println("usersList:" + usersList);
		return "Alan/foundationProduct";
	}

}
