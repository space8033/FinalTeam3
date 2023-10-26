package com.finalteam3.exodia.note.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.note.dto.NoteAll;
import com.finalteam3.exodia.note.dto.request.Note;
import com.finalteam3.exodia.note.dto.request.NoteRead;

@Mapper
public interface NoteDao {
	public List<NoteAll> selectNoteByEmpNo(Map<String, Object> map);
	public int countByEmpno(int Nno);
	public void insertNote(Note note);
	public void insertNoteRead(NoteRead noteRead);
	public int selectNoteNo(Note note);
	public void updateNoteRead(int noteReadNo);
}
