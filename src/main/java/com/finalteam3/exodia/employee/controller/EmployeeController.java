package com.finalteam3.exodia.employee.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalteam3.exodia.employee.dto.request.JoinRequest;
import com.finalteam3.exodia.employee.dto.request.LoginRequest;
import com.finalteam3.exodia.employee.dto.request.PasswordRequest;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.employee.service.EmployeeService;
import com.finalteam3.exodia.employee.service.EmployeeService.JoinResult;
import com.finalteam3.exodia.employee.service.EmployeeService.LoginResult;
import com.finalteam3.exodia.employee.service.EmployeeService.PasswordResult;

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
			//가입 또는 비밀번호 변경 후 최초 로그인인 경우
			if(employeeService.getLoginResponse(loginRequest).isEmp_isinit()) {
				return "redirect:/employee/initialPassword";			
				
			//가입 또는 비밀번호 변경 후 최초 로그인이 아닌 경우
			}else {
				return "redirect:/main";
			}
			
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
	
	@GetMapping("/initialPassword")
	public String initialPasswordForm(HttpSession session, Model model) {
		LoginResponse nowLogin = (LoginResponse) session.getAttribute("login");
		
		model.addAttribute("loginEmp", nowLogin.getEmp_id());
		
		return "/initialPassword";
	}
	
	@PostMapping("/initialPassword")
	public String initialPassword(HttpSession session, PasswordRequest passwordRequest) {
		LoginResponse nowLogin = (LoginResponse) session.getAttribute("login");
		String emp_id = nowLogin.getEmp_id();
		passwordRequest.setEmp_id(emp_id);
		
		if(employeeService.changePassword(passwordRequest).equals(PasswordResult.PCHANGE_SUCCESS)) {
			return "redirect:/employee/login";			
		}else {
			return "redirect:/employee/initialPassword";
		}
		
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
		if(employeeService.join(joinRequest).equals(JoinResult.JOIN_SUCCESS)) {
			return "redirect:/employee/login";			
		}else {
			return "/redirect:/employee/jjoin";
		}
	}
	//프로젝트 진행을 위한 임시 부분/////////////////////////////////////////////////////////
}
