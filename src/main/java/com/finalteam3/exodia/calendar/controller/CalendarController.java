package com.finalteam3.exodia.calendar.controller;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.finalteam3.exodia.calendar.dto.request.CalendarRequest;
import com.finalteam3.exodia.calendar.service.CalendarService;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.security.dto.EmpDetails;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CalendarController {
	@Resource
	CalendarService calendarService;
	
	@GetMapping("/calendar")
	public String calendarForm() {
		return "/calendar";
	}
	
	@PostMapping("/calendar")
	public String addTask(CalendarRequest request, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		int emp_no = loginResponse.getEmp_no();
		request.setEmp_no(emp_no);
		log.info("저장성공 : " + request.toString());
		calendarService.write(request);
		log.info("저장성공 : " + request);
		
		return "redirect:/calendar";
	}

}
