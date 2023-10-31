package com.finalteam3.exodia.alarm.dao;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.alarm.dto.request.AlarmRequest;

@Mapper
public interface AlarmDao {
	public void insertAlarm(AlarmRequest alarmRequest);
	
	//읽지 않은 알람 개수 가져오기
	public int selectAlarmUchkCount(String emp_id);

}
