package com.finalteam3.exodia.calendar.dao;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.calendar.dto.request.CalendarRequest;

@Mapper
public interface CalendarDao {

	public void insert(CalendarRequest calendarRequest);

}
