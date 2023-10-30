package com.finalteam3.exodia.media.dao;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.media.dto.MediaDto;

@Mapper
public interface MediaDao {
	public void insertMedia(MediaDto media);
}
