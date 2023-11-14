package com.finalteam3.exodia.media.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.media.dto.MediaDto;

@Mapper
public interface MediaDao {
	public void insertMedia(MediaDto media);
	public List<MediaDto> selectMedia(MediaDto media);
	public MediaDto selectMediaByMno(int mno);
	public MediaDto selectMediaFromNo(Map<String, Object> map);
	public void deleteMediaByFromNo(Map<String, Object> map);
	public void deleteMediaByMediaNo(int media_no);
}
