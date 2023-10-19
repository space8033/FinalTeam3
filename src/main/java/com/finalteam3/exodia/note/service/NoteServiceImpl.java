package com.finalteam3.exodia.note.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finalteam3.exodia.employee.dao.EmployeeDao;
import com.finalteam3.exodia.note.dao.NoteDao;
import com.finalteam3.exodia.note.dto.EmployeeInfo;
import com.finalteam3.exodia.note.dto.NoteAll;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NoteServiceImpl implements NoteService{
	@Resource
	private NoteDao noteDao;
	@Resource
	private EmployeeDao employeeDao;

	@Override
	public List<NoteAll> getNoteListByRno(Map<String, Object> map) {
		log.info(map+"잘가져오나.");
		List<NoteAll> noteAllList = noteDao.selectNoteByEmpNo(map);
		for(NoteAll noteAll : noteAllList) {
			int senderNo = noteAll.getNote_sender();
			EmployeeInfo sender = employeeDao.selectInfoByEmpNo(senderNo);
			noteAll.setNote_sender_name(sender.getEmpinfo_name());
		}
		return noteAllList;
	}

	@Override
	public int countByNoteNo(int empNo) {
		return noteDao.countByEmpno(empNo);
	}

	


}
