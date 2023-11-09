package com.finalteam3.exodia.project.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalteam3.exodia.employee.dao.EmployeeDao;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.employee.service.EmployeeService;
import com.finalteam3.exodia.project.dto.request.ProjectAddRequest;
import com.finalteam3.exodia.project.dto.response.ProjectListResponse;
import com.finalteam3.exodia.project.dto.response.ProjectModifyResponse;
import com.finalteam3.exodia.project.service.ProjectService;
import com.finalteam3.exodia.security.dto.EmpDetails;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/project")
@Slf4j
public class ProjectController {
	@Resource
	private ProjectService projectService;
	@Resource
	private EmployeeService employeeService;
	@Resource
	private EmployeeDao employeeDao;
	
	@GetMapping("/addProject")
	public String addProjectForm(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		return "/addProject";
	}
	
	@PostMapping(value = "/addProject", produces = "application/json; charset=UTF-8")
	public String addProject(@RequestBody ProjectAddRequest request) {
		projectService.addProject(request);
		
		return "redirect:/employee/userManagement";
	}
	
	@GetMapping("/projectList")
	public String getAllProject(Authentication authentication, Model model) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		int empinfo_no = employeeDao.selectEmpInfoNoByEmpNo(loginResponse.getEmp_no());
		model.addAttribute("empinfo_no", empinfo_no);
		
		return "/projectList";
	}
	
	@PostMapping("/projectList")
	@ResponseBody
	public List<ProjectListResponse> getProjectList(@RequestParam int empinfo_no) {
		log.info("ㅇ라ㅣㄴ어미라ㅓㅁㅇ니ㅏㄹ" + empinfo_no);
		List<ProjectListResponse> list = projectService.getAllProjectList(empinfo_no);
		log.info("dfasdgasga" + list.toString());
		return list;
	}

	@GetMapping("/modifyProject")
	public String modifyProjectForm(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		int project_no = 0;
		ProjectModifyResponse response = projectService.getProjectDetail(project_no);
		model.addAttribute("projectDetail", response);
		
		return "/modifyProject";
	}
	
	@PostMapping(value = "/modifyProject", produces = "application/json; charset=UTF-8")
	public String modifyProject(@RequestBody ProjectModifyResponse response) {
		projectService.modifyProject(response);
		
		return "redirect:/main";
	}
}
