package com.finalteam3.exodia.employee.dto.request;

import lombok.Data;

@Data
public class PasswordRequest {
	private String emp_id;
	private String newPassword;
	private String confirmPassword;
}
