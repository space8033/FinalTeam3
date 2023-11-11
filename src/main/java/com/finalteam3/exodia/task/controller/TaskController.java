package com.finalteam3.exodia.task.controller;

import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.security.dto.EmpDetails;
import com.finalteam3.exodia.task.dto.request.ProgramModifyRequest;
import com.finalteam3.exodia.task.dto.request.ProgramRegisterRequest;
import com.finalteam3.exodia.task.dto.response.ProgramListResponse;
import com.finalteam3.exodia.task.service.TaskService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/task")
@Slf4j
public class TaskController {
	@Resource
	private TaskService taskService;
	
	@GetMapping("/programManagement")
	public String programManagement(Authentication authentication, Model model) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		int empinfo_no = loginResponse.getEmpInfo_no();
		int emp_no = empDetails.getLoginResponse().getEmp_no();
		log.info("empno : " + emp_no);
		
		model.addAttribute("emp_no", emp_no);
		model.addAttribute("empinfo_no", empinfo_no);
		
		return "/programManagement";
	}
	
	@GetMapping("/getPrograms")
	@ResponseBody
	public String getPrograms(int empinfo_no) throws JsonProcessingException{
		List<ProgramListResponse> list = taskService.getAllBusinessProgram();
		Collections.sort(list, ProgramListResponse.empinfoNoComparator(empinfo_no));
		
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonData = objectMapper.writeValueAsString(list);
		return jsonData;
	}
	
	@PostMapping(value = "/registerProgram", produces = "application/json; charset=UTF-8")
	public String registerProgram(@RequestBody ProgramRegisterRequest request) {
		taskService.registerProgram(request);
		
		return "redirect:/task/programManagement";
	}
	
	@GetMapping("/getProgramDetail")
	public String getProgramDetail(int task_no, Model model, Authentication authentication) {
		ProgramModifyRequest programModify = taskService.getProgramDetail(task_no);
		model.addAttribute("programModify", programModify);

		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		
		model.addAttribute("now_emp_no", loginResponse.getEmp_no());
		
		return "/programModifyAjax";
	}
	
	@PostMapping(value = "/modifyProgram", produces = "application/json; charset=UTF-8")
	public String modifyProgram(@RequestBody ProgramModifyRequest request) {
		taskService.updateProgram(request);
		
		return "redirect:/task/programManagement";
	}
	
	@PostMapping("/deleteProgram")
	public String deleteProgram(int task_no) {
		taskService.deleteProgram(task_no);
		
		return "redirect:/task/programManagement";
	}
}
