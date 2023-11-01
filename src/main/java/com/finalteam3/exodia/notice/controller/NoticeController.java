package com.finalteam3.exodia.notice.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.notice.dto.Notice;
import com.finalteam3.exodia.notice.service.NoticeService;
import com.finalteam3.exodia.security.dto.EmpDetails;


import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class NoticeController {
	@Resource
	private NoticeService noticeService;
	
	@GetMapping("/noticeList")
	public String noticeList(Model model){				
        return "noticeList";
	}

	@ResponseBody
	@GetMapping("/noticeListJson")
	public String noticeListJson(Authentication authentication, Model model) throws JsonProcessingException {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		List<Notice> data = noticeService.getNoticeList();
		log.info("그냥 데이터:" + data);
		
		//data를 json데이터로 바꾸기
        ObjectMapper objectMapper = new ObjectMapper();
        String jsonData = objectMapper.writeValueAsString(data);
        log.info("json데이터로 바꿔줌 :" + jsonData);
        
		return jsonData;
	}
	
	@GetMapping("/noticeDetail")
	public String noticeDetail(Authentication authentication, int notice_no, Model model){
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		log.info("noticeno :" + notice_no);
		Notice notice = noticeService.getNoticeDetail(notice_no);
		log.info("noticedetail : " + notice);
		model.addAttribute("notice", notice);
		
        return "noticeDetail";
	}
	
	@GetMapping("/noticeAdd")
	public String noticeAddForm(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		return "noticeAdd";
	}
	
	@PostMapping("/noticeAdd")
	public String noticeAdd(Notice notice, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		int emp_no = loginResponse.getEmp_no();
		notice.setEmpinfo_no_writer(emp_no);
		log.info("저장성공 : " + notice);		
		noticeService.write(notice);
		log.info("공지사항 입력 시 db로 넘어가는 값들 :" + notice);
		
		return "redirect:/noticeList";
	}
	
	
	
	@GetMapping("/noticeUpdate")
	public String noticeUpdate(Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		return "noticeUpdate";
	}
	
	

}
