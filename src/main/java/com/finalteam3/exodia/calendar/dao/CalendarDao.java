package com.finalteam3.exodia.calendar.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.calendar.dto.request.CalendarRequest;
import com.finalteam3.exodia.calendar.dto.response.CalendarResponse;

@Mapper
public interface CalendarDao {

	public void insert(CalendarRequest calendarRequest);
	public List<CalendarResponse> selectCalendarTask(int emp_no);
	public List<CalendarResponse> selectCalendarTeamTask(String team_name);
	public void updateContentByTaskNo(CalendarRequest CalendarRequest);
	public void deleteCalendar(int task_no);
	
}
