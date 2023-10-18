package com.finalteam3.exodia.employee.service;

import com.finalteam3.exodia.employee.dto.request.JoinRequest;
import com.finalteam3.exodia.employee.dto.request.LoginRequest;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;

public interface EmployeeService {
	public LoginResponse login(LoginRequest loginRequest);
	public void join(JoinRequest joinRequest);
}
