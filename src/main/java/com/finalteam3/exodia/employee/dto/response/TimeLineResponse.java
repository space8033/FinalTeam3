package com.finalteam3.exodia.employee.dto.response;

import lombok.Data;

@Data
public class TimeLineResponse {
	private int emp_no;
	private int empinfo_no;
	private String empinfo_name;
	private String two_name;
	private String emp_id;
	private String emp_status;
	private String role_category;
	private String empinfo_position;
	private String team_duty;
	private String empinfo_phone;
	private String empinfo_email;
	private String team_name;
	private int team_memberCount;
	private int notice_no;
	private String notice_title;
	private String notice_createdat;
	private String notice_time;
	private int inquiry_no;
	private String inquiry_title;
	private String inquiry_createdat;
	private String inquiry_time;
	private int myTask_no;
	private String myTask_name;
	private String myTask_start;
	private int task_no;
	private String task_name;
	private String task_start;
}