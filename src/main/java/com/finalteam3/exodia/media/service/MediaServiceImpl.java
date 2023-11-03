package com.finalteam3.exodia.media.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finalteam3.exodia.media.dao.MediaDao;
import com.finalteam3.exodia.media.dto.MediaDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MediaServiceImpl implements MediaService {
	@Resource 
	private MediaDao mediaDao;
	
	
	
	@Override
	public MediaDto getMedia(int mno) {
		MediaDto media = mediaDao.selectMediaByMno(mno);
		
		return media;
	}



	@Override
	public void insertNoticeFile(MediaDto mediaDto) {
		mediaDao.insertMedia(mediaDto);
		
	}

}
