package com.finalteam3.exodia.alarm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.alarm.dto.request.AlarmRequest;

@Mapper
public interface AlarmDao {
	public void insertAlarm(AlarmRequest alarmRequest);
	
	//읽지 않은 알람 개수 가져오기
	public int selectAlarmUchkCount(String emp_id);

	public List<AlarmRequest> selectAlarmList(int empinfoNo);
	public void deleteAlarmByAlarmNo(int alarm_no);
	public void updateAlarmReadByAlarmNo(AlarmRequest alarm);
}
