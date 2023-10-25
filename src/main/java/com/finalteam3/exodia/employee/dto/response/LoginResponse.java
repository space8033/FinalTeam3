package com.finalteam3.exodia.employee.dto.response;

import com.finalteam3.exodia.employee.dto.Role;

import lombok.Data;

@Data
public class LoginResponse {
	private int emp_no;
	private String emp_id;
	private String emp_password;
	private String empInfo_name;
	private boolean emp_isinit;
	private String emp_deletedAt;
	private Role role_category;
}
