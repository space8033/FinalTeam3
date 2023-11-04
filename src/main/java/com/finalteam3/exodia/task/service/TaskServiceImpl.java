package com.finalteam3.exodia.task.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finalteam3.exodia.task.dao.TaskDao;
import com.finalteam3.exodia.task.dto.request.ProgramModifyRequest;
import com.finalteam3.exodia.task.dto.request.ProgramRegisterRequest;
import com.finalteam3.exodia.task.dto.response.ProgramListResponse;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class TaskServiceImpl implements TaskService{
	@Resource
	private TaskDao taskDao;
	
	@Override
	public void registerProgram(ProgramRegisterRequest request){
		String date = request.getTask_date();
		
		request.setStartDate(makeStartDate(date));
		request.setEndDate(makeEndDate(date));
		
		int emp_no = request.getEmp_notes().get(0).getEmp_no();
		request.setEmp_no(emp_no);
		
		taskDao.insertProgram(request);
	}
	
	private String makeStartDate(String task_date) {
	    String[] dates = task_date.split(" - ");
	    
	    DateFormat inputFormat = new SimpleDateFormat("MM/dd/yyyy");
        Date date;
		try {
			date = inputFormat.parse(dates[0]);
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			
			DateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
			String formattedDate = outputFormat.format(sqlDate);
			
			return formattedDate;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	private String makeEndDate(String task_date) {
		String[] dates = task_date.split(" - ");
		    
		DateFormat inputFormat = new SimpleDateFormat("MM/dd/yyyy");
        Date date;
		try {
			date = inputFormat.parse(dates[1]);
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			
			// 하루를 더한 날짜 얻기
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(sqlDate);
			calendar.add(Calendar.DAY_OF_YEAR, 1);
			Date nextDay = calendar.getTime();
			
			// 출력 형식
			DateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
			String formattedNextDay = outputFormat.format(nextDay);
			
			return formattedNextDay;
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<ProgramListResponse> getAllBusinessProgram() {
		List<ProgramListResponse> list= taskDao.selectBusinessTask();
		
		int id = 1;
		for(ProgramListResponse res : list) {
			res.setId(id);
			id++;
			String start = res.getTask_startdate().substring(2).replace('-', '.').substring(0, 8);
			String end = res.getTask_enddate().substring(2).replace('-', '.').substring(0, 8);
			
			String period = start + " ~ " + end;
			res.setTask_date(period);
			
			if(res.getTask_status().equals("미진행")) {
				res.setTask_progress("진행예정");
			} else if(res.getTask_status().equals("완료")) {
				res.setTask_progress("완료");
			} else {
				res.setTask_progress("진행중");
			}
		}
		
		return list;
	}

	@Override
	public ProgramModifyRequest getProgramDetail(int task_no) {
		ProgramModifyRequest request = taskDao.selectDetailByTaskNo(task_no);
		
		String task_date = request.getTask_startdate() + " to " + request.getTask_enddate();
		request.setTask_date(task_date);
		
		return request;
	}
}
