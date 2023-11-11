package com.finalteam3.exodia.inquiry.controller;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.finalteam3.exodia.employee.dao.EmployeeDao;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.employee.service.EmployeeService;
import com.finalteam3.exodia.inquiry.dto.Inquiry;
import com.finalteam3.exodia.inquiry.dto.Reply;
import com.finalteam3.exodia.inquiry.service.InquiryService;
import com.finalteam3.exodia.media.dto.MediaDto;
import com.finalteam3.exodia.media.service.MediaService;
import com.finalteam3.exodia.notice.dto.Notice;
import com.finalteam3.exodia.notice.service.NoticeService;
import com.finalteam3.exodia.security.dto.EmpDetails;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class InquiryController {
	@Resource
	private InquiryService inquiryService;

	@Resource
	private MediaService mediaService;
	
	@Resource
	private EmployeeDao employeeDao;
	
	@Resource
	private EmployeeService employeeService;
	
	//문의사항 리스트 조회
	@GetMapping("/inquiryList")
	public String inquiryList(Model model, Authentication authentication){				
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		return "inquiryList";
	}
	
	//공지사항 리스트 json화
	@ResponseBody
	@GetMapping("/inquiryListJson")
	public String inquiryListJson(Authentication authentication, Model model) throws JsonProcessingException {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		
		List<Notice> data = inquiryService.getInquiryList();	
		
		//data를 json데이터로 바꾸기
        ObjectMapper objectMapper = new ObjectMapper();
        String jsonData = objectMapper.writeValueAsString(data);
        
        
		return jsonData;
	}
	
	//공지사항 추가1
		@GetMapping("/inquiryAdd")
		public String inquiryAddForm(Authentication authentication, Model model) {
			EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
			LoginResponse loginResponse = empDetails.getLoginResponse();
			String emp_id = loginResponse.getEmp_id();
			model.addAttribute("emp_id", emp_id);
			
			List<String> tNames = employeeDao.selectTeamname(0);
			model.addAttribute("tNames", tNames);
			
			String emp_name = loginResponse.getEmpInfo_name();
			model.addAttribute("empInfo_name", emp_name);
			
			log.info("팀이름이 뭔데" + model);
			
			return "inquiryAdd";
		}
		
		@PostMapping("/inquiryAdd")
		public String noticeAdd(Authentication authentication,
				@RequestParam("noticeTitle") String noticeTitle,
				@RequestParam("noticeContent") String noticeContent,
				@RequestParam("files") List<MultipartFile> mfs) throws Exception {
			EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
			LoginResponse loginResponse = empDetails.getLoginResponse();
			int emp_no = loginResponse.getEmp_no();
			Notice notice = new Notice();
			notice.setNotice_title(noticeTitle);
			notice.setNotice_content(noticeContent);
			notice.setEmpinfo_no_writer(emp_no);
			inquiryService.write(notice);
			
			int noticeNo = notice.getNotice_no();
			
			for(MultipartFile mf : mfs) {
						if(!mf.isEmpty()) {
					MediaDto mediaDto = new MediaDto();
					mediaDto.setFrom_no(noticeNo);
					mediaDto.setMedia_name(mf.getOriginalFilename());
					mediaDto.setMedia_type(mf.getContentType());
					mediaDto.setMedia_data(mf.getBytes());
					mediaDto.setMedia_from("NOTICE");
					
					mediaService.insertNoticeFile(mediaDto);
						}
			}
			return "redirect:/inquiryList";
		}
		
		//쪽지 파일 다운로드
		@GetMapping("/inquiryFileDownload")
		public void inquiryFileDownload(int mno, HttpServletRequest request, HttpServletResponse response) throws Exception{
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
		
		//문의사항 상세정보 열람
		@GetMapping("/inquiryDetail")
		public String inquiryDetail(Authentication authentication,@RequestParam("notice_no") int notice_no, Model model){
			EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
			LoginResponse loginResponse = empDetails.getLoginResponse();
			
			model.addAttribute("loginResponse", loginResponse);
			model.addAttribute("now_emp_no", loginResponse.getEmp_no());
			
			int empinfoNo = inquiryService.getEmpInfoNoByEmpNo(loginResponse.getEmp_no());
			model.addAttribute("now_empinfo_no", empinfoNo);

			Notice notice = inquiryService.getInquiryDetail(notice_no);				
			List<MediaDto> mediaList = inquiryService.getMediaList(notice.getNotice_no());
			List<Reply> replyList = inquiryService.getReplyByNoticeNo(notice_no);

		    model.addAttribute("notice", notice);
		    model.addAttribute("mediaList", mediaList);
		    model.addAttribute("replyList", replyList);
		    log.info("notice : " + notice);
		    
		    int empNo = employeeDao.selectNoByEmpName(loginResponse.getEmpInfo_name());
		    	    		    	
			return "inquiryDetail";
		}
				
		//댓글 등록
		@PostMapping("/replyAdd")
		public String replyAdd(Authentication authentication, @RequestParam("notice_no") Integer notice_no,
				@RequestParam("reply_content") String replyContent) throws Exception {
			EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
			LoginResponse loginResponse = empDetails.getLoginResponse();
			int emp_no = loginResponse.getEmp_no();
			
			int empinfo_no = inquiryService.replyEmpinfoNo(emp_no);
			
			log.info("공지사항 번호 : " + notice_no);
			Reply reply = new Reply();
			reply.setNotice_no(notice_no);
			reply.setReply_content(replyContent);
			reply.setEmpinfo_no(empinfo_no);
			
			inquiryService.replyWrite(reply);		
			log.info("댓글작성버튼이 눌려?");
			log.info("댓글 입력 시 db로 넘어가는 값들 :" + reply);	
			return "inquiryDetail";
		}
				
		//공지사항 업데이트1
		@GetMapping("/inquiryUpdate")
		public String inquiryUpdateForm(Authentication authentication, int notice_no, Model model) {
			EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
			LoginResponse loginResponse = empDetails.getLoginResponse();
			
			Notice notice = inquiryService.getInquiryDetail(notice_no);
			model.addAttribute("notice", notice);
			log.info("문의사하 ㅇ업데이트 문의사항 번호? :" + notice);
			
			return "inquiryUpdate";
		}
		
		//공지사항 업데이트2
		@PostMapping("/inquiryUpdate")
		public String inquiryUpdateForm(Authentication authentication, int notice_no, Notice notice) {
			EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
			LoginResponse loginResponse = empDetails.getLoginResponse();
			
			inquiryService.updateByInquiry(notice);

			return "inquiryList";
		}
		
		//문의사항 삭제
		@PostMapping("/inquiryDelete")
		public String inquiryDelete(Authentication authentication, int notice_no) {
			
			EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
			LoginResponse loginResponse = empDetails.getLoginResponse();
			
			inquiryService.deleteByNoticeNo(notice_no);
			
			return "inquiryList";
		}
		
		//댓글 삭제
		@PostMapping("/replyDelete")
		public String replyDelete(Authentication authentication, @RequestParam int reply_no) {

			EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
			LoginResponse loginResponse = empDetails.getLoginResponse();
			
			inquiryService.deleteReplyByReplyNo(reply_no);
			
			return "redirect:/inquiryList";
		}

}
