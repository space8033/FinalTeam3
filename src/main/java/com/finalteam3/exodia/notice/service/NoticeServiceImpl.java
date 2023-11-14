package com.finalteam3.exodia.notice.service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finalteam3.exodia.alarm.dao.AlarmDao;
import com.finalteam3.exodia.employee.dao.EmployeeDao;
import com.finalteam3.exodia.media.dao.MediaDao;
import com.finalteam3.exodia.media.dto.MediaDto;
import com.finalteam3.exodia.notice.dao.NoticeDao;
import com.finalteam3.exodia.notice.dto.Notice;
import com.finalteam3.exodia.notice.dto.NoticeUnreader;

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
	@Resource
	private EmployeeDao employeeDao;

	@Override
	public List<Notice> getNoticeList() {
		List<Notice> list = noticeDao.selectNoticeAll();
		return list;
	}
	
	@Override
	public Notice getNoticeDetail(int notice_no) {
		Notice notice = noticeDao.selectDetailByNoticeNo(notice_no);
		
			/*if(notice.getEmpinfo_no() != 0) {
				List<String> myList = Arrays.asList("bg-label-success", "bg-label-secondary", "bg-label-danger", "bg-label-info", "bg-label-warning", "bg-label-primary");
				int randomIndex = (notice.getEmpinfo_no()%6);
				
				String profileImagePath = employeeDao.  (notice.getEmpinfo_no());

		        Notice noticeProfile = new Notice();
		        noticeProfile.setProfile(profileImagePath);

		        noticeProfile.setEmpinfo_no(notice.getEmpinfo_no());
							

			}*/
		
		return notice;
	}

	@Override
	public int write(Notice notice){
		
		return noticeDao.insertNotice(notice);
	}

	@Override
	public void updateByNotice(Notice notice) {
		noticeDao.updateDetailByNoticeNo(notice);
		noticeDao.deleteNoticeReaders(notice.getNotice_no());
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

	@Override
	public void insertNoticeReaders(Map<String, Object> map) {
		
		List<Notice> checkReaders = noticeDao.selectNoticeReaders(map);

	    boolean shouldInsert = true;

	    // notice_no와 empinfo_no 비교, 중복된 값 아닐때만 insert
	    for (Notice reader : checkReaders) {
	        int noticeNoFromDB = reader.getNotice_no();
	        int empinfoNoFromDB = reader.getEmpinfo_no();

	        int noticeNoToInsert = (int) map.get("notice_no");
	        int empinfoNoToInsert = (int) map.get("empinfo_no");

	        if (noticeNoFromDB == noticeNoToInsert && empinfoNoFromDB == empinfoNoToInsert) {
	            shouldInsert = false;
	            break;
	        }
	    }

	    if (shouldInsert) {
	        noticeDao.insertNoticeReaders(map);
	    }
	}

	@Override
	public List<NoticeUnreader> getUnReader(int notice_no) {
	    return noticeDao.selectUnReader(notice_no);
	}
	
}
