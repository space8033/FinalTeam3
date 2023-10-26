package com.finalteam3.exodia.project.controller;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.project.dto.request.ProjectAddRequest;
import com.finalteam3.exodia.project.service.ProjectService;
import com.finalteam3.exodia.security.dto.EmpDetails;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/project")
@Slf4j
public class ProjectController {
	@Resource
	private ProjectService projectService;
	
	@GetMapping("/addProject")
	public String addProjectForm(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		return "/addProject";
	}
	
	@PostMapping("/addProject")
	public String addProject(ProjectAddRequest request) {
		log.info(request.toString());	
		projectService.addProject(request);
		
		return "/addProject";
	}
}
