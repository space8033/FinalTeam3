package com.finalteam3.exodia.media.service;

import com.finalteam3.exodia.media.dto.MediaDto;

public interface MediaService {
	public MediaDto getMedia(int mno);

	public void insertNoticeFile(MediaDto mediaDto);

}
