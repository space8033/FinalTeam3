package com.finalteam3.exodia.alarm.service;

import java.util.List;

import com.finalteam3.exodia.alarm.dto.request.AlarmRequest;
import com.finalteam3.exodia.inquiry.dto.Reply;
import com.finalteam3.exodia.notice.dto.Notice;

public interface AlarmService {
	
	public List<AlarmRequest> getAlarmList(int empInfoNo);
	public void deleteAlarm(int alarmNo);
	public void updateAlarmRead(int alarmNo);
	public int uckAlarmCount(int empInfoNo);
	public void programStartAlarm();
	public void insertNoticeAlarm(Notice notice);
	public void deleteNoticeAlarm(int noticeNo);
	public void insertInquiryeAlarm(Notice inquiry);
	public void deleteInquiryAlarm(int inquiryNo);
	public void insertReplyAlarm(Reply reply);
	public void deleteReplyAlarm(int replyNo);

}
