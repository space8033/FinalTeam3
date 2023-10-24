package com.finalteam3.exodia.project.service;

import com.finalteam3.exodia.project.dto.request.ProjectAddRequest;

public interface ProjectService {
	public enum ProjectAddResult {
		ADD_SUCCESS,
		ADD_FAILED
	}
	
	public ProjectAddResult addProject(ProjectAddRequest request);
}
