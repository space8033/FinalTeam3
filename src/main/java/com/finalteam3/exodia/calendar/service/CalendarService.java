package com.finalteam3.exodia.calendar.service;

import java.util.List;

import com.finalteam3.exodia.calendar.dto.request.CalendarRequest;
import com.finalteam3.exodia.calendar.dto.response.CalendarResponse;

public interface CalendarService {
	// 캘린더에 업무 추가하기
	public void write(CalendarRequest calendarRequest);
	
	//캘린더에 업무 불러오기
	public CalendarResponse getPersonalTask(int emp_no);
	
}
