package com.finalteam3.exodia.media.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.media.dto.MediaDto;

@Mapper
public interface MediaDao {
	public void insertMedia(MediaDto media);
	public List<MediaDto> selectMedia(MediaDto media);
	public MediaDto selectMediaByMno(int mno);
}
