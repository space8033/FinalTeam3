package com.finalteam3.exodia.task.service;

import java.util.List;
import java.util.Map;

import com.finalteam3.exodia.task.dto.request.ProgramModifyRequest;
import com.finalteam3.exodia.task.dto.request.ProgramRegisterRequest;
import com.finalteam3.exodia.task.dto.response.ProgramListResponse;
import com.finalteam3.exodia.task.dto.response.TeamTaskResponse;

public interface TaskService {
	public void registerProgram(ProgramRegisterRequest request);
	public List<ProgramListResponse> getAllBusinessProgram();
	public ProgramModifyRequest getProgramDetail(int task_no);
	public void updateProgram(ProgramModifyRequest request);
	public void deleteProgram(int task_no);
	public double getProgressRate(int project_no);
	public List<TeamTaskResponse> getTeamTaskDetail(Map<String, Object> map)
;}
