package com.finalteam3.exodia.calendar.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finalteam3.exodia.calendar.dao.CalendarDao;
import com.finalteam3.exodia.calendar.dto.request.CalendarRequest;

@Service
public class CalendarServiceImpl implements CalendarService{
	@Resource
	private CalendarDao calendarDao;

	@Override
	public void write(CalendarRequest calendarRequest) {
		calendarDao.insert(calendarRequest);
		
	}

}
