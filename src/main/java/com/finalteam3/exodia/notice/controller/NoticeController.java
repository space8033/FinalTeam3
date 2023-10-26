package com.finalteam3.exodia.notice.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.finalteam3.exodia.notice.dto.Notice;
import com.finalteam3.exodia.notice.service.NoticeService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class NoticeController {
	@Autowired
	NoticeService noticeService;
		
	@GetMapping("/noticeTest")
	public String noticeTest(Model model){				
        return "noticeTest";
	}
}

/*@ResponseBody
	@GetMapping("/notice/noticeTest")
	public List<Notice> noticeTest(Model model) {
		List<Notice> data = noticeService.getNoticeList();
		model.addAttribute("data", data);
		return data;
	}*/
	
/*	
	@GetMapping("/noticeList")
    public String noticeList(Model model) throws JsonProcessingException {
        List<Notice> data = noticeService.getNoticeList();
        log.info("Data: " + data);
        
        //data를 json데이터로 바꾸기
        ObjectMapper objectMapper = new ObjectMapper();
        String jsonData = objectMapper.writeValueAsString(data);
        
        log.info("jsonData: " + jsonData);      
             
        model.addAttribute("datas", data);
        return "noticeList";
    }

}*/
