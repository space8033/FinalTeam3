package com.finalteam3.exodia.task.dto.response;

import lombok.Data;

@Data
public class ProgramListResponse {
	private int id;
	private int task_no;
	private String team_name;
	private String task_name;
	private int empinfo_no;
	private String empinfo_name;
	private String task_startdate;
	private String task_enddate;
	private String task_date;
	private String task_status;
	private String task_progress;
}
