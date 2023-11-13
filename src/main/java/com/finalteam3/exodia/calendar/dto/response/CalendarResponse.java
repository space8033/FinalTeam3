package com.finalteam3.exodia.calendar.dto.response;

import lombok.Data;

@Data
public class CalendarResponse {
	private int id; //task_no
	private String title; //task_name
	private String start; //task_startdate
	private String end; //task_enddate
	private int emp_no;
	private String task_type;
	private String task_content;
	private String empinfo_name;
	private String task_name;
}
