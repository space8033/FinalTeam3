package com.finalteam3.exodia.project.dto.request;

import java.util.List;

import org.json.JSONArray;

import com.finalteam3.exodia.employee.dto.response.EmpNote;

import lombok.Data;

@Data
public class ProjectAddRequest {
	private int project_no;
	private String project_name;
	private String project_outline;
	private String project_client;
	private JSONArray team_name;
	private List<EmpNote> emp_notes;
	private int project_manager;
	private String project_period;
	private String project_startDate;
	private String project_endDate;
	private String project_status;
}
