package com.finalteam3.exodia.note.controller;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalteam3.exodia.employee.dto.response.EmpModifyResponse;
import com.finalteam3.exodia.employee.dto.response.EmpNote;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.employee.service.EmployeeService;
import com.finalteam3.exodia.media.dao.MediaDao;
import com.finalteam3.exodia.media.dto.MediaDto;
import com.finalteam3.exodia.media.service.MediaService;
import com.finalteam3.exodia.note.dto.EmployeeInfo;
import com.finalteam3.exodia.note.dto.NoteAll;
import com.finalteam3.exodia.note.dto.Pager;
import com.finalteam3.exodia.note.dto.request.Note;
import com.finalteam3.exodia.note.dto.request.NoteRead;
import com.finalteam3.exodia.note.dto.request.NoteRequest;
import com.finalteam3.exodia.note.dto.request.ReplyRequest;
import com.finalteam3.exodia.note.dto.response.NoteResponse;
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
	@Resource
	private MediaService mediaService;
	@Resource
	private MediaDao mediaDao;
	
	
	@GetMapping("/note")
	public String note(String pageNote, HttpSession session, @RequestParam(name= "inbox", required=false) String inbox, @RequestParam(name= "noteReadNo", required=false) String noteReadNo, String emp_no, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		Map<String, Object> profile = new HashMap<>();
		profile.put("media_from", "EMP");
		profile.put("from_no", loginResponse.getEmp_no());
		log.info(emp_no+"empNo 인력검색 잘받아오나");
		if(emp_no != null) {
			
			model.addAttribute("emp_no", emp_no);
		}
		
		
      
        MediaDto mediaDto = mediaDao.selectMediaFromNo(profile);
        if(mediaDto != null) {
    	  String base64Img = Base64.getEncoder().encodeToString(mediaDto.getMedia_data());
    	  model.addAttribute("base64", base64Img);
        }
		
		
		
		List<String> teamList = noteService.getTeamList();
		List<EmpNote> empList = noteService.getEmpList();
		model.addAttribute("teamList", teamList);
		model.addAttribute("empList", empList);
		
		int unReadCount = noteService.countByUnreadNoteNo(loginResponse.getEmp_no());
		model.addAttribute("unReadCount", unReadCount);
		int draftCount = noteService.countByNoteDraftNo(loginResponse.getEmp_no());
		model.addAttribute("draftCount", draftCount);
		int starredCount = noteService.countByNoteStarredNo(loginResponse.getEmp_no());
		model.addAttribute("starredCount", starredCount);
		int trashCount = noteService.countByNoteTrashNo(loginResponse.getEmp_no());
		model.addAttribute("trashCount", trashCount);
		
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
	
	//노트 디테일 팝업
	@GetMapping("/noteDetailView")
	public String noteDetailView(HttpSession session, @RequestParam(name= "noteReadNo", required=false) String noteReadNo, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		log.info(noteReadNo+"먼값이 들어오나 보자");
		int noteRead_No = Integer.parseInt(noteReadNo);
		NoteRead noteRead = noteService.getNoteRead(noteRead_No);
		log.info(noteRead.toString()+"모지?");
		model.addAttribute("noteRead", noteRead);
		
		Note note = noteService.getNote(noteRead_No);
		model.addAttribute("note", note);
		EmployeeInfo sender = employeeService.getEmpInfoByEmpInfoNo(note.getNote_sender());
		String name = sender.getEmpinfo_name();
		String email = sender.getEmpinfo_email();
				
		
		List<String> myList = Arrays.asList("bg-label-success", "bg-label-primary", "bg-label-warning", "bg-label-danger", "bg-label-info", "bg-label-dark", "bg-label-secondary");
        int randomIndex = (sender.getEmp_no()%7);
		Map<String, Object> profile = new HashMap<>();
		profile.put("media_from", "EMP");
		profile.put("from_no", sender.getEmp_no());
      
		String base64 = "";
        MediaDto mediaDto = mediaDao.selectMediaFromNo(profile);
        if(mediaDto != null) {
    	  base64 = Base64.getEncoder().encodeToString(mediaDto.getMedia_data());
    	  
        }
		
		String two_name = sender.getEmpinfo_name().substring(sender.getEmpinfo_name().length() - 2);
		String two_name_color = myList.get(randomIndex);
		model.addAttribute("two_name", two_name);
		model.addAttribute("two_name_color", two_name_color);
		model.addAttribute("base64", base64);
		
		model.addAttribute("name", name);
		model.addAttribute("email", email);
		
		List<MediaDto> mediaList = noteService.getMediaList(note.getNote_no());
		
		model.addAttribute("mediaList", mediaList);
		
		List<NoteResponse> noteResponseList = noteService.getNoteReceiver(note.getNote_no(), loginResponse.getEmp_no());
		model.addAttribute("list", noteResponseList);
		
		return "/noteDetailView";
	}
	
	@GetMapping("/sentNoteDetailView")
	public String sentNoteDetailView(HttpSession session, @RequestParam(name= "noteNo", required=false) String noteNo, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		log.info(noteNo+"먼값이 들어오나 보자");
		int note_no = Integer.parseInt(noteNo);
		Note note = noteService.getNoteSent(note_no);
		
		model.addAttribute("note", note);
		EmployeeInfo sender = employeeService.getEmpInfo(note.getNote_sender());
		String name = sender.getEmpinfo_name();
		String email = sender.getEmpinfo_email();
		
		model.addAttribute("name", name);
		
		List<MediaDto> mediaList = noteService.getMediaList(note.getNote_no());
		
		model.addAttribute("mediaList", mediaList);
		
		String contentType = "발신";
		model.addAttribute("contentType", contentType);
		List<String> myList = Arrays.asList("bg-label-success", "bg-label-primary", "bg-label-warning", "bg-label-danger", "bg-label-info", "bg-label-dark", "bg-label-secondary");
        int randomIndex = (sender.getEmp_no()%7);
		Map<String, Object> profile = new HashMap<>();
		profile.put("media_from", "EMP");
		profile.put("from_no", sender.getEmp_no());
      
		String base64 = "";
        MediaDto mediaDto = mediaDao.selectMediaFromNo(profile);
        if(mediaDto != null) {
    	  base64 = Base64.getEncoder().encodeToString(mediaDto.getMedia_data());
    	  
        }
		
		String two_name = sender.getEmpinfo_name().substring(sender.getEmpinfo_name().length() - 2);
		String two_name_color = myList.get(randomIndex);
		model.addAttribute("email", email);
		model.addAttribute("two_name", two_name);
		model.addAttribute("two_name_color", two_name_color);
		model.addAttribute("base64", base64);
		
		
		
		List<NoteResponse> noteResponseList = noteService.getNoteReceiver(note.getNote_no(), loginResponse.getEmp_no());
		model.addAttribute("list", noteResponseList);
		
		return "/noteDetailView";
	}
	
	//수신 쪽지함 불러오기
	@GetMapping("/noteInbox")
	public String noteInbox(String pageInbox, HttpSession session, @RequestParam(name= "inbox", required=false) String inbox, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		log.info("내 페이지 넘버는 1?" + pageInbox);
		if(pageInbox == null) {
			//세션에 저장되어 있는지 확인
			pageInbox = (String) session.getAttribute("pageInbox");
			//저장되어있지 않다면 "1"로 초기화
			log.info("내 페이지 넘버는 2?" + pageInbox);
			
			if(pageInbox == null || pageInbox == "0") {
				pageInbox = "1";
			}
			
		}
		log.info("내 페이지 넘버는 3?" + pageInbox);
		
		int empNo = empInfo.getEmpinfo_no();
		
		
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageInbox);
		//세션에 pageNo를 저장
		session.setAttribute("pageInbox", String.valueOf(pageInbox));
		int totalRows = noteService.countByNoteNo(empNo);
		log.info("내 totalRows 넘버는 ?" + totalRows);
		
		Pager pager = new Pager(10, 5, totalRows, intPageNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("startRowNo", pager.getStartRowNo());
		map.put("endRowNo", pager.getEndRowNo());
		map.put("empNo", empNo);
		
		List<NoteAll> list = noteService.getNoteListByRno(map);
		log.info("내 list 가온나 " + list.toString());
		
		model.addAttribute("pager", pager);
		model.addAttribute("list", list);
		String contentType = "수신";
		model.addAttribute("contentType", contentType);
		
		
		return "/noteContent";
	}
	//수신 쪽지함 검색하기
	@GetMapping("/noteInboxSearch")
	public String noteInboxSearch(String pageInboxSearch, HttpSession session, @RequestParam(name= "searchKeyword", required=false) String searchKeyword, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		log.info("내 페이지 넘버는 1?" + pageInboxSearch);
		log.info("서치 키워드는?" + searchKeyword);
		if(pageInboxSearch == null) {
			//세션에 저장되어 있는지 확인
			pageInboxSearch = (String) session.getAttribute("pageInboxSearch");
			//저장되어있지 않다면 "1"로 초기화
			log.info("내 페이지 넘버는 2?" + pageInboxSearch);
			
			if(pageInboxSearch == null || pageInboxSearch == "0") {
				pageInboxSearch = "1";
			}
			
		}
		log.info("내 페이지 넘버는 3?" + pageInboxSearch);
		
		int empNo = empInfo.getEmpinfo_no();
		log.info("내 엠프넘버는?" + empNo);
		
		Map<String, Object> mapCount = new HashMap<>();
		mapCount.put("empNo", empNo);
		mapCount.put("searchKeyword", searchKeyword);
		log.info("어디서 막히는거임?");
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageInboxSearch);
		//세션에 pageNo를 저장
		session.setAttribute("pageInboxSearch", String.valueOf(pageInboxSearch));
		int totalRows = noteService.countBySearchNoteNo(mapCount);
		log.info("내 totalRows 넘버는 ?" + totalRows);
		
		Pager pager = new Pager(10, 5, totalRows, intPageNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("startRowNo", pager.getStartRowNo());
		map.put("endRowNo", pager.getEndRowNo());
		map.put("empNo", empNo);
		map.put("searchKeyword", searchKeyword);
		
		List<NoteAll> list = noteService.getNoteSearchListByRno(map);
		log.info("내 list 가온나 " + list.toString());
		
		model.addAttribute("pager", pager);
		model.addAttribute("list", list);
		String contentType = "수신";
		model.addAttribute("contentType", contentType);
		model.addAttribute("searchKeyword", searchKeyword);
		
		
		return "/noteContent";
	}
	//발신 쪽지함 검색하기
	@GetMapping("/noteSentSearch")
	public String noteSentSearch(String pageSentSearch, HttpSession session, @RequestParam(name= "searchKeyword", required=false) String searchKeyword, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		
		if(pageSentSearch == null) {
			   //세션에 저장되어 있는지 확인
			pageSentSearch = (String) session.getAttribute("pageSentSearch");
			   //저장되어있지 않다면 "1"로 초기화
			   if(pageSentSearch == null) {
				   pageSentSearch = "1";
			   }
		}
		
		int empNo = empInfo.getEmpinfo_no();
		
		
		Map<String, Object> mapCount = new HashMap<>();
		mapCount.put("empNo", empNo);
		mapCount.put("searchKeyword", searchKeyword);
		
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageSentSearch);
		//세션에 pageNo를 저장
		session.setAttribute("pageSentSearch", String.valueOf(pageSentSearch));
		log.info("여기까지 ok2");
		int totalRows = noteService.countBySearchNoteSenderNo(mapCount);
		log.info(totalRows+"나전체숫자");
		
		Pager pager = new Pager(10, 5, totalRows, intPageNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("startRowNo", pager.getStartRowNo());
		map.put("endRowNo", pager.getEndRowNo());
		map.put("empNo", empNo);
		map.put("searchKeyword", searchKeyword);
		
		List<NoteAll> list = noteService.getNoteSentSearchListByRno(map);
			
		model.addAttribute("pager", pager);
		model.addAttribute("list", list);
		String contentType = "발신";
		model.addAttribute("contentType", contentType);
		model.addAttribute("searchKeyword", searchKeyword);
		
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
	
	//임시저장함 세부-> 메세지 전송
	@GetMapping("/sentDraft")
	public String sentDraft(String pageSent,@RequestParam("noteNo") String noteNo, HttpSession session, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		int note_no = Integer.parseInt(noteNo);
		noteService.sendDraftNote(note_no);
		
		
		
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
	
	//임시저장 검색 쪽지함 불러오기
	@GetMapping("/noteDraftSearch")
	public String noteDraftSearch(String pageDraftSearch, @RequestParam(name= "searchKeyword", required=false) String searchKeyword, HttpSession session, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		
		if(pageDraftSearch == null) {
			//세션에 저장되어 있는지 확인
			pageDraftSearch = (String) session.getAttribute("pageDraftSearch");
			//저장되어있지 않다면 "1"로 초기화
			if(pageDraftSearch == null) {
				pageDraftSearch = "1";
			}
		}
		
		int empNo = empInfo.getEmpinfo_no();
		
		

		Map<String, Object> mapCount = new HashMap<>();
		mapCount.put("empNo", empNo);
		mapCount.put("searchKeyword", searchKeyword);
		
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageDraftSearch);
		//세션에 pageNo를 저장
		session.setAttribute("pageDraftSearch", String.valueOf(pageDraftSearch));
		log.info("여기까지 ok2");
		int totalRows = noteService.countBySearchNoteDraftNo(mapCount);
		log.info(totalRows+"나전체숫자");
		
		Pager pager = new Pager(10, 5, totalRows, intPageNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("startRowNo", pager.getStartRowNo());
		map.put("endRowNo", pager.getEndRowNo());
		map.put("empNo", empNo);
		map.put("searchKeyword", searchKeyword);
		log.info(map+"여기까지 맵임ok3");
		
		List<NoteAll> list = noteService.getNoteDraftSearchListByRno(map);
		log.info(list+"여기까지 ok3");
		
		model.addAttribute("pager", pager);
		model.addAttribute("list", list);
		String contentType = "임시저장";
		model.addAttribute("contentType", contentType);
		model.addAttribute("searchKeyword", searchKeyword);
		
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
	
	//중요쪽지함 검색 불러오기
	@GetMapping("/noteStarredSearch")
	public String noteStarredSearch(String pageStarredSearch, @RequestParam(name= "searchKeyword", required=false) String searchKeyword, HttpSession session, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		if(pageStarredSearch == null) {
			//세션에 저장되어 있는지 확인
			pageStarredSearch = (String) session.getAttribute("pageStarredSearch");
			//저장되어있지 않다면 "1"로 초기화
			if(pageStarredSearch == null) {
				pageStarredSearch = "1";
			}
		}
		
		int empNo = empInfo.getEmpinfo_no();
		Map<String, Object> mapCount = new HashMap<>();
		mapCount.put("empNo", empNo);
		mapCount.put("searchKeyword", searchKeyword);
		
		
		
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageStarredSearch);
		//세션에 pageNo를 저장
		session.setAttribute("pageStarred", String.valueOf(pageStarredSearch));
		log.info("여기까지 ok2");
		int totalRows = noteService.countBySearchNoteStarredNo(mapCount);
		log.info(totalRows+"나전체숫자");
		
		Pager pager = new Pager(10, 5, totalRows, intPageNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("startRowNo", pager.getStartRowNo());
		map.put("endRowNo", pager.getEndRowNo());
		map.put("empNo", empNo);
		map.put("searchKeyword", searchKeyword);
		log.info(map+"여기까지 맵임ok3");
		
		List<NoteAll> list = noteService.getNoteStarredSearchListByRno(map);
		log.info(list+"여기까지 ok3");
		
		model.addAttribute("pager", pager);
		model.addAttribute("list", list);
		String contentType = "중요";
		model.addAttribute("contentType", contentType);
		model.addAttribute("searchKeyword", searchKeyword);
		
		log.info("여기까지 ok4");
		
		return "/noteContent";
	}
	
	//휴지통 쪽지 검색
	@GetMapping("/noteTashSearch")
	public String noteTashSearch(String pageTrashSearch, @RequestParam(name= "searchKeyword", required=false) String searchKeyword, HttpSession session, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		if(pageTrashSearch == null) {
			//세션에 저장되어 있는지 확인
			pageTrashSearch = (String) session.getAttribute("pageTrashSearch");
			//저장되어있지 않다면 "1"로 초기화
			if(pageTrashSearch == null) {
				pageTrashSearch = "1";
			}
		}
		
		int empNo = empInfo.getEmpinfo_no();
		Map<String, Object> mapCount = new HashMap<>();
		mapCount.put("empNo", empNo);
		mapCount.put("searchKeyword", searchKeyword);
		
		
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageTrashSearch);
		//세션에 pageNo를 저장
		session.setAttribute("pageTrashSearch", String.valueOf(pageTrashSearch));
		log.info("여기까지 ok2");
		int totalRows = noteService.countBySearchNoteTrashNo(mapCount);
		log.info(totalRows+"나전체숫자");
		
		Pager pager = new Pager(10, 5, totalRows, intPageNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("startRowNo", pager.getStartRowNo());
		map.put("endRowNo", pager.getEndRowNo());
		map.put("empNo", empNo);
		map.put("searchKeyword", searchKeyword);
		log.info(map+"여기까지 맵임ok3");
		
		List<NoteAll> list = noteService.getNoteTrashSearchListByRno(map);
		log.info(list+"여기까지 ok3");
		
		model.addAttribute("pager", pager);
		model.addAttribute("list", list);
		String contentType = "휴지통";
		model.addAttribute("contentType", contentType);
		model.addAttribute("searchKeyword", searchKeyword);
		
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
		NoteRead noteRead = noteService.getNoteRead(noteRead_No);
		log.info(noteRead.toString()+"모지?");
		model.addAttribute("noteRead", noteRead);
		
		Note note = noteService.getNote(noteRead_No);
		model.addAttribute("note", note);
		EmployeeInfo sender = employeeService.getEmpInfoByEmpInfoNo(note.getNote_sender());
		String name = sender.getEmpinfo_name();
		String email = sender.getEmpinfo_email();
				
		List<String> myList = Arrays.asList("bg-label-success", "bg-label-primary", "bg-label-warning", "bg-label-danger", "bg-label-info", "bg-label-dark", "bg-label-secondary");
        int randomIndex = (sender.getEmp_no()%7);
		Map<String, Object> profile = new HashMap<>();
		profile.put("media_from", "EMP");
		profile.put("from_no", sender.getEmp_no());
      
		String base64 = "";
        MediaDto mediaDto = mediaDao.selectMediaFromNo(profile);
        if(mediaDto != null) {
    	  base64 = Base64.getEncoder().encodeToString(mediaDto.getMedia_data());
    	  
        }
		
		String two_name = sender.getEmpinfo_name().substring(sender.getEmpinfo_name().length() - 2);
		String two_name_color = myList.get(randomIndex);
		model.addAttribute("name", name);
		model.addAttribute("email", email);
		model.addAttribute("two_name", two_name);
		model.addAttribute("two_name_color", two_name_color);
		model.addAttribute("base64", base64);
		
		List<MediaDto> mediaList = noteService.getMediaList(note.getNote_no());
		
		model.addAttribute("mediaList", mediaList);
		
		List<NoteResponse> noteResponseList = noteService.getNoteReceiver(note.getNote_no(), loginResponse.getEmp_no());
		model.addAttribute("list", noteResponseList);
		
		
		return "/noteDetail";
	}
	
	//임시저장 편집 파일 불러오기
	@PostMapping("/editFileGet")
	@ResponseBody
	public String editFileGet(String fileValues, HttpSession session, Model model, Authentication authentication) {
		log.info(fileValues+"파일밸류알려달라");
		List<MediaDto> mediaList = noteService.selectMediaFiles(fileValues);
		
		
		
		return "/noteDetail";
	}
	
	//쪽지 상세 발신 불러오기
	@GetMapping("/noteDetailSent")
	public String noteDetailSent(String noteNo, HttpSession session, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		log.info(noteNo+"먼값이 들어오나 보자");
		int note_no = Integer.parseInt(noteNo);
		Note note = noteService.getNoteSent(note_no);
		
		model.addAttribute("note", note);
		EmployeeInfo sender = employeeService.getEmpInfoByEmpInfoNo(note.getNote_sender());
		String name = sender.getEmpinfo_name();
		String email = sender.getEmpinfo_email();
		
		
		List<String> myList = Arrays.asList("bg-label-success", "bg-label-primary", "bg-label-warning", "bg-label-danger", "bg-label-info", "bg-label-dark", "bg-label-secondary");
        int randomIndex = (sender.getEmp_no()%7);
		Map<String, Object> profile = new HashMap<>();
		profile.put("media_from", "EMP");
		profile.put("from_no", sender.getEmp_no());
      
		String base64 = "";
        MediaDto mediaDto = mediaDao.selectMediaFromNo(profile);
        if(mediaDto != null) {
    	  base64 = Base64.getEncoder().encodeToString(mediaDto.getMedia_data());
    	  
        }
		
		String two_name = sender.getEmpinfo_name().substring(sender.getEmpinfo_name().length() - 2);
		String two_name_color = myList.get(randomIndex);
		model.addAttribute("name", name);
		model.addAttribute("email", email);
		model.addAttribute("two_name", two_name);
		model.addAttribute("two_name_color", two_name_color);
		model.addAttribute("base64", base64);
		
		
		
		
		
		
		
		List<MediaDto> mediaList = noteService.getMediaList(note.getNote_no());
		
		model.addAttribute("mediaList", mediaList);
		
		String contentType = "발신";
		model.addAttribute("contentType", contentType);
		
		List<NoteResponse> noteResponseList = noteService.getNoteReceiverSent(note.getNote_no(), loginResponse.getEmp_no());
		model.addAttribute("list", noteResponseList);
		
		
		return "/noteDetail";
	}
	
	//쪽지 상세 임시저장 불러오기
	@GetMapping("/noteDetailDraft")
	public String noteDetailDraft(String noteNo, HttpSession session, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		log.info(noteNo+"먼값이 들어오나 보자");
		int note_no = Integer.parseInt(noteNo);
		Note note = noteService.getNoteSent(note_no);
		
		model.addAttribute("note", note);
		EmployeeInfo sender = employeeService.getEmpInfoByEmpInfoNo(note.getNote_sender());
		String name = sender.getEmpinfo_name();
		String email = sender.getEmpinfo_email();
		
		model.addAttribute("name", name);
		
		List<MediaDto> mediaList = noteService.getMediaList(note.getNote_no());
		
		model.addAttribute("mediaList", mediaList);
		
		String contentType = "임시저장";
		model.addAttribute("contentType", contentType);
		List<String> myList = Arrays.asList("bg-label-success", "bg-label-primary", "bg-label-warning", "bg-label-danger", "bg-label-info", "bg-label-dark", "bg-label-secondary");
        int randomIndex = (sender.getEmp_no()%7);
		Map<String, Object> profile = new HashMap<>();
		profile.put("media_from", "EMP");
		profile.put("from_no", sender.getEmp_no());
      
		String base64 = "";
        MediaDto mediaDto = mediaDao.selectMediaFromNo(profile);
        if(mediaDto != null) {
    	  base64 = Base64.getEncoder().encodeToString(mediaDto.getMedia_data());
    	  
        }
		
		String two_name = sender.getEmpinfo_name().substring(sender.getEmpinfo_name().length() - 2);
		String two_name_color = myList.get(randomIndex);
		model.addAttribute("email", email);
		model.addAttribute("two_name", two_name);
		model.addAttribute("two_name_color", two_name_color);
		model.addAttribute("base64", base64);
		
		
		List<NoteResponse> noteResponseList = noteService.getNoteReceiverSent(note.getNote_no(), loginResponse.getEmp_no());
		model.addAttribute("list", noteResponseList);
		
		
		return "/noteDetail";
	}
	
	//발송취소 목록 불러오기
	@GetMapping("/noteSentCancelList")
	public String noteSentCancelList(String noteNo, HttpSession session, Model model, Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		model.addAttribute("empInfo", empInfo);
		
		log.info(noteNo+"먼값이 들어오나 보자");
		int note_no = Integer.parseInt(noteNo);
		List<NoteResponse> list = noteService.getNoteSentList(note_no);
		model.addAttribute("list", list);
		boolean hasNoReferenceTypeCC = list.stream()
			    .noneMatch(noteResponse -> "참조".equals(noteResponse.getNoteRead_type()));
		
		model.addAttribute("noCC", hasNoReferenceTypeCC);
		boolean hasNoReferenceTypeBCC = list.stream()
			    .noneMatch(noteResponse -> "비밀참조".equals(noteResponse.getNoteRead_type()));
		model.addAttribute("noBCC", hasNoReferenceTypeBCC);
		
		
		
		return "/noteContentModal";
	}
	
	
	//쪽지 파일 다운로드
	@GetMapping("/noteFileDownload")
	public void noteFileDownload(int mno, HttpServletRequest request, HttpServletResponse response) throws Exception{
		MediaDto media = mediaService.getMedia(mno);
		String fileOriginalName = media.getMedia_name();
		String mimeType = media.getMedia_type();
		response.setContentType(mimeType);
		
		String userAgent = request.getHeader("User-Agent");
		if(userAgent.contains("Trident") || userAgent.contains("MSIE")) {
			fileOriginalName = URLEncoder.encode(fileOriginalName, "UTF-8");
			
		} else {
			fileOriginalName = new String(fileOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			
		}
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileOriginalName + "\"");
		
		OutputStream os = response.getOutputStream();
		os.write(media.getMedia_data());
		os.flush();
		os.close();
		
	}
	
	
	//쪽지 발송
	@PostMapping("/noteSend")
	public String noteSend(NoteRequest request, Authentication authentication) throws Exception {
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
	public String replySend(ReplyRequest request, Authentication authentication) throws Exception {
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
	
	//발송 취소
	@PostMapping("/noteSentCancel")
	@ResponseBody
	public Map<String, String> noteSentCancel(String noteReadNo) {
		 Map<String, String> response = new HashMap<>();
		String noCancel = noteService.noteSentCancel(noteReadNo);
		response.put("noCancel", noCancel);
	    return response;
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
	
	//발신 쪽지 휴지통보내기
	@PostMapping("/deleteSentNote")
	@ResponseBody
	public String deleteSentNote(String checkedIdsString, String contentType) {
		
		noteService.checkTrashSent(checkedIdsString);
		
		return "redirect:/note";
	}
	
	//쪽지 휴지통 비우기
	@PostMapping("/deleteTrashNote")
	@ResponseBody
	public String deleteTrashNote(String checkedIdsString, String contentType) {
		
		noteService.deleteTrash(checkedIdsString);
		
		return "redirect:/note";
	}
	
	//휴지통 쪽지 복구하기
	@PostMapping("/recoveryNote")
	@ResponseBody
	public String recoveryNote(String checkedIdsString) {
		
		noteService.recoverTrashNote(checkedIdsString);
		
		return "redirect:/note";
	}
	
	//임시저장
	@PostMapping("/draftNote")
	@ResponseBody
	public String draftNote(NoteRequest request, Authentication authentication) throws Exception {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		request.setNote_sender(loginResponse.getEmp_no());
		log.info(request.getNote_receiver()+"수신자");
		log.info(request.getNote_receiver_cc()+"씨씨");
		log.info(request.getNote_receiver_bcc()+"비씨씨");
		log.info(request.getNote_title()+"주제");
		log.info(request.getNote_content()+"내용");
		log.info(request.getFiles()+"파일들");
		
		noteService.addDraft(request);
		
		return "redirect:/note";
	}
	
	//실시간 수신메세지함 갯수변경
	@GetMapping("/getUckNoteNo")
	@ResponseBody
	public Map<String, Integer> getUckNoteNo(Authentication authentication) {
	    EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		 
		 int uckNo = noteService.countByUnreadNoteNo(loginResponse.getEmp_no());
		 Map<String, Integer> response = new HashMap<>();
	     response.put("uckNo", uckNo);
		
		return response;
	}
	
	//실시간 메세지함 개수변경
	@GetMapping("/updateNoteNo")
	@ResponseBody
	public Map<String, Integer> updateNoteNo(Authentication authentication) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		EmployeeInfo empInfo = employeeService.getEmpInfo(loginResponse.getEmp_no());
		
		int empNo = loginResponse.getEmp_no();
		int uckNo = noteService.countByUnreadNoteNo(empNo);
		int trashNo = noteService.countByNoteTrashNo(empNo);
		int draftNo = noteService.countByNoteDraftNo(empNo);
		int starredNo = noteService.countByNoteStarredNo(empNo);
		
		Map<String, Integer> response = new HashMap<>();
		response.put("uckNo", uckNo);
		response.put("trashNo", trashNo);
		response.put("draftNo", draftNo);
		response.put("starredNo", starredNo);
		log.info(uckNo+"수신"+trashNo+"휴지"+draftNo+"임시"+starredNo+"중요");
		
		return response;
	}
	
	
}
