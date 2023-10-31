package com.finalteam3.exodia.notice.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finalteam3.exodia.notice.dao.NoticeDetailDao;
import com.finalteam3.exodia.notice.dto.Notice;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoticeDetailServiceImpl implements NoticeDetailService{
	@Resource
	private NoticeDetailDao noticeDetailDao;

	@Override
	public Notice getNoticeDetail(int notice_no) {
		Notice notice = noticeDetailDao.selectByNoticeNo(notice_no);
		return notice;
	}
	
}
