package com.finalteam3.exodia.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.notice.dto.Notice;

import lombok.Data;

@Mapper
public interface NoticeDao {
	public List<Notice> selectNoticeAll();
	//public List<Data> getDataList();
}
