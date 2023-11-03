package com.finalteam3.exodia.task.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalteam3.exodia.task.dto.request.ProgramRegisterRequest;
import com.finalteam3.exodia.task.service.TaskService;

@Controller
@RequestMapping("/task")
public class TaskController {
	@Resource
	private TaskService taskService;
	
	@GetMapping("/programManagement")
	public String programManagement() {
		
		return "/programManagement";
	}
	
	@PostMapping("/registerProgram")
	public String registerProgram(ProgramRegisterRequest request) {
		taskService.registerProgram(request);
		
		return "redirect:/task/programManagement";
	}
	
}
