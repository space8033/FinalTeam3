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
import com.finalteam3.exodia.employee.dto.request.EmpManageRequest;
import com.finalteam3.exodia.employee.dto.request.JoinRequest;
import com.finalteam3.exodia.employee.dto.request.LoginRequest;
import com.finalteam3.exodia.employee.dto.request.ModifyRequest;
import com.finalteam3.exodia.employee.dto.request.PasswordRequest;
import com.finalteam3.exodia.employee.dto.response.EmpManagementResponse;
import com.finalteam3.exodia.employee.dto.response.EmpModifyResponse;
import com.finalteam3.exodia.employee.dto.response.EmpNote;
import com.finalteam3.exodia.employee.dto.response.EmpSimpleResponse;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.employee.dto.response.ProjectEmpResponse;
import com.finalteam3.exodia.employee.dto.response.TeamBasicResponse;
import com.finalteam3.exodia.employee.dto.response.TimeLineResponse;
import com.finalteam3.exodia.employee.dto.response.TransferDto;
import com.finalteam3.exodia.note.dto.EmployeeInfo;
import com.finalteam3.exodia.notice.dao.NoticeDao;
import com.finalteam3.exodia.notice.dto.RecentNotice;
import com.finalteam3.exodia.task.dao.TaskDao;
import com.finalteam3.exodia.task.dto.response.RecentTask;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmployeeServiceImpl implements EmployeeService{
   @Resource
   private EmployeeDao employeeDao;
   @Resource
   private NoticeDao noticeDao;
   @Resource
   private TaskDao taskDao;
   //암호화용
   private PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
   
   //로그인
   /*@Override
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
      Map<String, Object> status = new HashMap<>();
      status.put("emp_id", loginRequest.getEmp_id());
      status.put("emp_status", "on-line");
      employeeDao.updateStatus(status);
      
      return LoginResult.LOGIN_SUCCESS;
   }*/
   
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
         
         employeeDao.insertRole(joinRequest.getEmpinfo_no());
         
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
         List<String> teamMemberNames = new ArrayList<>();
         
         for(TeamBasicResponse tbr : tbrs) {
            if(tbr.getEmp_no() == 0) {
               emr.setTeam_name(tName);
               emr.setTeam_duty(tbr.getTeam_duty());
            }else if(tbr.isTeam_isleader()) {
               emr.setTeam_leader(tbr.getEmpinfo_name());               
            }else {
               teamMembers.add(tbr.getEmp_no());
               teamMemberNames.add(tbr.getEmpinfo_name());
            }
         }
         
         //사람당 이미지파일 구하기(아직 구현 전)
         emr.setTeam_members(teamMembers);
         emr.setTeam_memberNames(teamMemberNames);
         list.add(emr);
      }
      
      return list;
   }

   @Override
   public List<TransferDto> getFilteredUser(Map<String, Object> map) {
      List<EmpSimpleResponse> esrs = employeeDao.selectNoTeamEmp();
      if(map.get("author").equals("ROLE_EMP")) {
         List<EmpSimpleResponse> teamEmps = employeeDao.selectTeamEmp(map.get("teamname").toString());
         for(EmpSimpleResponse t : teamEmps) {
            if(!t.getEmpinfo_name().equals("관리자")) {
               t.setTeam_name(map.get("teamname").toString());
               esrs.add(t);               
            }
         }
      }else if(map.get("author").equals("ROLE_PL")) {
         EmpSimpleResponse esr = employeeDao.selectTeamLeader(map.get("teamname").toString());
         esr.setTeam_name(map.get("teamname").toString());
         esrs.add(esr);
      }
      
      List<TransferDto> list = new ArrayList<>();
      int index = 1;
      
      for(EmpSimpleResponse esr : esrs) {
         TransferDto t = new TransferDto();
         t.setValue(index);
         t.setName(esr.getEmpinfo_name());
         t.setEmail(esr.getEmpinfo_email());
         t.setTeam_name(esr.getTeam_name());
         
         index++;
         list.add(t);
      }
      
      return list;
   }

   @Override
   public String getTeamDuty(String team_name) {
      
      return employeeDao.selectTeamDuty(team_name);
   }

   @Override
   @Transactional
   public void teamManaging(EmpManageRequest request) {
      if(request.getSelected_role_category().equals("ROLE_EMP")) {
         //현재 팀 전체 지우기
         employeeDao.deleteTeamEmpExceptAdmin(request.getSelected_team_name());
         //인원 리스트 no로 받기
         List<Integer> list = new ArrayList<>();
         for(TransferDto t : request.getSelected_userList()) {
            int empinfo_no = employeeDao.selectInfoNoByEmail(t.getEmail());
            list.add(empinfo_no);
         }
         
         for(int i : list) {
            Map<String, Object> map = new HashMap<>();
            map.put("empinfo_no", i);
            map.put("role_category", request.getSelected_role_category());
            map.put("project_no", 0);
            
            //리스트에 있는 인원 권한 업데이트
            employeeDao.updateRole(map);
            
            map.put("team_name", request.getSelected_team_name());
            map.put("team_duty", request.getTyped_team_duty());
            map.put("team_isleader", false);
            //리스트에 있는 인원 팀 추가
            employeeDao.insertNewTeamEmp(map);
         }         
      }else if(request.getSelected_role_category().equals("ROLE_PL")) {
         employeeDao.deleteTeamByEmpNo(request.getSelected_team_name());
         
         for(TransferDto t : request.getSelected_userList()) {
            int leader_no = employeeDao.selectInfoNoByEmail(t.getEmail());
            Map<String, Object> map = new HashMap<>();
            map.put("empinfo_no", leader_no);
            map.put("role_category", request.getSelected_role_category());
            map.put("team_name", request.getSelected_team_name());
            map.put("team_duty", request.getTyped_team_duty());
            map.put("team_isleader", true);
            map.put("project_no", 0);
            employeeDao.insertNewTeamEmp(map);
            employeeDao.updateRole(map);
            employeeDao.updateTeamDuty(map);
         }
      }else if(request.getSelected_role_category().equals("ROLE_PM")){
         Integer nowPM = employeeDao.selectRolePM(0);
         if(nowPM != null) {
            Map<String, Object> mapBefore = new HashMap<>();
            mapBefore.put("role_category", "ROLE_EMP");
            mapBefore.put("empinfo_no", nowPM);
            employeeDao.updateRole(mapBefore);
            
         }
         
         int newPM = employeeDao.selectInfoNoByEmail(request.getSelected_userList().get(0).getEmail());
         Map<String, Object> mapAfter = new HashMap<>();
         mapAfter.put("role_category", "ROLE_PM");
         mapAfter.put("empinfo_no", newPM);
         employeeDao.updateRole(mapAfter);
      }
   }
   public EmployeeInfo getEmpInfoByEmpInfoNo(int empInfoNo) {

      EmployeeInfo empInfo = employeeDao.selectEmpInfoByEmpInfoNo(empInfoNo);
      
      return empInfo;
   }
   
   public void deleteTeam(String team_name) {
      employeeDao.deleteAllTeam(team_name);
   }

   @Override
   public List<EmpNote> getAllEmp() {
      List<EmpNote> list = employeeDao.selectEmployeeForNote();
      
      return list;
   }

   @Override
   public List<EmpNote> getAllEmpAndEmpInfo() {
      List<EmpNote> list = employeeDao.selectAllEmployee();

      return list;
   }

   @Override
   public List<ProjectEmpResponse> getAllEmp(int project_no) {
      List<ProjectEmpResponse> list = employeeDao.selectProjectEmp(project_no);
      ProjectEmpResponse pm = employeeDao.selectProjectPm(project_no);
      pm.setTeam_name("프로젝트 매니저");
      list.add(pm);
      
      for(ProjectEmpResponse per : list) {
         if(per.getRole_category().equals("ROLE_EMP")) {
            per.setRole_category("팀원");
         }else if(per.getRole_category().equals("ROLE_PL")) {
            per.setRole_category("팀장");
         }else {
            per.setRole_category("PM");
         }
         
         if(per.getEmp_status() == null) {
            per.setEmp_status("3");
         }else if(per.getEmp_status().equals("on-line")) {
            per.setEmp_status("2");
         }else if(per.getEmp_status().equals("off-line")){
            per.setEmp_status("3");
         }else {
            per.setEmp_status("1");
         }
      }
      
      return list;
   }

   @Override
   public void updateLogoutStatus(String emp_id) {
      Map<String, Object> map = new HashMap<>();
      map.put("emp_id", emp_id);
      map.put("emp_status", "off-line");
      employeeDao.updateStatus(map);
   }

   @Override
   public void deleteEmp(int emp_no) {
      employeeDao.deleteEmp(emp_no);
   }

   @Override
   public List<String> getTeamNames(int project_no) {
      List<String> list = employeeDao.selectTeamname(project_no);
      return list;
   }
      
   public TimeLineResponse getTimeLineByEmpNo(Map<String, Object> map) {
      TimeLineResponse timeLineResponse = employeeDao.selectTimeLineResponse(map);
      
      if(timeLineResponse.getRole_category().equals("ROLE_PM")) {
         timeLineResponse.setRole_category("프로젝트 매니저");
      }else if(timeLineResponse.getRole_category().equals("ROLE_PL")) {
         timeLineResponse.setRole_category("팀장");
      }else if(timeLineResponse.getRole_category().equals("ROLE_ADMIN")){
         timeLineResponse.setRole_category("관리자");
      }else {
         timeLineResponse.setRole_category("팀원");
      }
      
      if(timeLineResponse.getEmp_status().equals("on-line")) {
         timeLineResponse.setEmp_status("온라인");
      }else if(timeLineResponse.getEmp_status().equals("off-line")) {
         timeLineResponse.setEmp_status("오프라인");
      }
      
      int empinfo_no = timeLineResponse.getEmpinfo_no();
      map.put("empinfo_no", empinfo_no);
      
      RecentNotice notice = noticeDao.selectRecentNotice();
      RecentNotice inquiry = noticeDao.selectRecentInquiry();
      
      RecentTask task = taskDao.selectRecentTask(map);
      RecentTask personalTask = taskDao.selectRecentPersonalTask(map);
      
      timeLineResponse.setNotice_title(notice.getNotice_title());
      timeLineResponse.setInquiry_title(inquiry.getNotice_title());
      
      timeLineResponse.setTask_name(task.getTask_name());
      timeLineResponse.setMyTask_name(personalTask.getTask_name());
      
      String nDate = notice.getNotice_createdat().substring(0, 10);
      String nTime = notice.getNotice_createdat().substring(11);
      String iDate = inquiry.getNotice_createdat().substring(0, 10);
      String iTime = inquiry.getNotice_createdat().substring(11);
      String tStart = task.getTask_startdate().substring(0, 10);
      String pStart = personalTask.getTask_startdate().substring(0, 10);
      
      timeLineResponse.setNotice_no(notice.getNotice_no());
      timeLineResponse.setNotice_createdat(nDate);
      timeLineResponse.setNotice_time(nTime);
      timeLineResponse.setInquiry_no(inquiry.getNotice_no());
      timeLineResponse.setInquiry_createdat(iDate);
      timeLineResponse.setInquiry_time(iTime);
      timeLineResponse.setTask_no(task.getTask_no());
      timeLineResponse.setTask_start(tStart);
      timeLineResponse.setMyTask_no(personalTask.getTask_no());
      timeLineResponse.setMyTask_start(pStart);
      timeLineResponse.setTwo_name(timeLineResponse.getEmpinfo_name().substring(timeLineResponse.getEmpinfo_name().length() - 2 ));
      timeLineResponse.setTeam_memberCount(employeeDao.selectTeamEmp(timeLineResponse.getTeam_name()).size() + 1);
      
      return timeLineResponse;
   }
}