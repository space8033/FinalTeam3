package com.finalteam3.exodia.task.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.task.dto.request.ProgramModifyRequest;
import com.finalteam3.exodia.task.dto.request.ProgramRegisterRequest;
import com.finalteam3.exodia.task.dto.response.ProgramListResponse;
import com.finalteam3.exodia.task.dto.response.RecentTask;
import com.finalteam3.exodia.task.dto.response.TeamTaskResponse;

@Mapper
public interface TaskDao {
	public void insertProgram(ProgramRegisterRequest request);
	public List<ProgramListResponse> selectBusinessTask();
	public ProgramModifyRequest selectDetailByTaskNo(int task_no);
	public void updateProgram(ProgramModifyRequest request);
	public void deleteProgram(int task_no);
	public int countAllTask(int project_no);
	public int countCompleteTask(int project_no);
	public int countTaskByEmpNo(Map<String, Object> map);
	public int countCompleteByEmpNo(Map<String, Object> map);
	public List<TeamTaskResponse> selectTeamTaskDetail(Map<String, Object> map);
	public RecentTask selectRecentTask(Map<String, Object> map);
	public RecentTask selectRecentPersonalTask(Map<String, Object> map);
}
