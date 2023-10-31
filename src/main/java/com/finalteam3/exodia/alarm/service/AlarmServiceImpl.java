package com.finalteam3.exodia.alarm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finalteam3.exodia.alarm.dao.AlarmDao;
import com.finalteam3.exodia.alarm.dto.request.AlarmRequest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AlarmServiceImpl implements AlarmService {
	@Resource 
	private AlarmDao alarmDao;
	
	
	
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
	
}
