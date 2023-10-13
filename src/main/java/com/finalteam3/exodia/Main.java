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
	
	@RequestMapping("/chat")
	public String chat(Model model) {
		return "chat";
	}
}
