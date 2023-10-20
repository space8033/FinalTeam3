package com.finalteam3.exodia.employee.dto.request;

import java.io.Serializable;

import lombok.Data;

@Data
public class JoinRequest implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String empinfo_name;
	private String empinfo_phone;
	private String empinfo_email;
	private String empinfo_position;
	private String emp_id;
	private boolean emp_isinit = true;
	private int emp_no;
}
