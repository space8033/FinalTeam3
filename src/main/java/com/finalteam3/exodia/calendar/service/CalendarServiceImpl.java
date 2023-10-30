package com.finalteam3.exodia.calendar.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finalteam3.exodia.calendar.dao.CalendarDao;
import com.finalteam3.exodia.calendar.dto.request.CalendarRequest;
import com.finalteam3.exodia.calendar.dto.response.CalendarResponse;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CalendarServiceImpl implements CalendarService{
	@Resource
	private CalendarDao calendarDao;

	@Override
	public void write(CalendarRequest calendarRequest) {
		calendarDao.insert(calendarRequest);
		
	}

	@Override
	public CalendarResponse getPersonalTask(int emp_no) {
		log.info("캘린더서비스 empno :" + emp_no);
		CalendarResponse response = calendarDao.selectCalendarTask(emp_no);
		log.info("캘린더서비스 response :" + response);
		return response;
	}


}
