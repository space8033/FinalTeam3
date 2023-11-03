package com.finalteam3.exodia.note.service;

import java.util.List;
import java.util.Map;

import com.finalteam3.exodia.employee.dto.response.EmpNote;
import com.finalteam3.exodia.media.dto.MediaDto;
import com.finalteam3.exodia.note.dto.NoteAll;
import com.finalteam3.exodia.note.dto.request.Note;
import com.finalteam3.exodia.note.dto.request.NoteRead;
import com.finalteam3.exodia.note.dto.request.NoteRequest;
import com.finalteam3.exodia.note.dto.request.ReplyRequest;
import com.finalteam3.exodia.note.dto.response.NoteResponse;

public interface NoteService {
	public List<NoteAll> getNoteListByRno(Map<String, Object> map);
	public List<NoteAll> getNoteSendListByRno(Map<String, Object> map);
	public List<NoteAll> getNoteStarredListByRno(Map<String, Object> map);
	public List<NoteAll> getNoteTrashListByRno(Map<String, Object> map);
	public List<NoteAll> getNoteDraftListByRno(Map<String, Object> map);
	public List<EmpNote> getEmpList();
	public List<String> getTeamList();
	public List<MediaDto> getMediaList(int noteNo);
	
	//쪽지 번호로 수신/참조/비밀참조 얻어오기
	public List<NoteResponse> getNoteReceiver(int noteNo, int empNo);
	public Note getNote(int noteReadNo);
	public Note getNoteSent(int noteNo);
	public int countByNoteNo(int empNo);
	public int countByNoteSenderNo(int empNo);
	public int countByNoteStarredNo(int empNo);
	public int countByNoteTrashNo(int empNo);
	public int countByNoteDraftNo(int empNo);
	
	//안읽은 쪽지
	public int countByUnreadNoteNo(int empNo);
	
	
	public void addNote(NoteRequest note) throws Exception;
	public void addReply(ReplyRequest note) throws Exception;
	public void updateRead(int noteNo);
	public void updateStarred(int noteNo, String noteStarred);
	public void checkTrash(String checkedIdsString);
	public void deleteTrash(String checkedIdsString);
	public void recoverTrashNote(String checkedIdsString);
	public NoteRead getNoteRead(int noteReadNo);
	
	
	public void addDraft(NoteRequest note) throws Exception;
	
}
