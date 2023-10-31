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
import com.finalteam3.exodia.notice.service.NoticeService;
import com.finalteam3.exodia.security.dto.EmpDetails;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class NoticeController {
	@Resource
	private NoticeService noticeService;
	
	@GetMapping("/noticeList")
	public String noticeTest1(Model model){				
        return "noticeList";
	}

	@ResponseBody
	@GetMapping("/noticeListJson")
	public String noticeTest(Model model) throws JsonProcessingException {
		List<Notice> data = noticeService.getNoticeList();
		
		//data를 json데이터로 바꾸기
        ObjectMapper objectMapper = new ObjectMapper();
        String jsonData = objectMapper.writeValueAsString(data);
        
		return jsonData;
	}
	
	@GetMapping("/noticeDetail")
	public String noticeDetail(int notice_no, Model model){
		log.info("noticeno :" + notice_no);
		Notice notice = noticeService.getNoticeDetail(notice_no);
		log.info("noticedetail : " + notice);
		model.addAttribute("notice", notice);
		
        return "noticeDetail";
	}

}
