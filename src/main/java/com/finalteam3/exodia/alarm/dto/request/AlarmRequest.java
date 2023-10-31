package com.finalteam3.exodia.alarm.dto.request;

import lombok.Data;

@Data
public class AlarmRequest {
	
	private int alaram_no;
	private String alarm_createdAt;
	private String alarm_deletedAt;
	private boolean alaram_isRead;
	private String alaram_type;
	private int alaram_typeNo;
	private int empinfo_no;

}
