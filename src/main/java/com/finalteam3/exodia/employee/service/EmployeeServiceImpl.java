package com.finalteam3.exodia.employee.service;

import javax.annotation.Resource;
import javax.security.auth.login.CredentialExpiredException;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalteam3.exodia.employee.dao.EmployeeDao;
import com.finalteam3.exodia.employee.dto.request.JoinRequest;
import com.finalteam3.exodia.employee.dto.request.LoginRequest;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	@Resource
	private EmployeeDao employeeDao;
	
	
	@Override
	@Transactional
	public LoginResult login(LoginRequest loginRequest) {
		LoginResponse loginResponse = employeeDao.selectInfoByEmpId(loginRequest);
		
		//아이디가 없는 경우
		if(loginResponse == null) {
			return LoginResult.FAIL_ID;
		}
		//비밀번호가 일치하지 않는 경우
		if(!loginResponse.getEmp_password().equals(loginRequest.getEmp_password())) {
			return LoginResult.FAIL_PASSWORD;
		}
		//휴면, 혹은 탈퇴 유저의 경우
		if(loginResponse.getEmp_deletedAt() != null) {
			return LoginResult.FAIL_ENABLED;
		}
		
		//로그인 중인 사용자 로그인 상태 변경
		employeeDao.updateStatus(loginRequest.getEmp_id());
		
		return LoginResult.SUCCESS;
	}

	@Override
	public LoginResponse getLoginResponse(LoginRequest loginRequest) {
		LoginResponse loginResponse = employeeDao.selectInfoByEmpId(loginRequest);
		
		return loginResponse;
	}

	@Override
	public void join(JoinRequest joinRequest) {
		employeeDao.insertEmp(joinRequest);
		int emp_no = employeeDao.selectNoByEmpId(joinRequest.getEmp_id());
		
		joinRequest.setEmp_no(emp_no);
		employeeDao.insertEmpInfo(joinRequest);
	}
}
