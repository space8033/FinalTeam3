package com.finalteam3.exodia.project.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalteam3.exodia.project.dto.request.ProjectAddRequest;
import com.finalteam3.exodia.project.service.ProjectService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/project")
@Slf4j
public class ProjectController {
	@Resource
	private ProjectService projectService;
	
	@GetMapping("/addProject")
	public String addProjectForm() {
		return "/addProject";
	}
	
	@PostMapping("/addProject")
	public String addProject(ProjectAddRequest request) {
		log.info(request.toString());	
		projectService.addProject(request);
		
		return "/addProject";
	}
}
