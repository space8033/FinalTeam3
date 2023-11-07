package com.finalteam3.exodia.task.dto.response;

import lombok.Data;

@Data
public class TeamTaskResponse {
	private String team_name;
	private int index;
	private String team_duty;
	private int empinfo_no;
	private int emp_no;
	private String empinfo_name;
	private int total_task;
	private int complete_task;
	private double progress_rate;
}
