package com.finalteam3.exodia.chat.controller;

import java.util.Arrays;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalteam3.exodia.chat.dto.request.ChatMessage;
import com.finalteam3.exodia.chat.dto.request.ChatParticipant;
import com.finalteam3.exodia.chat.dto.response.EmpChat;
import com.finalteam3.exodia.chat.service.ChatService;
import com.finalteam3.exodia.employee.dto.response.EmpNote;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.employee.service.EmployeeService;
import com.finalteam3.exodia.media.dao.MediaDao;
import com.finalteam3.exodia.media.dto.MediaDto;
import com.finalteam3.exodia.note.dto.EmployeeInfo;
import com.finalteam3.exodia.note.service.NoteService;
import com.finalteam3.exodia.security.dto.EmpDetails;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {
	@Resource
	private EmployeeService employeeService;
	@Resource
	private NoteService noteService;
	@Resource
	private ChatService chatService;
	@Resource
	private MediaDao mediaDao;
	
	@GetMapping("/chat")
	public String chat(HttpSession session, Model model, Authentication authentication, @RequestParam(name= "emp_no", required=false) String emp_no) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		return "/chat";
	}
	
	@GetMapping("/chatList")
	public String chatList(HttpSession session, Model model, Authentication authentication, @RequestParam(name= "emp_no", required=false) String emp_no) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		String empInfo_twoname = emp_name.substring(emp_name.length() - 2);
		model.addAttribute("empInfo_twoname", empInfo_twoname);
		List<String> myList = Arrays.asList("bg-label-success", "bg-label-primary", "bg-label-warning", "bg-label-danger", "bg-label-info", "bg-label-dark", "bg-label-secondary");

        int randomIndex = (loginResponse.getEmp_no()%7);
        Map<String, Object> profile = new HashMap<>();
		profile.put("media_from", "EMP");
		profile.put("from_no", loginResponse.getEmp_no());
      
        MediaDto mediaDto = mediaDao.selectMediaFromNo(profile);
        
        String base64Img = "";
        if(mediaDto != null) {
    	  base64Img = Base64.getEncoder().encodeToString(mediaDto.getMedia_data());
        }
		
		model.addAttribute("empInfo_color", myList.get(randomIndex));
		model.addAttribute("empInfo_base64", base64Img);
		
		List<EmpChat> empChatList = chatService.getChatEmpList(empInfo.getEmpinfo_no());
		
		model.addAttribute("empList", empChatList);
		
		return "/chatList";
	}
	
	
	@GetMapping("/chatRoom")
	public String chatRoom(HttpSession session, @RequestParam(name= "emp_no", required=false) String emp_no, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		log.info(emp_no+"누가 널이지?");
		//내정보
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		String emp_name = empInfo.getEmpinfo_name();
		String empInfo_twoname = emp_name.substring(emp_name.length() - 2);
		List<String> myList = Arrays.asList("bg-label-success", "bg-label-primary", "bg-label-warning", "bg-label-danger", "bg-label-info", "bg-label-dark", "bg-label-secondary");

        int randomIndex = (loginResponse.getEmp_no()%7);
        Map<String, Object> profile = new HashMap<>();
		profile.put("media_from", "EMP");
		profile.put("from_no", loginResponse.getEmp_no());
      
        MediaDto mediaDto = mediaDao.selectMediaFromNo(profile);
        
        String base64Img = "";
        if(mediaDto != null) {
    	  base64Img = Base64.getEncoder().encodeToString(mediaDto.getMedia_data());
    	  
        }
		
		model.addAttribute("empInfo_twoname", empInfo_twoname);
		model.addAttribute("empInfo_color", myList.get(randomIndex));
		model.addAttribute("empInfo_base64", base64Img);
	
		
		
		
		//채팅방정보
		int empNo = Integer.parseInt(emp_no);
		EmpNote buddy = chatService.getEmpInfo(empNo);
		int buddyrandomIndex = (buddy.getEmp_no()%7);
		buddy.setTwo_name_color(myList.get(buddyrandomIndex));
		Map<String, Object> buddyprofile = new HashMap<>();
		buddyprofile.put("media_from", "EMP");
		buddyprofile.put("from_no", buddy.getEmp_no());
        MediaDto mediaDtobuddy = mediaDao.selectMediaFromNo(buddyprofile);
        
        String buddybase64Img = "";
        if(mediaDtobuddy != null) {
        	buddybase64Img = Base64.getEncoder().encodeToString(mediaDtobuddy.getMedia_data());
        	buddy.setBase64(buddybase64Img);
        }
		
		model.addAttribute("buddy", buddy);
		
		ChatParticipant chatParticipant = new ChatParticipant();
		chatParticipant.setEmpInfo_no1(buddy.getEmpinfo_no());
		chatParticipant.setEmpInfo_no2(empInfo.getEmpinfo_no());
		
		List<ChatMessage> chatMsg = chatService.getChatList(chatParticipant);
		
		
		model.addAttribute("chatMsg", chatMsg);
		
		
		
		return "/chatRoom";
	}
	
	//채팅 읽음 업데이트
	@PostMapping("/updateUckMsg")
	@ResponseBody
	public String updateUckMsg(String emp_no, String chatNo) {
		
		int chat_no = Integer.parseInt(chatNo);
		int empNo = Integer.parseInt(emp_no);
		EmployeeInfo empInfo = employeeService.getEmpInfo(empNo);
		
		
		ChatMessage chatMsg = new ChatMessage();
		chatMsg.setChatRoom_no(chat_no);
		chatMsg.setEmpInfo_no(empInfo.getEmpinfo_no());
		chatService.updateMessageRead(chatMsg);
		log.info("업데이트 성공이요");
		return "redirect:/chatRoom";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}