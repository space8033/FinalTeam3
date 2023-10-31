package com.finalteam3.exodia.alarm.dao;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.alarm.dto.request.AlarmRequest;

@Mapper
public interface AlarmDao {
	public void insertAlarm(AlarmRequest alarmRequest);
	
	public int selectAlarmUchkCount(String mId);

}
