package com.finalteam3.exodia.inquiry.service;

import java.util.List;
import java.util.Map;

import com.finalteam3.exodia.inquiry.dto.Reply;
import com.finalteam3.exodia.media.dto.MediaDto;
import com.finalteam3.exodia.notice.dto.Notice;

public interface InquiryService {
	public List<Notice> getInquiryList(); //공지사항 목록
	public Notice getInquiryDetail(int notice_no); //공지사항 세부내용
	public int write(Notice notice); //공지사항 작성
	public void updateByInquiry(Notice notice); //공지사항 내용 업데이트
	public void deleteByNoticeNo(int notice_no);//공지사항 삭제(update임) -> deletedat을 업데이트
	public List<MediaDto> getMediaList(int noticeNo);//첨부파일 가져오기
	public void replyWrite(Reply reply);//댓글 작성
	public Map<String, Object> getReplyByNoticeNo(int notice_no);//댓글 가져오기
	public void deleteReplyByReplyNo(int reply_no);//댓글 삭제
	public int replyEmpinfoNo(int emp_no); //emp_no를 통해 댓글db에 저장될 empinfo_no를 가져옴
	public int getEmpInfoNoByEmpNo(int emp_no); //emp_no를 가지고 empinfo_no구하기
	public Reply getReplyByReplyNo(int replyNo); //replyNo로 reply가져오기
	public void replyUpdate(Reply reply); //댓글 수정
}
