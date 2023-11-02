package com.finalteam3.exodia.alarm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalteam3.exodia.alarm.dto.request.AlarmRequest;
import com.finalteam3.exodia.alarm.dto.response.AlarmResponse;
import com.finalteam3.exodia.alarm.service.AlarmService;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.employee.service.EmployeeService;
import com.finalteam3.exodia.note.dto.EmployeeInfo;
import com.finalteam3.exodia.note.dto.request.Note;
import com.finalteam3.exodia.note.service.NoteService;
import com.finalteam3.exodia.security.dto.EmpDetails;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AlarmController {

	@Resource
	private AlarmService alarmService;
	@Resource
	private EmployeeService employeeService;
	@Resource
	private NoteService noteService;
	
	
	@GetMapping("/alarmDetail")
	public String alarmDetail(@RequestParam(name= "empId", required=false) String empId, Authentication authentication, Model model) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		List<AlarmRequest> AlarmList = alarmService.getAlarmList(empInfo.getEmpinfo_no());
		List<AlarmResponse> list = new ArrayList<>();
		
		
		for(AlarmRequest alarm : AlarmList) {
			AlarmResponse alarmResponse = new AlarmResponse();
			alarmResponse.setAlarm_createdAt(alarm.getAlarm_createdAt());
			alarmResponse.setAlarm_isRead(alarm.isAlarm_isRead());
			alarmResponse.setAlarm_deletedAt(alarm.getAlarm_deletedAt());
			alarmResponse.setAlarm_no(alarm.getAlarm_no());
			alarmResponse.setAlarm_type(alarm.getAlarm_type());
			alarmResponse.setAlarm_typeNo(alarm.getAlarm_typeNo());
			alarmResponse.setEmpinfo_no(alarm.getEmpinfo_no());
			if ("쪽지".equals(alarm.getAlarm_type())) {
				int typeNo = alarm.getAlarm_typeNo();
				Note note = noteService.getNote(typeNo);
				int receiver = note.getNote_sender();
				EmployeeInfo empInfo2 = employeeService.getEmpInfoByEmpInfoNo(receiver);
				String empInfoName = empInfo2.getEmpinfo_name();
				alarmResponse.setEmp_name(empInfoName);
				list.add(alarmResponse);
			}
		}
		
		model.addAttribute("list", list);
		
		return "/alarm";
	
		
	}
	
	@PostMapping("/alarmRemove")
	@ResponseBody
	public String alarmRemove(String alarm_no) {
		int alarmNo = Integer.parseInt(alarm_no);
		alarmService.deleteAlarm(alarmNo);
		
		return "redirect:/alarm";
		
	}
	
	@PostMapping("/alarmRead")
	@ResponseBody
	public String alarmRead(String alarm_no) {
		int alarmNo = Integer.parseInt(alarm_no);
		alarmService.updateAlarmRead(alarmNo);
		
		return "redirect:/alarm";
		
	}
	@PostMapping("/alarmAllRead")
	@ResponseBody
	public String alarmAllRead(String alarm_no, Authentication authentication) {

		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		List<AlarmRequest> list = alarmService.getAlarmList(empInfo.getEmpinfo_no());
		
		for(AlarmRequest alarm : list) {
			int alarmNo = alarm.getAlarm_no();
			alarmService.updateAlarmRead(alarmNo);
			
		}
		
		return "redirect:/alarm";
		
	}
}