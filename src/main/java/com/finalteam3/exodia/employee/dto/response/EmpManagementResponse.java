package com.finalteam3.exodia.employee.dto.response;

import java.util.List;

import com.finalteam3.exodia.media.dto.MediaDto;

import lombok.Data;

//팀의 기본 정보는 empinfo_no가 0일때에 모두 저장(팀 생성시 기본정보를 admin 계정으로 찾아옴)
@Data
public class EmpManagementResponse {
	private String team_name;
	private String team_leader;
	private List<Integer> team_members;
	//private List<MediaDto> team_member;
	private String team_duty;
}