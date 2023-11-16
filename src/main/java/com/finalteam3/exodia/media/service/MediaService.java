package com.finalteam3.exodia.media.service;

import java.util.Map;

import com.finalteam3.exodia.media.dto.MediaDto;

public interface MediaService {
	public MediaDto getMedia(int mno);
	public void insertNoticeFile(MediaDto mediaDto);
	public MediaDto getMediaByFromNo(Map<String, Object> map);
	public void deleteMediaByFromNo(Map<String, Object> map);
	public void deleteMediaByMediaNo(int media_no);
}
