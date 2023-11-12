package com.finalteam3.exodia.employee.dto.response;

import lombok.Data;

@Data
public class EmpModifyResponse {
	private String empinfo_name;
	private String two_name;
	private String emp_id;
	private String empinfo_email;
	private String empinfo_phone;
	private String empinfo_position;
	private byte[] media_data;
	private String base64;
}
