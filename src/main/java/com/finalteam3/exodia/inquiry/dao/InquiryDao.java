package com.finalteam3.exodia.inquiry.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.inquiry.dto.Inquiry;
import com.finalteam3.exodia.inquiry.dto.Reply;
import com.finalteam3.exodia.notice.dto.Notice;

import lombok.Data;

@Mapper
public interface InquiryDao {
	public List<Notice> selectInquiryAll();
	public int insertInquiry(Notice notice);
	public void updateDetailByInquiryNo(Notice notice);
	public Notice selectDetailByNoticeNo(int notice_no);
	public void deleteByNoticeNo(int notice_no);
	public void insertReply(Reply reply);
	public List<Reply> selectReplyByNoticeNo(int notice_no);
	public void deleteByReplyNo(int reply_no);
	public int selectEmpInfoNo(int emp_no);
	public int selectEmpInfoNoByEmpNo(int emp_no);
}
