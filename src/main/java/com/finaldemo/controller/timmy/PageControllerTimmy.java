package com.finaldemo.controller.timmy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageControllerTimmy {
	
//	@GetMapping("/timmy")
	public String returnIndex() {
		return "timmy/index";
	}
	
}
