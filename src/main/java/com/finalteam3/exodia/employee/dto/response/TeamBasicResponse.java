package com.finalteam3.exodia.employee.dto.response;

import lombok.Data;

//팀의 기본 정보는 empinfo_no가 0일때에 모두 저장(팀 생성시 기본정보를 admin 계정으로 찾아옴)
@Data
public class TeamBasicResponse {
	private String team_name;
	private String team_duty;
	private int emp_no;
	private int empinfo_no;
	private String empinfo_name;
	private boolean team_isleader;
}