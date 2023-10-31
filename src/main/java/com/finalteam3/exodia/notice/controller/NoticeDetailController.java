package com.finalteam3.exodia.notice.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.notice.dto.Notice;
import com.finalteam3.exodia.notice.dto.NoticeDetail;
import com.finalteam3.exodia.notice.service.NoticeDetailService;
import com.finalteam3.exodia.notice.service.NoticeService;
import com.finalteam3.exodia.security.dto.EmpDetails;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class NoticeDetailController {
	@Autowired
	NoticeDetailService noticeDetailService;
	
	@GetMapping("/noticeDetail")
	public String noticeDetail(int notice_no, Authentication authentication, Model model){
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		Notice notice = noticeDetailService.getNoticeDetail(notice_no);
		
		
        return "noticeDetail";
	}
}
