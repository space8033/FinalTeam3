package com.finalteam3.exodia.employee.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.employee.dto.request.JoinRequest;
import com.finalteam3.exodia.employee.dto.request.LoginRequest;
import com.finalteam3.exodia.employee.dto.request.ModifyRequest;
import com.finalteam3.exodia.employee.dto.response.EmpModifyResponse;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.note.dto.EmployeeInfo;

@Mapper
public interface EmployeeDao {
	public int selectNoByEmpId(String emp_id);
	public LoginResponse selectInfoByEmpId(LoginRequest loginRequest);
	public void updateStatus(String emp_id);
	public void insertEmp(JoinRequest joinRequest);
	public void insertEmpInfo(JoinRequest joinRequest);
	public EmployeeInfo selectInfoByEmpNo(int emp_no);
	public void updatePassword(Map<String, Object> map);
	public LoginResponse selectEmpByEmpId(String emp_id);
	public EmpModifyResponse selectModifyByEmpId(String emp_id);
	public void updateEmpInfo(ModifyRequest modifyRequest);	
	public int selectNoByEmpName(String empinfo_name);
	public String selectNowPassword(String emp_id);
}
