package com.finalteam3.exodia.task.dto.request;

import java.util.Date;

import com.finalteam3.exodia.employee.dto.response.EmpNote;

import lombok.Data;

@Data
public class ProgramRegisterRequest {
	private String task_name;
	private EmpNote emp_note;
	private int emp_no = emp_note.getEmp_no();
	private String task_url;
	private String task_type = "Business";
	private String task_importance;
	private String task_category;
	private String task_detail;
	private Date startDate;
	private Date endDate;
	private String task_status;
}
