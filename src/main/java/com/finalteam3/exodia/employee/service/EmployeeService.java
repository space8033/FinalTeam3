package com.finalteam3.exodia.employee.service;

import com.finalteam3.exodia.employee.dto.request.JoinRequest;
import com.finalteam3.exodia.employee.dto.request.LoginRequest;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.note.dto.EmployeeInfo;

public interface EmployeeService {
	public enum JoinResult {
		
	}

	public enum LoginResult {
		LOGIN_SUCCESS,
		FAIL_ID,
		FAIL_PASSWORD,
		FAIL_ENABLED
	}
	
	public LoginResult login(LoginRequest loginRequest);
	public LoginResponse getLoginResponse(LoginRequest loginRequest);
	public EmployeeInfo getEmpInfo(int empNo);
	public void join(JoinRequest joinRequest);
}
