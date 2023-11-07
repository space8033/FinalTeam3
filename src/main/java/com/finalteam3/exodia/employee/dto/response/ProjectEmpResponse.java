package com.finalteam3.exodia.employee.dto.response;

import lombok.Data;

@Data
public class ProjectEmpResponse {
	private int empinfo_no;
	private int emp_no;
	private String empinfo_name;
	private String empinfo_email;
	private String role_category;
	private String team_name;
	private String empinfo_position;
	private String emp_status;
}
