package com.finalteam3.exodia.security.dto;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.finalteam3.exodia.employee.dto.response.LoginResponse;

public class EmpDetails extends User{
	private LoginResponse loginResponse;

	public EmpDetails(LoginResponse loginResponse, Collection<? extends GrantedAuthority> authorities) {
		super(loginResponse.getEmp_id(), loginResponse.getEmp_password(), true, true, true, true, authorities);
		this.loginResponse = loginResponse;
	}
	
	public LoginResponse getLoginResponse() {
		return loginResponse;
	}
}
