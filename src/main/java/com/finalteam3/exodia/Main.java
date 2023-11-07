package com.finalteam3.exodia;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalteam3.exodia.employee.dao.EmployeeDao;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.employee.service.EmployeeService;
import com.finalteam3.exodia.security.dto.EmpDetails;
import com.finalteam3.exodia.task.dto.TaskByTeamEmp;
import com.finalteam3.exodia.task.dto.response.TeamTaskResponse;
import com.finalteam3.exodia.task.service.TaskService;

@Controller
public class Main {
	@Resource
	private TaskService taskService;
	@Resource
	private EmployeeDao employeeDao;
	
	@RequestMapping("/")
	public String login(Model model) {
		return "redirect:/employee/login";
	}
	

	@RequestMapping("/note3")
	public String note2(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		return "note3";
	}

	

	@RequestMapping("/chat2")
	public String chat2(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		return "chat2";
	}
	
	@RequestMapping("/searchUser")
	public String searchUser(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		return "searchUser";
	}
	

	@RequestMapping("/calendar")
	public String calendar(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		return "calendar";
	}
	
	/*@RequestMapping("/noticeList")
	public String noticeList(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		return "noticeList";
	}*/
	
	/*@RequestMapping("/noticeAdd")
	public String noticeAdd(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		return "noticeAdd";
	}*/
	
	@RequestMapping("/userManagement")
	public String userManagement(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		return "userManagement";
	}
	@RequestMapping("/userProfile")
	public String userProfile(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		return "userProfile";
	}

	@RequestMapping("/userModify2")
	public String userModify2(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		return "userModify2";
	}
	
	@RequestMapping("/projectList")
	public String projectList(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		return "projectList";
	}
	
	/*@RequestMapping("/qnaList")
	public String qnaList(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		return "qnaList";
	}
	
	@RequestMapping("/qnaDetail")
	public String qnaDetail(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		return "qnaDetail";
	}
	
	@RequestMapping("/qnaAdd")
	public String qnaAdd(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		return "qnaAdd";
	}
	
	@RequestMapping("/noticeDetail")
	public String noticeDetail(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		return "noticeDetail";
	}*/
	
	@RequestMapping("/main")
	public String main(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		//진척률
		double rate = taskService.getProgressRate(0);
		model.addAttribute("progressRate", rate);
		
		//프로젝트에 해당하는 팀 리스트 받아오기
		List<String> team_names = employeeDao.selectTeamname(0);
		model.addAttribute("team_names", team_names);
		
		List<TaskByTeamEmp> taskList = new ArrayList<>();
		
		for(String s : team_names) {
			TaskByTeamEmp tte = new TaskByTeamEmp();
			tte.setTeam_name(s);
			
			Map<String, Object> map = new HashMap<>();
			map.put("project_no", 0);
			map.put("team_name", s);
			
			List<TeamTaskResponse> ttr = taskService.getTeamTaskDetail(map);
			tte.setResponse(ttr);
			
			taskList.add(tte);
		}
		model.addAttribute("taskList", taskList);
		
		return "main";
	}
	
	@RequestMapping("/mainCalendar")
	public String mainCalendar(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		return "mainCalendar";
	}
	
	@RequestMapping("/programManagement")
	public String programManagement(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		return "programManagement";
	}
}
