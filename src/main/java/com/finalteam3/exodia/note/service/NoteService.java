package com.finalteam3.exodia.note.service;

import java.util.List;
import java.util.Map;

import com.finalteam3.exodia.note.dto.NoteAll;
import com.finalteam3.exodia.note.dto.request.Note;
import com.finalteam3.exodia.note.dto.request.NoteRequest;
import com.finalteam3.exodia.note.dto.request.ReplyRequest;

public interface NoteService {
	public List<NoteAll> getNoteListByRno(Map<String, Object> map);
	public List<NoteAll> getNoteSendListByRno(Map<String, Object> map);
	public List<NoteAll> getNoteStarredListByRno(Map<String, Object> map);
	public List<NoteAll> getNoteTrashListByRno(Map<String, Object> map);
	public List<NoteAll> getNoteDraftListByRno(Map<String, Object> map);
	public Note getNote(int noteNo);
	public int countByNoteNo(int empNo);
	public int countByNoteSenderNo(int empNo);
	public int countByNoteStarredNo(int empNo);
	public int countByNoteTrashNo(int empNo);
	public int countByNoteDraftNo(int empNo);
	public void addNote(NoteRequest note);
	public void addReply(ReplyRequest note);
	public void updateRead(int noteNo);
	public void updateStarred(int noteNo, String noteStarred);
	public void checkTrash(String checkedIdsString);
	
}
