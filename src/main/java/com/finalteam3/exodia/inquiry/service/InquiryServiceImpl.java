package com.finalteam3.exodia.inquiry.service;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finalteam3.exodia.inquiry.dao.InquiryDao;
import com.finalteam3.exodia.inquiry.dto.Reply;
import com.finalteam3.exodia.media.dao.MediaDao;
import com.finalteam3.exodia.media.dto.MediaDto;
import com.finalteam3.exodia.notice.dto.Notice;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class InquiryServiceImpl implements InquiryService{
	@Resource
	private InquiryDao inquiryDao;
	@Resource
	private MediaDao mediaDao;

	@Override
	public List<Notice> getInquiryList() {
	    List<Notice> list = inquiryDao.selectInquiryAll();

	    // 새로운 notice_no2를 저장할 리스트
	    List<Integer> newNoticeNo2List = new ArrayList<>();

	    // 공지사항 목록을 notice_no로 오름차순 정렬
	    list.sort(Comparator.comparing(Notice::getNotice_no));

	    // notice_no를 1부터 시작하여 재정의하고, 정렬된 notice_no2를 notice_no2에 저장
	    AtomicInteger counter = new AtomicInteger(1);
	    list.forEach(notice -> {
	        notice.setNotice_no2(counter.getAndIncrement());
	        newNoticeNo2List.add(notice.getNotice_no2());
	        notice.setReplyCount(inquiryDao.selectReplyCount(notice.getNotice_no()));
	    });

	    log.info("문의사항listlistlistlsit : " + list);
	    log.info("새로운 notice_no2 리스트: " + newNoticeNo2List);

	    return list;
	}
	
	

	@Override
	public int write(Notice notice) {
		return inquiryDao.insertInquiry(notice);
	}

	@Override
	public void updateByInquiry(Notice notice) {
		inquiryDao.updateDetailByInquiryNo(notice);		
	}

	@Override
	public Notice getInquiryDetail(int notice_no) {
		Notice notice = inquiryDao.selectDetailByNoticeNo(notice_no);
		
		Map<String, Object> profile = new HashMap<>();
		profile.put("media_from", "EMP");
		profile.put("from_no", notice.getEmp_no());
		MediaDto mediaDto = mediaDao.selectMediaFromNo(profile);
	    
		if(mediaDto != null) {
	    	String base64Img = Base64.getEncoder().encodeToString(mediaDto.getMedia_data());
	    	notice.setPhoto(base64Img);
	    }
		
		String twoname = notice.getEmpinfo_name().substring(notice.getEmpinfo_name().length()-2);
		notice.setTwoname(twoname);

		return notice;
	}
	
	@Override
	public List<MediaDto> getMediaList(int noticeNo) {
		MediaDto media = new MediaDto();
		media.setMedia_from("NOTICE");
		media.setFrom_no(noticeNo);
		
		List<MediaDto> mediaList = mediaDao.selectMedia(media);
		
		return mediaList;
	}
	
	@Override
	public Map<String, Object> getReplyByNoticeNo(int notice_no) {
		
		List<Reply> replyList = inquiryDao.selectReplyByNoticeNo(notice_no);
		
		for(Reply re: replyList) {
			
			Map<String, Object> profile = new HashMap<>();
			profile.put("media_from", "EMP");
			profile.put("from_no", re.getEmp_no());
			MediaDto mediaDto = mediaDao.selectMediaFromNo(profile);
			
			if(mediaDto != null) {
				String base64Img = Base64.getEncoder().encodeToString(mediaDto.getMedia_data());
				re.setPhoto(base64Img);
			}
			
			String twoname = re.getEmpinfo_name().substring(re.getEmpinfo_name().length()-2);
			re.setTwoname(twoname);
		}
		
		int replyCount = replyList.size();
		
		Map<String, Object> result = new HashMap<>();
		result.put("replyList", replyList);
		result.put("replyCount", replyCount);
		
		
		
		return result;
	}
	
	@Override
	public void deleteByNoticeNo(int notice_no) {
		inquiryDao.deleteByNoticeNo(notice_no);		
	}

	@Override
	public void replyWrite(Reply reply) {
		inquiryDao.insertReply(reply);
		
	}

	@Override
	public void deleteReplyByReplyNo(int reply_no) {
		inquiryDao.deleteByReplyNo(reply_no);
		
	}

	@Override
	public int replyEmpinfoNo(int emp_no) {
		return inquiryDao.selectEmpInfoNo(emp_no);		
	}

	@Override
	public int getEmpInfoNoByEmpNo(int emp_no) {
		return inquiryDao.selectEmpInfoNoByEmpNo(emp_no);
	}

	@Override
	public Reply getReplyByReplyNo(int replyNo) {
		return inquiryDao.selectReplyByReplyNo(replyNo);
	}
	
}
