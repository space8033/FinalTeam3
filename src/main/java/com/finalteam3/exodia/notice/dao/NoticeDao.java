package com.finalteam3.exodia.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.notice.dto.Notice;

import lombok.Data;

@Mapper
public interface NoticeDao {
	public List<Notice> selectNoticeAll();
	public Notice selectDetailByNoticeNo(int notice_no);
	public int insertNotice(Notice notice);
	public void updateDetailByNoticeNo(Notice notice);
}
