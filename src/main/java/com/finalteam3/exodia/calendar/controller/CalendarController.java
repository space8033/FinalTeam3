package com.finalteam3.exodia.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalteam3.exodia.calendar.dto.request.CalendarRequest;
import com.finalteam3.exodia.calendar.dto.response.CalendarResponse2;
import com.finalteam3.exodia.calendar.service.CalendarService;
import com.finalteam3.exodia.employee.dao.EmployeeDao;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.security.dto.EmpDetails;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CalendarController {
	@Resource
	private CalendarService calendarService;
	@Resource
	private EmployeeDao employeeDao;
	
	@GetMapping("/calendar")
	public String calendarForm() {
		return "/calendar";
	}

	@GetMapping("/teamCalendar")
	public String teamCalendarForm() {
		
		return "/teamCalendar";
	}
	
	//캘린더 일정 추가
	@PostMapping("/calendar")
	public String addTask(CalendarRequest request, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		int emp_no = loginResponse.getEmp_no();
		request.setEmp_no(emp_no);
		calendarService.write(request);
		
		return "redirect:/calendar";
	}

	@PostMapping("/modifyCalendar")
	public String modifyTask(CalendarRequest request, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		int emp_no = loginResponse.getEmp_no();
		request.setEmp_no(emp_no);
		
		calendarService.updateByTaskNo(request);
		
		return "redirect:/calendar";
	}
	
	@ResponseBody
	@GetMapping("/calendar1")
	public List<CalendarResponse2> getTask(Authentication authentication, Model model) throws Exception {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		
		int emp_no = loginResponse.getEmp_no();
		
		
		List<CalendarResponse2> events = calendarService.getPersonalTask(emp_no);
		
		return events;
	}

	@ResponseBody
	@GetMapping("/teamCalendarList")
	public List<CalendarResponse2> getTeamTask(Authentication authentication, Model model) throws Exception {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		
		int emp_no = loginResponse.getEmp_no();
		Map<String, Object> map = new HashMap<>();
		map.put("project_no", 0);
		map.put("emp_no", emp_no);
		
		String team_name = employeeDao.selectTeamByEmpNo(map);
		
		List<CalendarResponse2> events = calendarService.getTeamTask(team_name);
		
		return events;
	}
	
	//일정 삭제
	@PostMapping("/deleteCalendar")
	public String deleteTask(Authentication authentication, int task_no) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		
		calendarService.delete(task_no);
		
		return "calendar";
	}
	
	//일정 수정
	@PostMapping("/updateCalendar")
	public String updateCalendar(Authentication authentication, int task_no, CalendarRequest calendarRequest) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		
		calendarService.updateByTaskNo(calendarRequest);
		
		return "calendar";
	}
	
}