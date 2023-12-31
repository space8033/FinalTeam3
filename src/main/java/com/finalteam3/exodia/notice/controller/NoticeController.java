package com.finalteam3.exodia.notice.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
import com.finalteam3.exodia.alarm.service.AlarmService;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.media.dao.MediaDao;
import com.finalteam3.exodia.media.dto.MediaDto;
import com.finalteam3.exodia.media.service.MediaService;
import com.finalteam3.exodia.notice.dao.NoticeDao;
import com.finalteam3.exodia.notice.dto.Notice;
import com.finalteam3.exodia.notice.dto.NoticeUnreader;
import com.finalteam3.exodia.notice.service.NoticeService;
import com.finalteam3.exodia.security.dto.EmpDetails;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class NoticeController {
	@Resource
	private NoticeService noticeService;

	@Resource
	private MediaService mediaService;
	
	@Resource
	private AlarmService alarmService;
	
	@Resource
	private MediaDao mediaDao;
	
	@Resource
	private NoticeDao noticeDao;
	
	//공지사항 리스트 조회
	@GetMapping("/noticeList")
	public String noticeList(Authentication authentication, Model model){
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		int emp_no = empDetails.getLoginResponse().getEmp_no();
		String emp_id = loginResponse.getEmp_id();
		
		model.addAttribute("empInfo_name", loginResponse.getEmpInfo_name());
		model.addAttribute("emp_id", emp_id);
		model.addAttribute("emp_no", emp_no);
		
        return "noticeList";
	}
	
	//공지사항 리스트 json화
	@ResponseBody
	@PostMapping("/noticeListJson")
	public List<Notice> noticeListJson(Authentication authentication) throws JsonProcessingException {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		//int emp_no = empDetails.getLoginResponse().getEmp_no();
		
		List<Notice> data = noticeService.getNoticeList();
		
		//data를 json데이터로 바꾸기
       /* ObjectMapper objectMapper = new ObjectMapper();
        String jsonData = objectMapper.writeValueAsString(data);
        
        log.info("jsonData로 바꿈 : " + jsonData);*/
        
        
		return data;
	}
	
	//공지사항 추가1
	@GetMapping("/noticeAdd")
	public String noticeAddForm(Authentication authentication, Model model) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		List<Notice> pNames = noticeDao.selectPname();
		List<String> projectNames = pNames.stream()
                .map(Notice::getProject_name)
                .collect(Collectors.toList());

				model.addAttribute("projectNames", projectNames);
		
		return "noticeAdd";
	}
	
	//공지사항 추가2
	@PostMapping("/noticeAdd")
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
		noticeService.write(notice);
		
		int noticeNo = notice.getNotice_no();
		
		alarmService.insertNoticeAlarm(notice);
		
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
		return "redirect:/noticeList";
	}
		
	//공지사항 파일 다운로드
	@GetMapping("/noticeFileDownload")
	public void noticeFileDownload(int mno, HttpServletRequest request, HttpServletResponse response) throws Exception{
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
	
	//공지사항 업데이트
	@GetMapping("/noticeUpdate")
	public String noticeUpdateForm(Authentication authentication, int notice_no, Model model) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		model.addAttribute("empInfo_name", loginResponse.getEmpInfo_name());
		Notice notice = noticeService.getNoticeDetail(notice_no);
		model.addAttribute("notice", notice);
		
		List<MediaDto> mediaList = noticeService.getMediaList(notice.getNotice_no());
	    model.addAttribute("mediaList", mediaList);
	    
		
		return "noticeUpdate";
	}
	
	//공지사항 업데이트
	@PostMapping("/noticeUpdate")
	public String noticeUpdateForm(Authentication authentication,
			@RequestParam("noticeNo") int noticeNo,
			@RequestParam("noticeTitle") String noticeTitle,
			@RequestParam("noticeContent") String noticeContent,
			@RequestParam("files") List<MultipartFile> mfs) throws IOException {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		
		Notice notice = new Notice();
		notice.setNotice_no(noticeNo);
		notice.setNotice_title(noticeTitle);
		notice.setNotice_content(noticeContent);
		noticeService.updateByNotice(notice);
		
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

		return "redirect:/noticeList";
	}
	
	//공지사항 상세정보 열람
	@GetMapping("/noticeDetail")
	public String noticeDetail(Authentication authentication, int notice_no, Model model){
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		model.addAttribute("emp_id", emp_id);
		model.addAttribute("empInfo_name", loginResponse.getEmpInfo_name());
		model.addAttribute("now_emp_no", loginResponse.getEmp_no());

		Notice notice = noticeService.getNoticeDetail(notice_no);		
		model.addAttribute("notice", notice);
		
		List<MediaDto> mediaList = noticeService.getMediaList(notice.getNotice_no());
	    model.addAttribute("mediaList", mediaList);
	    
	    Map<String, Object> map = new HashMap<>();
	    map.put("notice_no", notice.getNotice_no());
	    map.put("empinfo_no", loginResponse.getEmpInfo_no());
	    noticeService.insertNoticeReaders(map);   
	    
	    List<NoticeUnreader> unReaders = noticeService.getUnReader(notice_no);
	    
	    for(NoticeUnreader unReader : unReaders) {
	    	unReader.setNotice_no(notice_no);
	    }   
	    
	    model.addAttribute("unReaders", unReaders);
	    
	    Map<String, Object> profile = new HashMap<>();
		profile.put("media_from", "EMP");
		profile.put("from_no", 0);
		MediaDto mediaDto = mediaDao.selectMediaFromNo(profile);
	    
		if(mediaDto != null) {
	    	String base64Img = Base64.getEncoder().encodeToString(mediaDto.getMedia_data());
	    	model.addAttribute("base64", base64Img);
	    }
		
		return "noticeDetail";
	}
	
	//공지사항 삭제
	@PostMapping("/noticeDelete")
	public String noticeDelete(Authentication authentication, int notice_no) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		
		noticeService.deleteByNoticeNo(notice_no);
		alarmService.deleteNoticeAlarm(notice_no);
		
		return "noticeList";
	}
	
	//첨부파일 삭제
	@PostMapping("/mediaDelete")
	public String mediaDelete(Authentication authentication, @RequestParam("media_no") int media_no) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		
		mediaService.deleteMediaByMediaNo(media_no);
		
		return "noticeDetail";
	}

}
