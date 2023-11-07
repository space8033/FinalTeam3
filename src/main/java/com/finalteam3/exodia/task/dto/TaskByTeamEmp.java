package com.finalteam3.exodia.task.dto;

import java.util.List;

import com.finalteam3.exodia.task.dto.response.TeamTaskResponse;

import lombok.Data;

@Data
public class TaskByTeamEmp {
	private String team_name;
	private List<TeamTaskResponse> response;
}
