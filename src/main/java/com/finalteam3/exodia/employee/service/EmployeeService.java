package com.finalteam3.exodia.employee.service;

import com.finalteam3.exodia.employee.dto.request.JoinRequest;
import com.finalteam3.exodia.employee.dto.request.LoginRequest;
import com.finalteam3.exodia.employee.dto.request.PasswordRequest;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.note.dto.EmployeeInfo;

public interface EmployeeService {
	public enum JoinResult {
		JOIN_SUCCESS,
		DUPLICATED_ID
	}

	public enum LoginResult {
		LOGIN_SUCCESS,
		FAIL_ID,
		FAIL_PASSWORD,
		FAIL_ENABLED
	}
	
	public enum PasswordResult {
		PCHANGE_SUCCESS,
		PASSWORD_NOT_MATCHED
	}
	
	public LoginResult login(LoginRequest loginRequest);
	public LoginResponse getLoginResponse(LoginRequest loginRequest);
	public EmployeeInfo getEmpInfo(int empNo);
	public JoinResult join(JoinRequest joinRequest);
	public PasswordResult changePassword(PasswordRequest passwordRequest);
}
