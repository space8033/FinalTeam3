package com.finalteam3.exodia.alarm.dto.request;

import lombok.Data;

@Data
public class AlarmRequest {
	
	private int alarm_no;
	private String alarm_createdAt;
	private String alarm_deletedAt;
	private boolean alarm_isRead;
	private String alarm_type;
	private int alarm_typeNo;
	private int empinfo_no;

}
