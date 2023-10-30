package com.finalteam3.exodia.employee.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalteam3.exodia.employee.dao.EmployeeDao;
import com.finalteam3.exodia.employee.dto.request.JoinRequest;
import com.finalteam3.exodia.employee.dto.request.LoginRequest;
import com.finalteam3.exodia.employee.dto.request.ModifyRequest;
import com.finalteam3.exodia.employee.dto.request.PasswordRequest;
import com.finalteam3.exodia.employee.dto.response.EmpManagementResponse;
import com.finalteam3.exodia.employee.dto.response.EmpModifyResponse;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.employee.dto.response.TeamBasicResponse;
import com.finalteam3.exodia.note.dto.EmployeeInfo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmployeeServiceImpl implements EmployeeService{
	@Resource
	private EmployeeDao employeeDao;
	//암호화용
	private PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
	
	//로그인
	@Override
	@Transactional
	public LoginResult login(LoginRequest loginRequest) {
		LoginResponse loginResponse = employeeDao.selectInfoByEmpId(loginRequest);
		//아이디가 없는 경우
		if(loginResponse == null) {
			return LoginResult.FAIL_ID;
		}

		//가입 혹은 비밀번호 초기화 후 최초 로그인인 경우
		if(loginResponse.isEmp_isinit()) {
			if(loginRequest.getEmp_password().equals("0000")) {
				return LoginResult.LOGIN_SUCCESS;				
			}else {
				return LoginResult.FAIL_PASSWORD;
			}
		}
		
		//비밀번호가 일치하지 않는 경우
		if(!passwordEncoder.matches(loginRequest.getEmp_password(), loginResponse.getEmp_password())) {
			return LoginResult.FAIL_PASSWORD;
		}
		//휴면, 혹은 탈퇴 유저의 경우
		if(loginResponse.getEmp_deletedAt() != null) {
			return LoginResult.FAIL_ENABLED;
		}
		
		//로그인 중인 사용자 로그인 상태 변경
		employeeDao.updateStatus(loginRequest.getEmp_id());
		
		return LoginResult.LOGIN_SUCCESS;
	}
	
	//로그인중인 유저 표시할 때 필요한 정보 얻기
	@Override
	public LoginResponse getLoginResponse(LoginRequest loginRequest) {
		LoginResponse loginResponse = employeeDao.selectInfoByEmpId(loginRequest);
		
		return loginResponse;
	}
	
	//회원 가입
	@Override
	@Transactional
	public JoinResult join(JoinRequest joinRequest) {
		LoginRequest loginRequest = new LoginRequest();
		loginRequest.setEmp_id(joinRequest.getEmp_id());
		//아이디 존재여부 확인
		LoginResponse loginResponse = employeeDao.selectInfoByEmpId(loginRequest);
		
		if(loginResponse == null) {
			employeeDao.insertEmp(joinRequest);
			int emp_no = employeeDao.selectNoByEmpId(joinRequest.getEmp_id());
			
			joinRequest.setEmp_no(emp_no);
			employeeDao.insertEmpInfo(joinRequest);
			
			return JoinResult.JOIN_SUCCESS;
		}else {
			return JoinResult.DUPLICATED_ID;
		}
		
	}
	
	//emp 번호로 유저 정보 얻기
	@Override
	public EmployeeInfo getEmpInfo(int empNo) {
		EmployeeInfo employeeInfo = employeeDao.selectInfoByEmpNo(empNo);
		return employeeInfo;
	}
	
	//비밀번호 변경
	@Override
	public PasswordResult changePassword(PasswordRequest passwordRequest) {
		//새 비밀번호와 비밀번호 변경에 입력된 값이 같은 경우
		if(passwordRequest.getNewPassword().equals(passwordRequest.getConfirmPassword())) {
			//비밀번호 암호화
			String encodedPassword = passwordEncoder.encode(passwordRequest.getNewPassword());
			
			Map<String, Object> map = new HashMap<>();
			map.put("emp_id", passwordRequest.getEmp_id());
			map.put("emp_password", encodedPassword);
			map.put("emp_isinit", false);
			
			employeeDao.updatePassword(map);
			
			return PasswordResult.PCHANGE_SUCCESS;
		}else {
			return PasswordResult.PASSWORD_NOT_MATCHED;
		}
	}

	@Override
	public EmpModifyResponse getModifyInfo(String emp_id) {
		EmpModifyResponse response = employeeDao.selectModifyByEmpId(emp_id);
		
		return response;
	}

	@Override
	public ModifyResult changeEmpInfo(ModifyRequest modifyRequest) {
		Pattern phonePattern = Pattern.compile("\\d{3}-\\d{4}-\\d{4}");
		Matcher phoneMatcher = phonePattern.matcher(modifyRequest.getEmpinfo_phone());
		
		String ep = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
		Pattern emailPattern = Pattern.compile(ep);
		Matcher emailMatcher = emailPattern.matcher(modifyRequest.getEmpinfo_email());
		
		if(!phoneMatcher.matches()) {
			return ModifyResult.WRONG_PHONE;
		}else if(!emailMatcher.matches()) {
			return ModifyResult.WRONG_EMAIL;
		}else {
			employeeDao.updateEmpInfo(modifyRequest);
			
			return ModifyResult.MODIFY_SUCCESS;
		}		
	}

	@Override
	public boolean confirmPassword(String emp_id, String emp_password) {
		String dBPassword = employeeDao.selectNowPassword(emp_id);
		
		if(passwordEncoder.matches(emp_password, dBPassword)) {
			return true;
		}
		
		return false;
	}

	@Override
	public List<EmpManagementResponse> getManagementResponse(int project_no) {
		List<String> tNames = employeeDao.selectTeamname(project_no);
		List<EmpManagementResponse> list = new ArrayList<>();
		
		for(String tName : tNames) {
			EmpManagementResponse emr = new EmpManagementResponse();
			List<TeamBasicResponse> tbrs = employeeDao.selectTeamBasic(tName);
			List<Integer> teamMembers = new ArrayList<>();
			
			for(TeamBasicResponse tbr : tbrs) {
				if(tbr.getEmp_no() == 0) {
					emr.setTeam_name(tName);
					emr.setTeam_duty(tbr.getTeam_duty());
				}
				if(tbr.isTeam_isleader()) {
					emr.setTeam_leader(tbr.getEmpinfo_name());
				}else {
					teamMembers.add(tbr.getEmp_no());
					
				}
			}
			
			//사람당 이미지파일 구하기(아직 구현 전)
			emr.setTeam_members(teamMembers);
			
			list.add(emr);
		}
		
		return list;
	}
}