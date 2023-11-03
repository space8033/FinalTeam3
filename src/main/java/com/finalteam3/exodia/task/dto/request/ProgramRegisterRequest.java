package com.finalteam3.exodia.task.dto.request;

import java.util.List;

import com.finalteam3.exodia.employee.dto.response.EmpNote;

import lombok.Data;

@Data
public class ProgramRegisterRequest {
	private int task_no;
	private String task_name;
	private List<EmpNote> emp_notes;
	private int emp_no;
	private String task_url;
	private String task_type = "Business";
	private String task_importance;
	private String task_category;
	private String task_detail;
	private String task_date;
	private String startDate;
	private String endDate;
	private String task_status;
}
