package com.finalteam3.exodia.calendar.service;

import java.util.List;

import com.finalteam3.exodia.calendar.dto.request.CalendarRequest;
import com.finalteam3.exodia.calendar.dto.response.CalendarResponse;
import com.finalteam3.exodia.calendar.dto.response.CalendarResponse2;

public interface CalendarService {
	// 캘린더에 업무 추가하기
	public void write(CalendarRequest calendarRequest);
	
	//캘린더에 업무 불러오기
	public List<CalendarResponse2> getPersonalTask(int emp_no);
	
}
