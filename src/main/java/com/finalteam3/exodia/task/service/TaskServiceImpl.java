package com.finalteam3.exodia.task.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finalteam3.exodia.task.dao.TaskDao;
import com.finalteam3.exodia.task.dto.request.ProgramRegisterRequest;

@Service
public class TaskServiceImpl implements TaskService{
	@Resource
	private TaskDao taskDao;
	
	@Override
	public void registerProgram(ProgramRegisterRequest request) {
		taskDao.insertProgram(request);
	}

}
