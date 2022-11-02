package com.finaldemo.controller.Alan;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finaldemo.model.Orders;
import com.finaldemo.model.Users;
import com.finaldemo.service.AlanService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutDevide;


@Controller
public class CheckOrder {
	@Autowired
	private AlanService alanService;
	
	@Autowired
	private HttpSession session; // 宣告session 出現兩次以上不用重複宣告
	
	

	/*** 
	 * 取得個人訂單資料
	 */
	@GetMapping("/Alan/checkOrder")
	public String checkOrder(Model model) {
		
		Integer usersId = ((Users) session.getAttribute("user")).getUserId(); 
		
		List<Orders> usersList = alanService.findUsersOrders(Integer.toString(usersId));
		
		System.out.println("usersList"+usersList);
		model.addAttribute("usersList", usersList);
		return "Alan/checkOrder";
	}
	
	

}
