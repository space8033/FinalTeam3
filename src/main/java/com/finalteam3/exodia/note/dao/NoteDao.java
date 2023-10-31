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
	public List<NoteAll> selectSentNoteByEmpNo(Map<String, Object> map);
	public List<NoteAll> selectStarredNoteByEmpNo(Map<String, Object> map);
	public List<NoteAll> selectTrashNoteByEmpNo(Map<String, Object> map);
	public List<NoteAll> selectDraftNoteByEmpNo(Map<String, Object> map);
	public Note selectNoteByNoteNo(int noteNo);
	public int countByEmpno(int Nno);
	public int countBySentEmpno(int Nno);
	public int countByStarredEmpno(int Nno);
	public int countByTrashEmpno(int Nno);
	public int countByDraftEmpno(int Nno);
	public void insertNote(Note note);
	public void insertNoteRead(NoteRead noteRead);
	public int selectNoteNo(Note note);
	public void updateNoteRead(int noteReadNo);
	public NoteRead selectNoteRead(int noteReadNo);
	public void updateNoteStarred(NoteRead noteRead);
	public void trashNote(int noteReadNo);
	public void recoveryNotebyNoteRead(NoteRead noteRead);
	public NoteRead selectNoteReadByNoteReadNo(int noteReadNo);
}
