package com.finalteam3.exodia.employee.dao;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.employee.dto.request.LoginRequest;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;

@Mapper
public interface EmployeeDao {
	public String selectByEmpId(String emp_id);
	public LoginResponse selectInfoByEmpId(LoginRequest loginRequest);
	public void updateStatus(String emp_id);
}
