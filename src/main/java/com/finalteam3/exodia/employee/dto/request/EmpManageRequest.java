package com.finalteam3.exodia.employee.dto.request;

import java.util.List;

import com.finalteam3.exodia.employee.dto.response.TransferDto;

import lombok.Data;

@Data
public class EmpManageRequest {
	private String selected_role_category;
	private String selected_team_name;
	private String typed_team_duty;
	private List<TransferDto> selected_userList;
}