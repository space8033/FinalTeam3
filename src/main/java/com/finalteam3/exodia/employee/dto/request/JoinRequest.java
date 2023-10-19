package com.finalteam3.exodia.employee.dto.request;

import lombok.Data;

@Data
public class JoinRequest {
	private String empinfo_name;
	private String emp_id;
	private String empinfo_phone;
	private String empinfo_email;
	private String empinfo_position;
}
