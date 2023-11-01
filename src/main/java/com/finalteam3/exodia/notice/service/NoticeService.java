package com.finalteam3.exodia.notice.service;

import java.util.List;

import com.finalteam3.exodia.notice.dto.Notice;

public interface NoticeService {
	public List<Notice> getNoticeList(); //공지사항 목록
	public Notice getNoticeDetail(int notice_no); //공지사항 세부내용
	public void write(Notice notice); //공지사항 작성

}
