package com.finalteam3.exodia.notice.service;

import java.util.List;

import com.finalteam3.exodia.media.dto.MediaDto;
import com.finalteam3.exodia.notice.dto.Notice;

public interface NoticeService {
	public List<Notice> getNoticeList(); //공지사항 목록
	public List<Notice> getMainNoticeList(); //메인페이지 공지사항 목록
	public Notice getNoticeDetail(int notice_no); //공지사항 세부내용
	public int write(Notice notice); //공지사항 작성
	public void updateByNotice(Notice notice); //공지사항 내용 업데이트
	public void deleteByNoticeNo(int notice_no);//공지사항 삭제(update임) -> deletedat을 업데이트
	public List<MediaDto> getMediaList(int noticeNo);//첨부파일 가져오기
}
