package com.finalteam3.exodia.note.controller;

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

import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.employee.service.EmployeeService;
import com.finalteam3.exodia.note.dto.EmployeeInfo;
import com.finalteam3.exodia.note.dto.NoteAll;
import com.finalteam3.exodia.note.dto.Pager;
import com.finalteam3.exodia.note.dto.request.Note;
import com.finalteam3.exodia.note.dto.request.NoteRequest;
import com.finalteam3.exodia.note.dto.request.ReplyRequest;
import com.finalteam3.exodia.note.service.NoteService;
import com.finalteam3.exodia.security.dto.EmpDetails;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class NoteController {
	@Resource
	private EmployeeService employeeService;
	@Resource
	private NoteService noteService;
	
	
	@GetMapping("/note")
	public String note(String pageNo, HttpSession session, @RequestParam(name= "inbox", required=false) String inbox, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		if(pageNo == null) {
			   //세션에 저장되어 있는지 확인
			   pageNo = (String) session.getAttribute("pageNo");
			   //저장되어있지 않다면 "1"로 초기화
			   if(pageNo == null) {
				   pageNo = "1";
			   }
		}
		
		int empNo = empInfo.getEmpinfo_no();
		
		
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
		
		return "/note";
	}
	
	//수신 쪽지함 불러오기
	@GetMapping("/noteInbox")
	public String noteInbox(String pageNo, HttpSession session, @RequestParam(name= "inbox", required=false) String inbox, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
	
		if(pageNo == null) {
			//세션에 저장되어 있는지 확인
			pageNo = (String) session.getAttribute("pageNo");
			//저장되어있지 않다면 "1"로 초기화
			if(pageNo == null) {
				pageNo = "1";
			}
		}
		
		int empNo = empInfo.getEmpinfo_no();
		
		
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
		String contentType = "수신";
		model.addAttribute("contentType", contentType);
		
		log.info("여기까지 ok4");
		
		return "/noteContent";
	}
	
	//발신 쪽지함 불러오기
	@GetMapping("/noteSent")
	public String noteSent(String pageNo,@RequestParam("noteSent") String noteSent, HttpSession session, Model model, Authentication authentication) {
		log.info(noteSent+"노트센트 잘받아오니");
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		
		if(pageNo == null) {
			   //세션에 저장되어 있는지 확인
			   pageNo = (String) session.getAttribute("pageNo");
			   //저장되어있지 않다면 "1"로 초기화
			   if(pageNo == null) {
				   pageNo = "1";
			   }
		}
		
		int empNo = empInfo.getEmpinfo_no();
		
		
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);
		//세션에 pageNo를 저장
		session.setAttribute("pageNo", String.valueOf(pageNo));
		log.info("여기까지 ok2");
		int totalRows = noteService.countByNoteSenderNo(empNo);
		log.info(totalRows+"나전체숫자");
		
		Pager pager = new Pager(10, 5, totalRows, intPageNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("startRowNo", pager.getStartRowNo());
		map.put("endRowNo", pager.getEndRowNo());
		map.put("empNo", empNo);
		log.info(map+"여기까지 맵임ok3");
		
		List<NoteAll> list = noteService.getNoteSendListByRno(map);
		log.info(list+"여기까지 ok3");
			
		model.addAttribute("pager", pager);
		model.addAttribute("list", list);
		String contentType = "발신";
		model.addAttribute("contentType", contentType);
		
		
		log.info("여기까지 ok4");
		
		return "/noteContent";
	}
	
	//임시저장 쪽지함 불러오기
	@GetMapping("/noteDraft")
	public String noteDraft(String pageNo,@RequestParam("noteDraft") String noteDraft, HttpSession session, Model model, Authentication authentication) {
		log.info(noteDraft+"노트임시 잘받아오니");
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		
		if(pageNo == null) {
			//세션에 저장되어 있는지 확인
			pageNo = (String) session.getAttribute("pageNo");
			//저장되어있지 않다면 "1"로 초기화
			if(pageNo == null) {
				pageNo = "1";
			}
		}
		
		int empNo = empInfo.getEmpinfo_no();
		
		
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);
		//세션에 pageNo를 저장
		session.setAttribute("pageNo", String.valueOf(pageNo));
		log.info("여기까지 ok2");
		int totalRows = noteService.countByNoteDraftNo(empNo);
		log.info(totalRows+"나전체숫자");
		
		Pager pager = new Pager(10, 5, totalRows, intPageNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("startRowNo", pager.getStartRowNo());
		map.put("endRowNo", pager.getEndRowNo());
		map.put("empNo", empNo);
		log.info(map+"여기까지 맵임ok3");
		
		List<NoteAll> list = noteService.getNoteDraftListByRno(map);
		log.info(list+"여기까지 ok3");
		
		model.addAttribute("pager", pager);
		model.addAttribute("list", list);
		String contentType = "임시저장";
		model.addAttribute("contentType", contentType);
		
		
		log.info("여기까지 ok4");
		
		return "/noteContent";
	}
	
	//중요쪽지함 불러오기
	@GetMapping("/noteStarred")
	public String noteStarred(String pageNo,@RequestParam("noteStarred") String noteStarred, HttpSession session, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
	
		if(pageNo == null) {
			//세션에 저장되어 있는지 확인
			pageNo = (String) session.getAttribute("pageNo");
			//저장되어있지 않다면 "1"로 초기화
			if(pageNo == null) {
				pageNo = "1";
			}
		}
		
		int empNo = empInfo.getEmpinfo_no();
		
		
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);
		//세션에 pageNo를 저장
		session.setAttribute("pageNo", String.valueOf(pageNo));
		log.info("여기까지 ok2");
		int totalRows = noteService.countByNoteStarredNo(empNo);
		log.info(totalRows+"나전체숫자");
		
		Pager pager = new Pager(10, 5, totalRows, intPageNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("startRowNo", pager.getStartRowNo());
		map.put("endRowNo", pager.getEndRowNo());
		map.put("empNo", empNo);
		log.info(map+"여기까지 맵임ok3");
		
		List<NoteAll> list = noteService.getNoteStarredListByRno(map);
		log.info(list+"여기까지 ok3");
		
		model.addAttribute("pager", pager);
		model.addAttribute("list", list);
		String contentType = "중요";
		model.addAttribute("contentType", contentType);
		
		log.info("여기까지 ok4");
		
		return "/noteContent";
	}
	
	@GetMapping("/noteTrash")
	public String noteTrash(String pageNo,@RequestParam("noteTrash") String noteTrash, HttpSession session, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		if(pageNo == null) {
			//세션에 저장되어 있는지 확인
			pageNo = (String) session.getAttribute("pageNo");
			//저장되어있지 않다면 "1"로 초기화
			if(pageNo == null) {
				pageNo = "1";
			}
		}
		
		int empNo = empInfo.getEmpinfo_no();
		
		
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);
		//세션에 pageNo를 저장
		session.setAttribute("pageNo", String.valueOf(pageNo));
		log.info("여기까지 ok2");
		int totalRows = noteService.countByNoteTrashNo(empNo);
		log.info(totalRows+"나전체숫자");
		
		Pager pager = new Pager(10, 5, totalRows, intPageNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("startRowNo", pager.getStartRowNo());
		map.put("endRowNo", pager.getEndRowNo());
		map.put("empNo", empNo);
		log.info(map+"여기까지 맵임ok3");
		
		List<NoteAll> list = noteService.getNoteTrashListByRno(map);
		log.info(list+"여기까지 ok3");
		
		model.addAttribute("pager", pager);
		model.addAttribute("list", list);
		String contentType = "휴지통";
		model.addAttribute("contentType", contentType);
		
		log.info("여기까지 ok4");
		
		return "/noteContent";
	}
	
	//쪽지 상세 불러오기
	@GetMapping("/noteDetail")
	public String noteDetail(String noteReadNo, HttpSession session, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		log.info(noteReadNo+"먼값이 들어오나 보자");
		int noteRead_No = Integer.parseInt(noteReadNo);
		
		
		Note note = noteService.getNote(noteRead_No);
		model.addAttribute("note", note);
		EmployeeInfo sender = employeeService.getEmpInfo(note.getNote_sender());
		String name = sender.getEmpinfo_name();
				
		model.addAttribute("name", name);
		
		
		return "/noteDetail";
	}
	
	
	//쪽지 발송
	@PostMapping("/noteSend")
	public String noteSend(NoteRequest request, Authentication authentication) {
		log.info(request.toString());
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		request.setNote_sender(loginResponse.getEmp_no());
		
		noteService.addNote(request);
		
		return "redirect:/note";
	}
	
	//답장 발송
	@PostMapping("/replySend")
	public String replySend(ReplyRequest request, Authentication authentication) {
		log.info(request.toString());
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		request.setNote_sender(loginResponse.getEmp_no());
		
		noteService.addReply(request);
		
		return "redirect:/note";
	}
	
	//읽음 유무 업데이트
	@PostMapping("/readUpdate")
	@ResponseBody
	public String readUpdate(String readUpdateId) {
		log.info(readUpdateId+"controller 못들어오는건지");
		int readUpdateIdNo = Integer.parseInt(readUpdateId);
		noteService.updateRead(readUpdateIdNo);
		
		return "redirect:/note";
	}
	
	
	//중요쪽지 업데이트
	@PostMapping("/noteStarredUpdate")
	@ResponseBody
	public String noteStarredUpdate(String noteStarred, String noteReadNo) {
		int noteRead_no = Integer.parseInt(noteReadNo);
		
		
		noteService.updateStarred(noteRead_no, noteStarred);
		
		return "redirect:/note";
	}
	
	//쪽지 휴지통보내기
	@PostMapping("/trashNote")
	@ResponseBody
	public String trashNote(String checkedIdsString, String contentType) {
		
		noteService.checkTrash(checkedIdsString);
		
		return "redirect:/note";
	}
	
}
