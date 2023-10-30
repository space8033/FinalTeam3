package com.finalteam3.exodia.calendar.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.finalteam3.exodia.calendar.dto.request.CalendarRequest;
import com.finalteam3.exodia.calendar.dto.response.CalendarColor;
import com.finalteam3.exodia.calendar.dto.response.CalendarResponse2;
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
	
	@ResponseBody
	@GetMapping("/calendar1")
	public List<CalendarResponse2> getTask(Authentication authentication, Model model) throws Exception {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		
		int emp_no = loginResponse.getEmp_no();
		
		
		List<CalendarResponse2> events = calendarService.getPersonalTask(emp_no);
		log.info("캘린더 업무 리스트 가져오기 :"+ events);
		
		List<CalendarColor> responseresponse = new ArrayList<>();
		CalendarColor calendarColor = new CalendarColor();
		calendarColor.setCalendar("Business");
		responseresponse.add(calendarColor);
		for(CalendarResponse2 c: events) {
			c.setExtendedProps(responseresponse);
		}
		
		
		ObjectMapper objectMapper = new ObjectMapper();
		String calendarJsonData = objectMapper.writeValueAsString(events);
		
		log.info("json으로 변환한 캘린더 업무 리스트 : " + calendarJsonData);
		
		
		return events;
	}

}