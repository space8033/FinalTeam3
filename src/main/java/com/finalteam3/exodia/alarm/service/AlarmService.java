package com.finalteam3.exodia.alarm.service;

import java.util.List;

import com.finalteam3.exodia.alarm.dto.request.AlarmRequest;

public interface AlarmService {
	
	public List<AlarmRequest> getAlarmList(int empInfoNo);
	public void deleteAlarm(int alarmNo);
	public void updateAlarmRead(int alarmNo);
	public int uckAlarmCount(int empInfoNo);
	public void programStartAlarm();

}
