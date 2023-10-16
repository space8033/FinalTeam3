package com.finalteam3.exodia;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Main {
	
	@RequestMapping("/")
	public String login(Model model) {
		return "login";
	}
	
	@RequestMapping("/note")
	public String note(Model model) {
		return "note";
	}
	@RequestMapping("/note2")
	public String note2(Model model) {
		return "note2";
	}
	
	@RequestMapping("/chat")
	public String chat(Model model) {
		return "chat";
	}
	@RequestMapping("/chat2")
	public String chat2(Model model) {
		return "chat2";
	}
	
	@RequestMapping("/searchUser")
	public String searchUser(Model model) {
		return "searchUser";
	}
	
	@RequestMapping("/calendar")
	public String calendar(Model model) {
		return "calendar";
	}
}
