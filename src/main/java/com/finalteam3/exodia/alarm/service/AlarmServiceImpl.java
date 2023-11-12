package com.finalteam3.exodia.alarm.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.finalteam3.exodia.alarm.dao.AlarmDao;
import com.finalteam3.exodia.alarm.dto.request.AlarmRequest;
import com.finalteam3.exodia.employee.dao.EmployeeDao;
import com.finalteam3.exodia.note.dto.EmployeeInfo;
import com.finalteam3.exodia.task.dao.TaskDao;
import com.finalteam3.exodia.task.dto.response.ProgramTaskResponse;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AlarmServiceImpl implements AlarmService {
	@Resource 
	private AlarmDao alarmDao;
	
	@Resource 
	private TaskDao taskDao;
	
	@Resource 
	private EmployeeDao empDao;
	
	
	
	@Override
	public List<AlarmRequest> getAlarmList(int empInfoNo) {
		List<AlarmRequest> alarmList = alarmDao.selectAlarmList(empInfoNo);
	
	    return alarmList;
	}



	@Override
	public void deleteAlarm(int alarmNo) {
		
		alarmDao.deleteAlarmByAlarmNo(alarmNo);
	}



	@Override
	public void updateAlarmRead(int alarmNo) {

		AlarmRequest alarm = new AlarmRequest();
		alarm.setAlarm_no(alarmNo);
		alarm.setAlarm_isRead(true);
		alarmDao.updateAlarmReadByAlarmNo(alarm);
	}



	@Override
	public int uckAlarmCount(int empInfoNo) {
		return alarmDao.countUckAlarm(empInfoNo);
	}



	@Override
	@Scheduled(cron = "0 0 0 * * ?")
	public void programStartAlarm() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate = sdf.format(new Date());
		ProgramTaskResponse program = new ProgramTaskResponse();
		program.setTask_startdate(currentDate);
		List<ProgramTaskResponse> programList = taskDao.selectTaskStartDate(program);
		
		for(ProgramTaskResponse programStart : programList) {
			AlarmRequest alarm = new AlarmRequest();
			alarm.setAlarm_type("프로그램");
			alarm.setAlarm_typeNo(programStart.getTask_no());
			
			int empInfoNo = empDao.selectEmpInfoNoByEmpNo(programStart.getEmp_no());
			alarm.setEmpinfo_no(empInfoNo);
			alarm.setAlarm_content(programStart.getTask_name());
			alarm.setAlarm_isRead(false);
			alarmDao.insertAlarm(alarm);
		}
		
	}
	
}
