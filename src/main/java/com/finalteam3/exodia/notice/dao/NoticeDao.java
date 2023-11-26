package com.finalteam3.exodia.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.notice.dto.Notice;
import com.finalteam3.exodia.notice.dto.NoticeUnreader;
import com.finalteam3.exodia.notice.dto.RecentNotice;

@Mapper
public interface NoticeDao {
	public List<Notice> selectNoticeAll();
	public List<Notice> selectMainNotice();
	public Notice selectDetailByNoticeNo(int notice_no);
	public int insertNotice(Notice notice);
	public void updateDetailByNoticeNo(Notice notice);
	public void deleteByNoticeNo(int notice_no);
	public RecentNotice selectRecentNotice();
	public RecentNotice selectRecentInquiry();
	public void insertNoticeReaders(Map<String, Object> map);
	public List<Notice> selectNoticeReaders(Map<String, Object> map);
	public List<NoticeUnreader> selectUnReader(int notice_no);
	public void deleteNoticeReaders(int notice_no);
	public List<Notice> selectPname();
}
