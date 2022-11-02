package com.finaldemo.controller.timmy;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.finaldemo.model.Event;
import com.finaldemo.model.Users;
import com.finaldemo.service.TimmyService;

@Controller
public class EventController {
	
	@Autowired
	private TimmyService service;
	
	@GetMapping("/eventPage")
	public String returnEventPate(Model m, HttpSession session) {
		Users userBefore = (Users) session.getAttribute("user");
		Users userAfter = service.getUserById(userBefore.getUserId());
		session.setAttribute("user", userAfter);
		m.addAttribute("newEvent", new Event());
		return "timmy/eventPage";
	}
	
	@InitBinder
	public void InitBinder(WebDataBinder binder) {
		// 前端传入的时间格式必须是"yyyy-MM-dd"效果!
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		CustomDateEditor dateEditor = new CustomDateEditor(df, true);
		binder.registerCustomEditor(Date.class, dateEditor);
	}
	
	@PostMapping("/event/insertNewEvent.controller")
	public String addEvent(@ModelAttribute("newEvent") Event event, HttpSession session) {
		Users u1 = (Users) session.getAttribute("user");
		Users u2 = service.getUserById(u1.getUserId());
		Set<Event> eventList = u2.getMyHostEvents();
		event.setEventHost(u2);
		eventList.add(event);
		service.insertNewUser(u2);
		return "redirect:/eventPage";
	}
	
}
