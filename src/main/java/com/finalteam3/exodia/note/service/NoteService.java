package com.finalteam3.exodia.note.service;

import java.util.List;
import java.util.Map;

import com.finalteam3.exodia.note.dto.NoteAll;
import com.finalteam3.exodia.note.dto.request.Note;
import com.finalteam3.exodia.note.dto.request.NoteRequest;

public interface NoteService {
	public List<NoteAll> getNoteListByRno(Map<String, Object> map);
	public int countByNoteNo(int noteNo);
	public void addNote(NoteRequest note);
	public void updateRead(int noteNo);
	
}
