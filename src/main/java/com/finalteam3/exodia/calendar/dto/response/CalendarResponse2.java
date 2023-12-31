package com.finalteam3.exodia.calendar.dto.response;

import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.Setter;

@Data
public class CalendarResponse2 {
	private int id; //task_no
	private String title; //task_name
	private Date start; //task_startdate
	private Date end; //task_enddate
	private int emp_no;
	private String task_type;
	private String url;
	private int task_no;
	private String description;
	private boolean allDay = true;
	private CalendarColor extendedProps;
	private String empinfo_name;
	private String task_name;
}
