package com.finalteam3.exodia.inquiry.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finalteam3.exodia.inquiry.dao.InquiryDao;
import com.finalteam3.exodia.inquiry.dto.Inquiry;
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
	public List<Reply> getReplyByNoticeNo(int notice_no) {
		
		List<Reply> replyList = inquiryDao.selectReplyByNoticeNo(notice_no);
		return replyList;
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

	
}
