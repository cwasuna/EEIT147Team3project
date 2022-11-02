package com.finaldemo.controller.Joey;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JoeyPageController {


	@GetMapping("/about")
	public String aboutPage() {
		return "joey/about";
	}

	@GetMapping("/message/ajax")
	public String ajaxVersionPage() {
		return "joey/ajaxMessage";
	}

	@GetMapping("/uploadPage")
	public String uploadPage() {
		return "joey/goodphoto/uploadPage";
	}

	@GetMapping("/uploadPage2")
	public String uploadPage2() {
		return "joey/goodphoto/uploadPageTest";
	}

	
	@GetMapping("/joey/findById")
	public String findMember() {
		return "joey/joeytest";
	}
	

}
