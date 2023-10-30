package com.finalteam3.exodia.alarm.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AlarmDao {
	public int selectAlarmUchkCount(String mId);

}
