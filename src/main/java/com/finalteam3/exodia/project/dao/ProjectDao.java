package com.finalteam3.exodia.project.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.project.dto.request.ProjectAddRequest;
import com.finalteam3.exodia.project.dto.response.ProjectModifyResponse;

@Mapper
public interface ProjectDao {
	public void insertProject(ProjectAddRequest request);
	public void insertTeam(Map<String, Object> map);
	public int selectRecentNo();
	public ProjectModifyResponse selectProjectDetail(int project_no);
	public void updateProject(ProjectModifyResponse response);
}
