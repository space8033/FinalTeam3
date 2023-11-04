package com.finalteam3.exodia.task.dto.request;

import lombok.Data;

@Data
public class ProgramModifyRequest {
	private int task_no;
	private String task_name;
	private String empinfo_name;
	private String empinfo_email;
	private int emp_no;
	private String task_url;
	private String task_importance;
	private String task_category;
	private String task_detail;
	private String task_date;
	private String task_startdate;
	private String task_enddate;
	private String task_realstart;
	private String task_realend;
	private String task_status;
}
