package com.finalteam3.exodia.calendar.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.calendar.dto.request.CalendarRequest;
import com.finalteam3.exodia.calendar.dto.response.CalendarResponse;

@Mapper
public interface CalendarDao {

	public void insert(CalendarRequest calendarRequest);
	public CalendarResponse selectCalendarTask(int emp_no);


}
