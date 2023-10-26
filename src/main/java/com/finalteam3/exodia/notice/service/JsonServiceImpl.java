package com.finalteam3.exodia.notice.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.finalteam3.exodia.notice.dao.NoticeDao;
import com.finalteam3.exodia.notice.dto.Notice;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Service
public class JsonServiceImpl implements JsonService{
	@Resource
	private NoticeDao noticeDao;

	@Override
    public void saveDataJson(List<Notice> dataList) {
        ObjectMapper objectMapper = new ObjectMapper();

        try {
        	List<Notice> noticeDataList = noticeDao.selectNoticeAll();
            // List<Data>를 JSON 문자열로 변환
            String jsonData = objectMapper.writeValueAsString(noticeDataList);

            // 파일에 JSON 데이터를 저장
            File outputFile = new File("notice-list.json");
            objectMapper.writeValue(outputFile, dataList);

        } catch (IOException e) {
            e.printStackTrace();
            // 저장 중 오류 발생 시 에러 로깅
        }
    }
}
