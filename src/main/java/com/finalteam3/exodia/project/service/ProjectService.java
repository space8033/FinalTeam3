package com.finalteam3.exodia.project.service;

import java.util.List;

import com.finalteam3.exodia.project.dto.request.ProjectAddRequest;
import com.finalteam3.exodia.project.dto.response.ProjectListResponse;
import com.finalteam3.exodia.project.dto.response.ProjectModifyResponse;

public interface ProjectService {
	public enum ProjectAddResult {
		ADD_SUCCESS,
		ADD_FAILED
	}
	
	public ProjectAddResult addProject(ProjectAddRequest request);
	public ProjectModifyResponse getProjectDetail(int project_no);
	public void modifyProject(ProjectModifyResponse response);
	public List<ProjectListResponse> getAllProjectList(int empinfo_no);
	public String getProjectName(int project_no);
}
