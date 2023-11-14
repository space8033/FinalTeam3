package com.finalteam3.exodia.alarm.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalteam3.exodia.alarm.dao.AlarmDao;
import com.finalteam3.exodia.alarm.dto.request.AlarmRequest;
import com.finalteam3.exodia.alarm.dto.response.AlarmResponse;
import com.finalteam3.exodia.alarm.service.AlarmService;
import com.finalteam3.exodia.chat.dto.request.ChatMessage;
import com.finalteam3.exodia.chat.service.ChatService;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.employee.service.EmployeeService;
import com.finalteam3.exodia.inquiry.dto.Reply;
import com.finalteam3.exodia.inquiry.service.InquiryService;
import com.finalteam3.exodia.media.dao.MediaDao;
import com.finalteam3.exodia.media.dto.MediaDto;
import com.finalteam3.exodia.note.dto.EmployeeInfo;
import com.finalteam3.exodia.note.dto.request.Note;
import com.finalteam3.exodia.note.service.NoteService;
import com.finalteam3.exodia.notice.dao.NoticeDao;
import com.finalteam3.exodia.notice.dto.Notice;
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
	@Resource
	private ChatService chatService;
	@Resource
	private InquiryService inquiryService;
	@Resource
	private MediaDao mediaDao;
	@Resource
	private AlarmDao alarmDao;
	@Resource
	private NoticeDao noticeDao;
	
	
	@GetMapping("/alarmDetail")
	public String alarmDetail(@RequestParam(name= "empId", required=false) String empId, Authentication authentication, Model model) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		List<AlarmRequest> alarmList = alarmService.getAlarmList(empInfo.getEmpinfo_no());
		List<AlarmResponse> list = new ArrayList<>();
		
		
		for(AlarmRequest alarm : alarmList) {
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
				
				List<String> myList = Arrays.asList("bg-label-success", "bg-label-primary", "bg-label-warning", "bg-label-danger", "bg-label-info", "bg-label-dark", "bg-label-secondary");
		        int randomIndex = (empInfo2.getEmp_no()%7);
				alarmResponse.setTwo_name_color(myList.get(randomIndex));
				
				alarmResponse.setTwo_name(empInfo2.getEmpinfo_name().substring(empInfo2.getEmpinfo_name().length() - 2));
				Map<String, Object> profile = new HashMap<>();
				profile.put("media_from", "EMP");
				profile.put("from_no", empInfo2.getEmp_no());
		      
		        MediaDto mediaDto = mediaDao.selectMediaFromNo(profile);
		        if(mediaDto != null) {
		    	  String base64Img = Base64.getEncoder().encodeToString(mediaDto.getMedia_data());
		    	  alarmResponse.setBase64(base64Img);
		        }
				
				list.add(alarmResponse);
			} else if ("채팅".equals(alarm.getAlarm_type())) {
				ChatMessage chatMsg = new ChatMessage();
				chatMsg = chatService.getChatMessage(alarm.getAlarm_typeNo());
				int empInfoNo = chatMsg.getEmpInfo_no();
				EmployeeInfo empInfo3 = employeeService.getEmpInfoByEmpInfoNo(empInfoNo);
				String empInfo3Name = empInfo3.getEmpinfo_name();
				alarmResponse.setEmp_name(empInfo3Name);
				List<String> myList = Arrays.asList("bg-label-success", "bg-label-primary", "bg-label-warning", "bg-label-danger", "bg-label-info", "bg-label-dark", "bg-label-secondary");
		        int randomIndex = (empInfo3.getEmp_no()%7);
				alarmResponse.setTwo_name_color(myList.get(randomIndex));
				
				alarmResponse.setTwo_name(empInfo3.getEmpinfo_name().substring(empInfo3.getEmpinfo_name().length() - 2));
				Map<String, Object> profile = new HashMap<>();
				profile.put("media_from", "EMP");
				profile.put("from_no", empInfo3.getEmp_no());
		      
		        MediaDto mediaDto = mediaDao.selectMediaFromNo(profile);
		        if(mediaDto != null) {
		    	  String base64Img = Base64.getEncoder().encodeToString(mediaDto.getMedia_data());
		    	  alarmResponse.setBase64(base64Img);
		        }
				
				list.add(alarmResponse);
				
			} else if ("프로그램".equals(alarm.getAlarm_type())) {
				alarmResponse.setAlarm_content(alarm.getAlarm_content());
				list.add(alarmResponse);
			} else if("공지".equals(alarm.getAlarm_type())) {
				alarmResponse.setAlarm_content(alarm.getAlarm_content());
				list.add(alarmResponse);
			} else if("문의".equals(alarm.getAlarm_type())) {
				alarmResponse.setAlarm_content(alarm.getAlarm_content());
				Notice inquiry = inquiryService.getInquiryDetail(alarm.getAlarm_typeNo());
				alarmResponse.setEmp_name(inquiry.getEmpinfo_name());
				
				list.add(alarmResponse);
			} else if("댓글".equals(alarm.getAlarm_type())) {
				alarmResponse.setAlarm_content(alarm.getAlarm_content());
				Reply reply = inquiryService.getReplyByReplyNo(alarm.getAlarm_typeNo());
				alarmResponse.setEmp_name(reply.getEmpinfo_name());
				
				list.add(alarmResponse);
			} else if("필독".equals(alarm.getAlarm_type())) {
				alarmResponse.setAlarm_content(alarm.getAlarm_content());
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
	@PostMapping("/alarmRemoveAll")
	@ResponseBody
	public String alarmRemoveAll(String alarm, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		List<AlarmRequest> alarmList = alarmService.getAlarmList(empInfo.getEmpinfo_no());

		for(AlarmRequest alarmRequest : alarmList) {
			int alarmNo = alarmRequest.getAlarm_no();
			alarmService.deleteAlarm(alarmNo);
		}
		
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
	@PostMapping("/unReaderAlarm")
	@ResponseBody
	public String unReaderAlarm(String empInfo_no, String notice_no, Authentication authentication) {
		
		int empInfoNo = Integer.parseInt(empInfo_no);
		int noticeNo = Integer.parseInt(notice_no);
		log.info(empInfoNo+"나엠프인포");
		log.info(noticeNo+"노티스 넘버");
		
		Notice notice = noticeDao.selectDetailByNoticeNo(noticeNo);
		log.info(notice.toString()+"나노티스");
		AlarmRequest alarm = new AlarmRequest();
		alarm.setAlarm_content(notice.getNotice_title());
		alarm.setAlarm_isRead(false);
		alarm.setAlarm_type("필독");
		alarm.setAlarm_typeNo(noticeNo);
		alarm.setEmpinfo_no(empInfoNo);
		
		alarmDao.insertAlarm(alarm);
		
		return "redirect:/alarm";
		
	}
	
	 @GetMapping("/getUckAlarmNo")
	 @ResponseBody
     public Map<String, Integer> getUckAlarmNo(Authentication authentication) {
	    EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		 
		 int uckNo = alarmService.uckAlarmCount(empInfo.getEmpinfo_no());
		 int uckChatNo = chatService.getUckChatMsgAll(empInfo.getEmpinfo_no());
		 
		 
		 
		 
		 

        // 숫자 값을 Map에 담아 JSON으로 반환
        Map<String, Integer> response = new HashMap<>();
        response.put("uckNo", uckNo);
        response.put("uckChatNo", uckChatNo);

        return response;
     }
	 
	 @GetMapping("/getUserInfo")
	 @ResponseBody
	 public Map<String, Object> getUserInfo(Authentication authentication) {
		 EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		 LoginResponse loginResponse = empDetails.getLoginResponse();
		 EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		 
		 List<String> myList = Arrays.asList("bg-label-success", "bg-label-primary", "bg-label-warning", "bg-label-danger", "bg-label-info", "bg-label-dark", "bg-label-secondary");
         int randomIndex = (loginResponse.getEmp_no()%7);
		 Map<String, Object> profile = new HashMap<>();
		 profile.put("media_from", "EMP");
		 profile.put("from_no", loginResponse.getEmp_no());
      
		 String base64 = "";
         MediaDto mediaDto = mediaDao.selectMediaFromNo(profile);
         if(mediaDto != null) {
    	   base64 = Base64.getEncoder().encodeToString(mediaDto.getMedia_data());
    	  
         }
		
		 String two_name = empInfo.getEmpinfo_name().substring(empInfo.getEmpinfo_name().length() - 2);
		 String two_name_color = myList.get(randomIndex);
		 
		 
		 // 숫자 값을 Map에 담아 JSON으로 반환
		 Map<String, Object> response = new HashMap<>();
		 response.put("two_name", two_name);
		 response.put("two_name_color", two_name_color);
		 response.put("base64", base64);
		 
		 return response;
	 }
	 
	 @GetMapping("/getInquiryNo")
	 @ResponseBody
	 public int getInquiryNo(Authentication authentication, String reply_no) {
		 EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		 LoginResponse loginResponse = empDetails.getLoginResponse();
		 log.info(reply_no+"뀨?잘받아오니?");
		 EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		 int replyNo = Integer.parseInt(reply_no);
		 Reply reply = inquiryService.getReplyByReplyNo(replyNo);
		 log.info(reply.toString()+"리플라이 못가져오니?ㅇㅅㅇ");
		 int response = reply.getNotice_no();
		 
		 
		 // 숫자 값을 Map에 담아 JSON으로 반환
		 
		 
		 return response;
	 }

}
