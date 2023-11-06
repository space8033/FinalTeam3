package com.finalteam3.exodia.task.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.task.dto.request.ProgramModifyRequest;
import com.finalteam3.exodia.task.dto.request.ProgramRegisterRequest;
import com.finalteam3.exodia.task.dto.response.ProgramListResponse;

@Mapper
public interface TaskDao {
	public void insertProgram(ProgramRegisterRequest request);
	public List<ProgramListResponse> selectBusinessTask();
	public ProgramModifyRequest selectDetailByTaskNo(int task_no);
	public void updateProgram(ProgramModifyRequest request);
	public void deleteProgram(int task_no);
	public int countAllTask(int project_no);
	public int countCompleteTask(int project_no);
}
