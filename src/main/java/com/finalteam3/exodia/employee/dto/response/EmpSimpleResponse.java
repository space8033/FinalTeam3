package com.finalteam3.exodia.employee.dto.response;

import lombok.Data;

@Data
public class EmpSimpleResponse {
	private String empinfo_name;
	private String empinfo_email;
	private String two_name;
	private byte[] profile;
	private String team_name;
}
