package com.finalteam3.exodia.employee.dto.request;

import lombok.Data;

@Data
public class JoinRequest {
	private String empinfo_name;
	private String empinfo_phone;
	private String empinfo_email;
	private String empinfo_position;
	private String emp_id;
	private boolean emp_isinit = true;
	private int emp_no;
}
