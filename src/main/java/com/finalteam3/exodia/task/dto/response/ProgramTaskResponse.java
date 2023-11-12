package com.finalteam3.exodia.task.dto.response;

import lombok.Data;

@Data
public class ProgramTaskResponse {
	private int task_no;
	private String task_name;
	private int emp_no;
	private String task_startdate;
	private String task_enddate;
}
