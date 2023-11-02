package com.finalteam3.exodia.task.dao;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.task.dto.request.ProgramRegisterRequest;

@Mapper
public interface TaskDao {
	public void insertProgram(ProgramRegisterRequest request);
}
