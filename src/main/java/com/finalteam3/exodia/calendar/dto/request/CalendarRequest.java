package com.finalteam3.exodia.calendar.dto.request;

import lombok.Data;

@Data
public class CalendarRequest {
	private int task_no;
	private String task_name;
	private String task_status = "미진행";
	private String task_startdate;
	private String task_enddate;
	private String task_unit;
	private String task_content;
	private String task_type;
	private int emp_no;
	private int project_no;
}
