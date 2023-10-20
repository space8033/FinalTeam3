package com.finalteam3.exodia.employee.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalteam3.exodia.employee.dto.request.JoinList;
import com.finalteam3.exodia.employee.dto.request.JoinRequest;
import com.finalteam3.exodia.employee.dto.request.LoginRequest;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.employee.service.EmployeeService;
import com.finalteam3.exodia.employee.service.EmployeeService.LoginResult;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/employee")
@Slf4j
public class EmployeeController {
	@Resource
	private EmployeeService employeeService;
	
	@GetMapping("/login")
	public String loginForm() {
		return "/login";
	}
	
	@PostMapping("/login")
	public String login(LoginRequest loginRequest, HttpSession session) {
		if(employeeService.login(loginRequest).equals(LoginResult.LOGIN_SUCCESS)) {
			LoginResponse loginResponse = employeeService.getLoginResponse(loginRequest);
			session.setAttribute("login", loginResponse);
			return "redirect:/initialPassword";
		//아이디가 없는 경우
		}else if(employeeService.login(loginRequest).equals(LoginResult.FAIL_ID)) {
			log.info("아디없음");
		//비밀번호가 틀린 경우
		}else if(employeeService.login(loginRequest).equals(LoginResult.FAIL_PASSWORD)) {
			log.info("비번틀림");
		//아이디가 삭제된 경우
		}else if(employeeService.login(loginRequest).equals(LoginResult.FAIL_ENABLED)) {
			log.info("만료됨");
		}
		
		return "/login";
	}
	
	@GetMapping("/addUser")
	public String joinForm() {
		return "/addUser";
	}
	
	@PostMapping("/addUser")
	public String join(JoinRequest joinRequest) {
		
		log.info(joinRequest.toString());
		
		//employeeService.join(joinRequest);
		
		return "/addUser";
	}
	
	//프로젝트 진행을 위한 임시 부분/////////////////////////////////////////////////////////
	@GetMapping("/jjoin")
	public String jjoinForm() {
		return "/jjoin";
	}
	
	@PostMapping("/jjoin")
	public String jjoin(JoinRequest joinRequest) {
		
		log.info(joinRequest.toString());
		
		employeeService.join(joinRequest);
		
		return "redirect:/employee/login";
	}
	//프로젝트 진행을 위한 임시 부분/////////////////////////////////////////////////////////
}
