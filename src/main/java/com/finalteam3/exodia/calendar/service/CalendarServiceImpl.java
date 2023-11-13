package com.finalteam3.exodia.calendar.service;

import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finalteam3.exodia.calendar.dao.CalendarDao;
import com.finalteam3.exodia.calendar.dto.request.CalendarRequest;
import com.finalteam3.exodia.calendar.dto.response.CalendarColor;
import com.finalteam3.exodia.calendar.dto.response.CalendarResponse;
import com.finalteam3.exodia.calendar.dto.response.CalendarResponse2;

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
    public List<CalendarResponse2> getPersonalTask(int emp_no) {		
	    List<CalendarResponse> originalResponseList = calendarDao.selectCalendarTask(emp_no);
	    log.info("캘린더dto 1 : " + originalResponseList);
	    
	    List<CalendarResponse2> responseList = new ArrayList<>();

	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    int id = 1;
	    for (CalendarResponse response : originalResponseList) {
	    	CalendarColor cc = new CalendarColor();
	    	cc.setCalendar(response.getTask_type());
	    	
	        CalendarResponse2 response2 = new CalendarResponse2();
	        response2.setTask_no(response.getId());
	        response2.setId(id);
	        id++;
	        response2.setTitle(response.getTitle());
	        response2.setExtendedProps(cc);
	        //response2.setEmp_no(response.getEmp_no());
	        response2.setUrl("");
	        response2.setDescription(response.getTask_content());
	        try {
	            Date start = dateFormat.parse(response.getStart());
	            Date end = dateFormat.parse(response.getEnd());
	            response2.setStart(start);
	            response2.setEnd(end);
	        } catch (Exception e) {
	            e.printStackTrace();
	            // 날짜 변환 오류 처리
	        }

	        responseList.add(response2);
	    }

	    return responseList;
    }

	@Override
	public void delete(int task_no) {
		calendarDao.deleteCalendar(task_no);	
	}

	@Override
	public void updateByTaskNo(CalendarRequest calendarRequest) {
		calendarDao.updateContentByTaskNo(calendarRequest);
		
	}

	@Override
	public List<CalendarResponse2> getTeamTask(String team_name) {
		List<CalendarResponse> originalResponseList = calendarDao.selectCalendarTeamTask(team_name);
	    
	    List<CalendarResponse2> responseList = new ArrayList<>();

	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    int id = 1;
	    for (CalendarResponse response : originalResponseList) {
	    	CalendarColor cc = new CalendarColor();
	    	cc.setCalendar(response.getTask_type());
	    	
	    	String title = response.getEmpinfo_name() + "-" + response.getTask_name();
	    	
	        CalendarResponse2 response2 = new CalendarResponse2();
	        response2.setTask_no(response.getId());
	        response2.setId(id);
	        id++;
	        response2.setTitle(title);
	        response2.setExtendedProps(cc);
	        response2.setUrl("");
	        response2.setDescription(response.getTask_content());
	        try {
	            Date start = dateFormat.parse(response.getStart());
	            Date end = dateFormat.parse(response.getEnd());
	            response2.setStart(start);
	            response2.setEnd(end);
	        } catch (Exception e) {
	            e.printStackTrace();
	            // 날짜 변환 오류 처리
	        }

	        responseList.add(response2);
	    }

	    return responseList;
	}

}
