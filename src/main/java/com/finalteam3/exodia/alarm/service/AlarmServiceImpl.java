package com.finalteam3.exodia.alarm.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.finalteam3.exodia.alarm.dao.AlarmDao;
import com.finalteam3.exodia.alarm.dto.request.AlarmRequest;
import com.finalteam3.exodia.employee.dao.EmployeeDao;
import com.finalteam3.exodia.employee.dto.response.EmpNote;
import com.finalteam3.exodia.employee.dto.response.TeamBasicResponse;
import com.finalteam3.exodia.inquiry.dao.InquiryDao;
import com.finalteam3.exodia.inquiry.dto.Reply;
import com.finalteam3.exodia.notice.dto.Notice;
import com.finalteam3.exodia.task.dao.TaskDao;
import com.finalteam3.exodia.task.dto.response.ProgramTaskResponse;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AlarmServiceImpl implements AlarmService {
	@Resource 
	private AlarmDao alarmDao;
	
	@Resource 
	private TaskDao taskDao;
	
	@Resource 
	private EmployeeDao empDao;
	@Resource 
	private InquiryDao inquiryDao;
	
	
	
	@Override
	public List<AlarmRequest> getAlarmList(int empInfoNo) {
		List<AlarmRequest> alarmList = alarmDao.selectAlarmList(empInfoNo);
	
	    return alarmList;
	}



	@Override
	public void deleteAlarm(int alarmNo) {
		
		alarmDao.deleteAlarmByAlarmNo(alarmNo);
	}



	@Override
	public void updateAlarmRead(int alarmNo) {

		AlarmRequest alarm = new AlarmRequest();
		alarm.setAlarm_no(alarmNo);
		alarm.setAlarm_isRead(true);
		alarmDao.updateAlarmReadByAlarmNo(alarm);
	}



	@Override
	public int uckAlarmCount(int empInfoNo) {
		return alarmDao.countUckAlarm(empInfoNo);
	}



	@Override
	@Scheduled(cron = "0 0 0 * * ?")
	public void programStartAlarm() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate = sdf.format(new Date());
		ProgramTaskResponse program = new ProgramTaskResponse();
		program.setTask_startdate(currentDate);
		List<ProgramTaskResponse> programList = taskDao.selectTaskStartDate(program);
		
		for(ProgramTaskResponse programStart : programList) {
			AlarmRequest alarm = new AlarmRequest();
			alarm.setAlarm_type("프로그램");
			alarm.setAlarm_typeNo(programStart.getTask_no());
			
			int empInfoNo = empDao.selectEmpInfoNoByEmpNo(programStart.getEmp_no());
			alarm.setEmpinfo_no(empInfoNo);
			alarm.setAlarm_content(programStart.getTask_name());
			alarm.setAlarm_isRead(false);
			alarmDao.insertAlarm(alarm);
		}
		
	}



	@Override
	public void insertNoticeAlarm(Notice notice) {
		
		List<EmpNote> empList = empDao.selectEmployeeForNote();
		List<EmpNote> empListPM = empDao.selectPM();
		empList.addAll(empListPM);
		
		for(EmpNote emp : empList) {
			if(emp.getEmpinfo_no() != 0) {
				AlarmRequest alarm = new AlarmRequest();
				alarm.setAlarm_content(notice.getNotice_title());
				alarm.setAlarm_isRead(false);
				alarm.setAlarm_type("공지");
				alarm.setAlarm_typeNo(notice.getNotice_no());
				alarm.setEmpinfo_no(emp.getEmpinfo_no());
				alarmDao.insertAlarm(alarm);
				
			}
			
		}
		
	}



	@Override
	public void deleteNoticeAlarm(int noticeNo) {
		AlarmRequest alarm = new AlarmRequest();
		alarm.setAlarm_type("공지");
		alarm.setAlarm_typeNo(noticeNo);
		alarmDao.deleteAlarmByAlarm(alarm);
		
	}



	@Override
	public void insertInquiryeAlarm(Notice inquiry) {
		String inquiryTitle = inquiry.getNotice_title();
		int startIndex = inquiryTitle.indexOf("[");
        int endIndex = inquiryTitle.indexOf("]");

        String teamName = null;
        String alarmTitle = null;

        // 부분 문자열 추출
        if (startIndex != -1 && endIndex != -1) {
            teamName = inquiryTitle.substring(startIndex + 1, endIndex);
            if (endIndex + 1 < inquiryTitle.length()) {
                alarmTitle = inquiryTitle.substring(endIndex + 1);
            }
        }
        
        List<TeamBasicResponse> teamList = empDao.selectTeamBasic(teamName);
        for(TeamBasicResponse team : teamList) {
        	AlarmRequest alarm = new AlarmRequest();
        	alarm.setAlarm_content(alarmTitle);
        	alarm.setAlarm_isRead(false);
        	alarm.setAlarm_type("문의");
        	alarm.setAlarm_typeNo(inquiry.getNotice_no());
        	alarm.setEmpinfo_no(team.getEmpinfo_no());
        	alarmDao.insertAlarm(alarm);
        }
	}


	@Override
	public void deleteInquiryAlarm(int inquiryNo) {
		AlarmRequest alarm = new AlarmRequest();
		alarm.setAlarm_type("문의");
		alarm.setAlarm_typeNo(inquiryNo);
		alarmDao.deleteAlarmByAlarm(alarm);
		
	}



	@Override
	public void insertReplyAlarm(Reply reply) {
		AlarmRequest alarm = new AlarmRequest();
		int inquiryNo = reply.getNotice_no();
		Notice notice = inquiryDao.selectDetailByNoticeNo(inquiryNo);
		
		alarm.setEmpinfo_no(notice.getEmpinfo_no());
		alarm.setAlarm_content(notice.getNotice_title());
		alarm.setAlarm_isRead(false);
		alarm.setAlarm_type("댓글");
		alarm.setAlarm_typeNo(reply.getReply_no());
		alarmDao.insertAlarm(alarm);
		
	}


	@Override
	public void deleteReplyAlarm(int replyNo) {
		AlarmRequest alarm = new AlarmRequest();
		alarm.setAlarm_type("댓글");
		alarm.setAlarm_typeNo(replyNo);
		alarmDao.deleteAlarmByAlarm(alarm);
		
	}
	
}
