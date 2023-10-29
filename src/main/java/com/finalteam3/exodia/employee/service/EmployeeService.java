package com.finalteam3.exodia.employee.service;

import java.util.List;

import com.finalteam3.exodia.employee.dto.request.JoinRequest;
import com.finalteam3.exodia.employee.dto.request.LoginRequest;
import com.finalteam3.exodia.employee.dto.request.ModifyRequest;
import com.finalteam3.exodia.employee.dto.request.PasswordRequest;
import com.finalteam3.exodia.employee.dto.response.EmpManagementResponse;
import com.finalteam3.exodia.employee.dto.response.EmpModifyResponse;
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
	
	public enum ModifyResult {
		MODIFY_SUCCESS,
		WRONG_PHONE,
		WRONG_EMAIL
	}
	
	public LoginResult login(LoginRequest loginRequest);
	public LoginResponse getLoginResponse(LoginRequest loginRequest);
	public EmployeeInfo getEmpInfo(int empNo);
	public JoinResult join(JoinRequest joinRequest);
	public PasswordResult changePassword(PasswordRequest passwordRequest);
	public EmpModifyResponse getModifyInfo(String emp_id);
	public ModifyResult changeEmpInfo(ModifyRequest modifyRequest);
	public boolean confirmPassword(String emp_id, String emp_password);
	public List<EmpManagementResponse> getManagementResponse(int project_no);
}
