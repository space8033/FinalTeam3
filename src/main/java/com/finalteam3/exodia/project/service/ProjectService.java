package com.finalteam3.exodia.project.service;

import com.finalteam3.exodia.project.dto.request.ProjectAddRequest;
import com.finalteam3.exodia.project.dto.response.ProjectModifyResponse;

public interface ProjectService {
	public enum ProjectAddResult {
		ADD_SUCCESS,
		ADD_FAILED
	}
	
	public ProjectAddResult addProject(ProjectAddRequest request);
	public ProjectModifyResponse getProjectDetail(int project_no);
}
