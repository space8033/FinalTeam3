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

import com.finalteam3.exodia.employee.dto.response.EmpNote;
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
	public String note(String pageNote, HttpSession session, @RequestParam(name= "inbox", required=false) String inbox, @RequestParam(name= "noteReadNo", required=false) String noteReadNo, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		List<String> teamList = noteService.getTeamList();
		List<EmpNote> empList = noteService.getEmpList();
		model.addAttribute("teamList", teamList);
		model.addAttribute("empList", empList);
		
		
		if(pageNote == null) {
			   //세션에 저장되어 있는지 확인
			pageNote = (String) session.getAttribute("pageNote");
			   //저장되어있지 않다면 "1"로 초기화
			   if(pageNote == null) {
				   pageNote = "1";
			   }
		}
		
		int empNo = empInfo.getEmpinfo_no();
		
		
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNote);
		//세션에 pageNo를 저장
		session.setAttribute("pageNote", String.valueOf(pageNote));
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
		if(noteReadNo != null) {
			model.addAttribute("noteReadNo", noteReadNo);
		}
		log.info("여기까지 ok4");
		
		return "/note";
	}
	
	//수신 쪽지함 불러오기
	@GetMapping("/noteInbox")
	public String noteInbox(String pageInbox, HttpSession session, @RequestParam(name= "inbox", required=false) String inbox, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
	
		if(pageInbox == null) {
			//세션에 저장되어 있는지 확인
			pageInbox = (String) session.getAttribute("pageInbox");
			//저장되어있지 않다면 "1"로 초기화
			if(pageInbox == null) {
				pageInbox = "1";
			}
		}
		
		int empNo = empInfo.getEmpinfo_no();
		
		
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageInbox);
		//세션에 pageNo를 저장
		session.setAttribute("pageInbox", String.valueOf(pageInbox));
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
	public String noteSent(String pageSent,@RequestParam("noteSent") String noteSent, HttpSession session, Model model, Authentication authentication) {
		log.info(noteSent+"노트센트 잘받아오니");
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		
		if(pageSent == null) {
			   //세션에 저장되어 있는지 확인
			pageSent = (String) session.getAttribute("pageSent");
			   //저장되어있지 않다면 "1"로 초기화
			   if(pageSent == null) {
				   pageSent = "1";
			   }
		}
		
		int empNo = empInfo.getEmpinfo_no();
		
		
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageSent);
		//세션에 pageNo를 저장
		session.setAttribute("pageSent", String.valueOf(pageSent));
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
	public String noteDraft(String pageDraft,@RequestParam("noteDraft") String noteDraft, HttpSession session, Model model, Authentication authentication) {
		log.info(noteDraft+"노트임시 잘받아오니");
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		
		if(pageDraft == null) {
			//세션에 저장되어 있는지 확인
			pageDraft = (String) session.getAttribute("pageDraft");
			//저장되어있지 않다면 "1"로 초기화
			if(pageDraft == null) {
				pageDraft = "1";
			}
		}
		
		int empNo = empInfo.getEmpinfo_no();
		
		
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageDraft);
		//세션에 pageNo를 저장
		session.setAttribute("pageDraft", String.valueOf(pageDraft));
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
	public String noteStarred(String pageStarred,@RequestParam("noteStarred") String noteStarred, HttpSession session, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
	
		if(pageStarred == null) {
			//세션에 저장되어 있는지 확인
			pageStarred = (String) session.getAttribute("pageStarred");
			//저장되어있지 않다면 "1"로 초기화
			if(pageStarred == null) {
				pageStarred = "1";
			}
		}
		
		int empNo = empInfo.getEmpinfo_no();
		
		
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageStarred);
		//세션에 pageNo를 저장
		session.setAttribute("pageStarred", String.valueOf(pageStarred));
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
	public String noteTrash(String pageTrash, @RequestParam("noteTrash") String noteTrash, HttpSession session, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		if(pageTrash == null) {
			//세션에 저장되어 있는지 확인
			pageTrash = (String) session.getAttribute("pageTrash");
			//저장되어있지 않다면 "1"로 초기화
			if(pageTrash == null) {
				pageTrash = "1";
			}
		}
		
		int empNo = empInfo.getEmpinfo_no();
		
		
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageTrash);
		//세션에 pageNo를 저장
		session.setAttribute("pageTrash", String.valueOf(pageTrash));
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
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
	
		request.setNote_sender(empInfo.getEmpinfo_no());
		
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
	
	//휴지통 쪽지 복구하기
	@PostMapping("/recoveryNote")
	@ResponseBody
	public String recoveryNote(String checkedIdsString) {
		
		noteService.recoverTrashNote(checkedIdsString);
		
		return "redirect:/note";
	}
	
	
}
