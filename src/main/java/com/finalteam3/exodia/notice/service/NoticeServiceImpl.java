package com.finalteam3.exodia.notice.service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finalteam3.exodia.alarm.dao.AlarmDao;
import com.finalteam3.exodia.media.dao.MediaDao;
import com.finalteam3.exodia.media.dto.MediaDto;
import com.finalteam3.exodia.notice.dao.NoticeDao;
import com.finalteam3.exodia.notice.dto.Notice;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoticeServiceImpl implements NoticeService{
	@Resource
	private NoticeDao noticeDao;
	@Resource
	private MediaDao mediaDao;
	@Resource
	private AlarmDao alarmDao;

	@Override
	public List<Notice> getNoticeList() {
		List<Notice> list = noticeDao.selectNoticeAll();
		return list;
	}
	
	@Override
	public Notice getNoticeDetail(int notice_no) {
		Notice notice = noticeDao.selectDetailByNoticeNo(notice_no);
		return notice;
	}

	@Override
	public int write(Notice notice){
		
		return noticeDao.insertNotice(notice);
	}

	@Override
	public void updateByNotice(Notice notice) {
		noticeDao.updateDetailByNoticeNo(notice);		
	}

	@Override
	public void deleteByNoticeNo(int notice_no) {
		noticeDao.deleteByNoticeNo(notice_no);		
	}

	@Override
	public List<MediaDto> getMediaList(int noticeNo) {
		MediaDto media = new MediaDto();
		media.setMedia_from("NOTICE");
		media.setFrom_no(noticeNo);
		
		List<MediaDto> mediaList = mediaDao.selectMedia(media);
		
		return mediaList;
	}

	@Override
	public List<Notice> getMainNoticeList() {
		List<Notice> list = noticeDao.selectNoticeAll();
		
		// notice_no를 기준으로 내림차순 정렬
        List<Notice> sortedList = list.stream()
                .sorted(Comparator.comparingInt(Notice::getNotice_no).reversed())
                // 상위 5개 추출
                .limit(3)
                // 다시 정렬
                .sorted(Comparator.comparingInt(Notice::getNotice_no))
                .collect(Collectors.toList());

        // 최대 5개의 요소만 추출
        List<Notice> top5List = sortedList.subList(0, Math.min(5, sortedList.size()));

        // 새로운 리스트에 복사
        List<Notice> list2 = new ArrayList<>(top5List);
	    return list2;
	}
	
}
