package com.finalteam3.exodia.notice.service;

import java.util.List;

import com.finalteam3.exodia.notice.dto.Notice;

public interface NoticeService {
	public List<Notice> getNoticeList();
	public Notice getNoticeDetail(int notice_no);

}
