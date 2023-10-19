package com.finalteam3.exodia.handler;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {

	@GetMapping("/chat")
	public void chat(Model model) {
		
		
		
		log.info("==================================");
		log.info("@ChatController, GET Chat / Username : " );
		
		model.addAttribute("userid", "dd");
	}
}