package com.finalteam3.exodia.note.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.employee.service.EmployeeService;
import com.finalteam3.exodia.note.dto.EmployeeInfo;
import com.finalteam3.exodia.note.dto.NoteAll;
import com.finalteam3.exodia.note.dto.Pager;
import com.finalteam3.exodia.note.service.NoteService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class NoteController {
	@Resource
	private EmployeeService employeeService;
	@Resource
	private NoteService noteService;
	
	@GetMapping("/note2")
	public String notePage(String pageNo, HttpSession session, Model model) {
		LoginResponse loginResoponse = (LoginResponse) session.getAttribute("login");
		log.info("여기까지 ok1");
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResoponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		if(pageNo == null) {
			   //세션에 저장되어 있는지 확인
			   pageNo = (String) session.getAttribute("pageNo2");
			   //저장되어있지 않다면 "1"로 초기화
			   if(pageNo == null) {
				   pageNo = "1";
			   }
		}
		
		int empNo = 0;
		if(session.getAttribute("login") != null ) {
			empNo = empInfo.getEmpinfo_no();
		}
		
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);
		//세션에 pageNo를 저장
		session.setAttribute("pageNo", String.valueOf(pageNo));
		log.info("여기까지 ok2");
		int totalRows = noteService.countByNoteNo(empNo);
		log.info(totalRows+"나전체숫자");
		
		Pager pager = new Pager(10, 5, totalRows, intPageNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("startRowNo", pager.getStartRowNo());
		map.put("endRowNo", pager.getEndRowNo());
		map.put("empNo", empNo);
		log.info(map+"여기까지 맵임ok3");
		
		List<NoteAll> list = noteService.getNoteListByRno(map);
		log.info(list+"여기까지 ok3");
			
		model.addAttribute("pager", pager);
		model.addAttribute("list", list);
		log.info("여기까지 ok4");
		
		return "/note2";
	}
	
}
