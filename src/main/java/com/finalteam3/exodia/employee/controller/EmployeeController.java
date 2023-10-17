package com.finalteam3.exodia.employee.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalteam3.exodia.employee.dto.request.LoginRequest;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.employee.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	@Resource
	private EmployeeService employeeService;
	
	@GetMapping("/login")
	public String loginForm() {
		return "/login";
	}
	
	@PostMapping("/login")
	public String login(LoginRequest loginRequest, HttpSession session) {
		LoginResponse loginResponse = employeeService.login(loginRequest);
		session.setAttribute("login", loginResponse);
		
		return "redirect:/initialPassword";
	}
}
