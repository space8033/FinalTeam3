package com.finalteam3.exodia.notice.service;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.finalteam3.exodia.media.dao.MediaDao;
import com.finalteam3.exodia.media.dto.MediaDto;
import com.finalteam3.exodia.notice.dao.NoticeDao;
import com.finalteam3.exodia.notice.dto.Notice;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoticeServiceImpl implements NoticeService{
	@Resource
	private NoticeDao noticeDao;
	@Resource
	private MediaDao mediaDao;
	

	@Override
	public List<Notice> getNoticeList() {
		List<Notice> list = noticeDao.selectNoticeAll();
		return list;
	}
	
	@Override
	public Notice getNoticeDetail(int notice_no) {
		Notice notice = noticeDao.selectDetailByNoticeNo(notice_no);
		return notice;
	}

	@Override
	public int write(Notice notice){
		return noticeDao.insertNotice(notice);
	}

	@Override
	public void updateByNotice(Notice notice) {
		noticeDao.updateDetailByNoticeNo(notice);		
	}

	@Override
	public void deleteByNoticeNo(int notice_no) {
		noticeDao.deleteByNoticeNo(notice_no);		
	}
	
}
