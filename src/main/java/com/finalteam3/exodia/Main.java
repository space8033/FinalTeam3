package com.finalteam3.exodia;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalteam3.exodia.calendar.dto.response.CalendarResponse2;
import com.finalteam3.exodia.calendar.service.CalendarService;
import com.finalteam3.exodia.employee.dao.EmployeeDao;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.employee.dto.response.TimeLineResponse;
import com.finalteam3.exodia.employee.service.EmployeeService;
import com.finalteam3.exodia.media.dao.MediaDao;
import com.finalteam3.exodia.media.dto.MediaDto;
import com.finalteam3.exodia.notice.dto.Notice;
import com.finalteam3.exodia.notice.service.NoticeService;
import com.finalteam3.exodia.project.dto.response.ProjectModifyResponse;
import com.finalteam3.exodia.project.service.ProjectService;
import com.finalteam3.exodia.security.dto.EmpDetails;
import com.finalteam3.exodia.task.dto.TaskByTeamEmp;
import com.finalteam3.exodia.task.dto.response.TeamTaskResponse;
import com.finalteam3.exodia.task.service.TaskService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class Main {
	@Resource
	private EmployeeService employeeService;
	@Resource
	private TaskService taskService;
	@Resource
	private EmployeeDao employeeDao;
	@Resource
	private CalendarService calendarService;
	@Resource
	private NoticeService noticeService;
	@Resource
	private ProjectService projectService;
	@Resource
	private MediaDao mediaDao;
	
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
	
	@GetMapping("/userProfile")
	public String userProfile(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		Map<String, Object> map = new HashMap<>();
		map.put("emp_no", loginResponse.getEmp_no());
		map.put("project_no", 0);
		
		TimeLineResponse timeLine = employeeService.getTimeLineByEmpNo(map);
		model.addAttribute("timeLine", timeLine);
		
		Map<String, Object> profile = new HashMap<>();
		profile.put("media_from", "EMP");
		profile.put("from_no", loginResponse.getEmp_no());
		MediaDto mediaDto = mediaDao.selectMediaFromNo(profile);
	    
		if(mediaDto != null) {
	    	String base64Img = Base64.getEncoder().encodeToString(mediaDto.getMedia_data());
	    	model.addAttribute("base64", base64Img);
	    }
		model.addAttribute("twoname", "관리");
	      
		return "userProfile";
	}

	@GetMapping("/main")
	public String main(Model model, Authentication authentication, HttpSession session, Integer projectNo) {
		if(projectNo == null) {
			projectNo = (Integer) session.getAttribute("projectNo");
		}
		
		session.setAttribute("projectNo", projectNo);
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		//진척률
		double rate = taskService.getProgressRate(projectNo);
		model.addAttribute("progressRate", rate);
		model.addAttribute("project_name", projectService.getProjectName(projectNo));
		
		ProjectModifyResponse mod = projectService.getProjectDetail(projectNo);
		String start = mod.getProject_startdate().substring(2,7).replace('-', '.');
		String end = mod.getProject_enddate().substring(2,7).replace('-', '.');
		
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		
		//프로젝트에 해당하는 팀 리스트 받아오기
		List<String> team_names = employeeDao.selectTeamname(projectNo);
		model.addAttribute("team_names", team_names);
		
		List<TaskByTeamEmp> taskList = new ArrayList<>();
		
		for(String s : team_names) {
			TaskByTeamEmp tte = new TaskByTeamEmp();
			tte.setTeam_name(s);
			
			Map<String, Object> map = new HashMap<>();
			map.put("project_no", projectNo);
			map.put("team_name", s);
			
			List<TeamTaskResponse> ttr = taskService.getTeamTaskDetail(map);
			tte.setResponse(ttr);
			
			taskList.add(tte);
		}
		
		model.addAttribute("taskList", taskList);
		
		return "main";
	}
	
	@ResponseBody
    @PostMapping("/noticeListJson2")
    public List<Notice> noticeListJson2() {
        // 이 메서드에서 데이터를 반환하면서 리디렉션을 처리
        List<Notice> data = noticeService.getMainNoticeList();
        
        log.info("데이터 data 어떻게 나와? : " + data);
        
        return data;
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
	
	//달력 일정 조회

	
	
	
	
	
	
	
	
	
	
	
	
}
