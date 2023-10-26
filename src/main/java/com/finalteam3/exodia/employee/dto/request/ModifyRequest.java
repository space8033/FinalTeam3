package com.finalteam3.exodia.employee.dto.request;

import lombok.Data;

@Data
public class ModifyRequest {
	private int emp_no;
	private String empinfo_email;
	private String empinfo_phone;
}
