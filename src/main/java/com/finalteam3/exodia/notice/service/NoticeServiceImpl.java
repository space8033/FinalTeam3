package com.finalteam3.exodia.notice.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finalteam3.exodia.notice.dao.NoticeDao;
import com.finalteam3.exodia.notice.dto.Notice;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoticeServiceImpl implements NoticeService{
	@Resource
	private NoticeDao noticeDao;

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
	public void write(Notice notice) {
		noticeDao.insertNotice(notice);
	}

	@Override
	public void updateByNotice(Notice notice) {
		noticeDao.updateDetailByNoticeNo(notice);		
	}
	
}
