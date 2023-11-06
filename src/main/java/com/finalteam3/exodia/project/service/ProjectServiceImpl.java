package com.finalteam3.exodia.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalteam3.exodia.employee.dao.EmployeeDao;
import com.finalteam3.exodia.project.dao.ProjectDao;
import com.finalteam3.exodia.project.dto.request.ProjectAddRequest;
import com.finalteam3.exodia.project.dto.response.ProjectModifyResponse;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProjectServiceImpl implements ProjectService{
	@Resource
	private ProjectDao projectDao;
	@Resource
	private EmployeeDao employeeDao;

	@Override
	@Transactional
	public ProjectAddResult addProject(ProjectAddRequest request) {
		//프로젝트 시작일, 종료일 세팅
		String[] project_periods = request.getProject_period().split(" to ");
		request.setProject_startDate(project_periods[0]);
		request.setProject_endDate(project_periods[1]);
		
		//프로젝트 시작시 요구분석 상태로 초기화
		request.setProject_status("요구분석");
		
		//프로젝트 등록
		projectDao.insertProject(request);
		//여기부터 하면됨 (프로젝트 넘버 구해서 팀 등록하기)팀명들은 다 받아옴 아래 주석내용 다시확인!
		int projectNo = projectDao.selectRecentNo();
		
		//팀명 등록
		JSONArray teamNames = request.getTeam_name();
		int length = teamNames.length();
		for(int i = 0; i < length; i++) {
			JSONObject obj = teamNames.getJSONObject(i);
			String name = obj.get("value").toString();
			
			Map<String, Object> map = new HashMap<>();
			map.put("project_no", projectNo);
			map.put("team_name", name);
			
			log.info(map.toString());
			projectDao.insertTeam(map);
		}
		
		return ProjectAddResult.ADD_SUCCESS;
	}

	@Override
	public ProjectModifyResponse getProjectDetail(int project_no) {
		ProjectModifyResponse response = projectDao.selectProjectDetail(project_no);
		String project_date = response.getProject_startdate() + " to " + response.getProject_enddate();
		response.setProject_date(project_date);
		
		List<String> team_names = employeeDao.selectTeamname(project_no);
		response.setTeams(team_names);
		
		return response;
	}

	@Override
	@Transactional
	public void modifyProject(ProjectModifyResponse response) {
		JSONArray teamNames = response.getTeam_names();
		int length = teamNames.length();
		for(int i = 0; i < length; i++) {
			JSONObject obj = teamNames.getJSONObject(i);
			String name = obj.get("value").toString();
			
			Map<String, Object> map = new HashMap<>();
			map.put("project_no", response.getProject_no());
			//map.put("empinfo_no", response.getProject_manager());
			map.put("team_name", name);
			
			projectDao.insertTeam(map);
		}
			
		String project_startdate = response.getProject_date().split(" to ")[0];
		String project_enddate = response.getProject_date().split(" to ")[1];
		int empinfo_no = response.getEmp_notes().get(0).getEmpinfo_no();
		
		response.setProject_startdate(project_startdate);
		response.setProject_enddate(project_enddate);
		response.setProject_manager(empinfo_no);
		
		projectDao.updateProject(response);
	}
}
