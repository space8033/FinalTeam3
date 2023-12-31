package com.finalteam3.exodia.project.dto.response;

import java.util.List;

import org.json.JSONArray;

import com.finalteam3.exodia.employee.dto.response.EmpNote;

import lombok.Data;

@Data
public class ProjectModifyResponse {
	private int project_no;
	private String project_name;
	private String project_outline;
	private String project_startdate;
	private String project_enddate;
	private String project_client;
	private String project_date;
	private List<EmpNote> emp_notes;
	private int project_manager;
	private String manager_name;
	private JSONArray team_names;
	private List<String> teams;
}
