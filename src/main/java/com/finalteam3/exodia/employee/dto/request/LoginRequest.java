package com.finalteam3.exodia.employee.dto.request;

import lombok.Data;

@Data
public class LoginRequest {
	private String emp_id;
	private String emp_password;
	private int project_no = 0;
}
