package com.finalteam3.exodia.employee.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.employee.dto.request.JoinRequest;
import com.finalteam3.exodia.employee.dto.request.LoginRequest;
import com.finalteam3.exodia.employee.dto.request.ModifyRequest;
import com.finalteam3.exodia.employee.dto.response.EmpModifyResponse;
import com.finalteam3.exodia.employee.dto.response.EmpNote;
import com.finalteam3.exodia.employee.dto.response.EmpSimpleResponse;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.employee.dto.response.ProjectEmpResponse;
import com.finalteam3.exodia.employee.dto.response.TeamBasicResponse;
import com.finalteam3.exodia.note.dto.EmployeeInfo;

@Mapper
public interface EmployeeDao {
	public int selectNoByEmpId(String emp_id);
	public LoginResponse selectInfoByEmpId(LoginRequest loginRequest);
	public void updateStatus(Map<String, Object> map);
	public void insertEmp(JoinRequest joinRequest);
	public void insertEmpInfo(JoinRequest joinRequest);
	public EmployeeInfo selectInfoByEmpNo(int emp_no);
	public void updatePassword(Map<String, Object> map);
	public LoginResponse selectEmpByEmpId(String emp_id);
	public EmpModifyResponse selectModifyByEmpId(String emp_id);
	public void updateEmpInfo(ModifyRequest modifyRequest);	
	public int selectNoByEmpName(String empinfo_name);
	public String selectNowPassword(String emp_id);
	public List<String> selectTeamname(int project_no);
	public List<TeamBasicResponse> selectTeamBasic(String team_name);
	public List<EmpSimpleResponse> selectNoTeamEmp();
	public List<EmpSimpleResponse> selectTeamEmp(String team_name);
	public EmpSimpleResponse selectTeamLeader(String team_name);
	public void insertRole(int empinfo_no);
	public String selectTeamDuty(String team_name);
	//empinfo_no로 empinfo얻어오기
	public EmployeeInfo selectEmpInfoByEmpInfoNo(int empinfo_no);
	public int selectInfoNoByEmail(String empinfo_email);
	public void updateRole(Map<String, Object> map);
	public void deleteTeamEmpExceptAdmin(String team_name);
	public void insertNewTeamEmp(Map<String, Object> map);
	public void deleteTeamByEmpNo(String team_name);
	public Integer selectRolePM(int project_no);
	public void deleteAllTeam(String team_name);
	public List<EmpNote> selectEmployeeForNote();
	public EmpNote selectEmployeeByEmpNo(int emp_no);
	public void updateTeamDuty(Map<String, Object> map);
	public JoinRequest selectEmpByEmpNo(int emp_no);
	public List<EmpNote> selectAllEmployee();
	public List<ProjectEmpResponse> selectProjectEmp(int project_no);
	public ProjectEmpResponse selectProjectPm(int project_no);
}
