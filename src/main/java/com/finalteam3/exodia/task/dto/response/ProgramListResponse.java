package com.finalteam3.exodia.task.dto.response;

import java.util.Comparator;

import lombok.Data;

@Data
public class ProgramListResponse {
	private int id;
	private int task_no;
	private String team_name;
	private String task_name;
	private int empinfo_no;
	private String empinfo_name;
	private String task_startdate;
	private String task_enddate;
	private String task_date;
	private String task_status;
	private String task_progress;
	
	public static Comparator<ProgramListResponse> empinfoNoComparator(int specificEmpinfoNo) {
        return (p1, p2) -> {
            if (p1.getEmpinfo_no() == specificEmpinfoNo) {
                return -1; // 특정 empinfo_no가 가장 앞으로 오도록
            } else if (p2.getEmpinfo_no() == specificEmpinfoNo) {
                return 1;  // 특정 empinfo_no가 가장 앞으로 오도록
            } else {
                return Integer.compare(p1.getEmpinfo_no(), p2.getEmpinfo_no());
            }
        };
    }
}
