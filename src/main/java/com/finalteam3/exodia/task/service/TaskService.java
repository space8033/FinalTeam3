package com.finalteam3.exodia.task.service;

import java.util.List;

import com.finalteam3.exodia.task.dto.request.ProgramRegisterRequest;
import com.finalteam3.exodia.task.dto.response.ProgramListResponse;

public interface TaskService {
	public void registerProgram(ProgramRegisterRequest request);
	public List<ProgramListResponse> getAllBusinessProgram();
}
