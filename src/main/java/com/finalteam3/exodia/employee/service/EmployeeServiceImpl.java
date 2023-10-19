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
import com.finalteam3.exodia.note.dto.EmployeeInfo;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	@Resource
	private EmployeeDao employeeDao;

	@Override
	@Transactional
	public LoginResponse login(LoginRequest loginRequest) {
		LoginResponse loginResponse = employeeDao.selectInfoByEmpId(loginRequest);
		
		//아이디가 없는 경우
		if(loginResponse == null) {
			try {
				throw new UsernameNotFoundException("존재하지 않는 아이디");
			} catch (UsernameNotFoundException e) {
				e.printStackTrace();
			}
		}
		//비밀번호가 일치하지 않는 경우
		if(!loginResponse.getEmp_password().equals(loginRequest.getEmp_password())) {
			try {
				throw new BadCredentialsException("비밀번호 불일치");
			} catch (BadCredentialsException e) {
				e.printStackTrace();
			}
		}
		//휴면, 혹은 탈퇴 유저의 경우
		if(loginResponse.getEmp_deletedAt() != null) {
			try {
				throw new CredentialExpiredException("탈퇴한 회원");				
			}catch (CredentialExpiredException e) {
				e.printStackTrace();
			}
		}
		
		//로그인 중인 사용자 로그인 상태 변경
		employeeDao.updateStatus(loginRequest.getEmp_id());
		
		return loginResponse;
	}

	@Override
	public void join(JoinRequest joinRequest) {
		employeeDao.insertEmp(joinRequest);
		
	}

	@Override
	public EmployeeInfo getEmpInfo(int empNo) {
		EmployeeInfo employeeInfo = employeeDao.selectInfoByEmpNo(empNo);
		return employeeInfo;
	}
}
