package com.finalteam3.exodia.project.dto.response;

import lombok.Data;

@Data
public class ProjectListResponse {
	private int project_no;
	private String project_name;
	private int project_memberCount;
	private String project_startdate;
	private String project_enddate;
	private String project_period;
	private String project_client;
}
