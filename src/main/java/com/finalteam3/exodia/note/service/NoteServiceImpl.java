package com.finalteam3.exodia.note.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finalteam3.exodia.note.dao.NoteDao;
import com.finalteam3.exodia.note.dto.NoteAll;

@Service
public class NoteServiceImpl implements NoteService{
	@Resource
	private NoteDao noteDao;

	@Override
	public List<NoteAll> getNoteListByRno(Map<String, Object> map) {
		return noteDao.selectNoteByEmpNo(map);
	}

	@Override
	public int countByNoteNo(int empNo) {
		return noteDao.countByEmpno(empNo);
	}

	


}
