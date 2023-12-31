package com.finalteam3.exodia.note.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.note.dto.NoteAll;
import com.finalteam3.exodia.note.dto.request.Note;
import com.finalteam3.exodia.note.dto.request.NoteRead;

@Mapper
public interface NoteDao {
	
	//쪽지함 불러오기
	public List<NoteAll> selectNoteByEmpNo(Map<String, Object> map);
	public List<NoteAll> selectSentNoteByEmpNo(Map<String, Object> map);
	public List<NoteAll> selectStarredNoteByEmpNo(Map<String, Object> map);
	public List<NoteAll> selectTrashNoteByEmpNo(Map<String, Object> map);
	public List<NoteAll> selectDraftNoteByEmpNo(Map<String, Object> map);
	
	//쪽지함 검색
	public List<NoteAll> searchNoteByEmpNo(Map<String, Object> map);
	public List<NoteAll> searchSentNoteByEmpNo(Map<String, Object> map);
	public List<NoteAll> searchStarredNoteByEmpNo(Map<String, Object> map);
	public List<NoteAll> searchTrashNoteByEmpNo(Map<String, Object> map);
	public List<NoteAll> searchDraftNoteByEmpNo(Map<String, Object> map);
	
	//예약 전송
	public List<Note> selectNoteByNoteRestime(String currentDate);
	public void updateNoteRestime(Note noteNo);
	
	//쪽지 상세에서 참조/비밀참조 인원불러오기
	public List<NoteRead> selectNoteReadByNoteNo(int noteNo);
	
	//노트번호로 노트불러오기
	public Note selectNoteByNoteNo(int noteNo);
	
	//임시저장 메세지 전송
	public void updateDraftNote(Note note);
	
	//페이징을 위한 카운트
	public int countByEmpno(int Nno);
	public int countBySentEmpno(int Nno);
	public int countByStarredEmpno(int Nno);
	public int countByTrashEmpno(int Nno);
	public int countByDraftEmpno(int Nno);
	
	//검색 페이징을 위한 카운트
	public int countBySearchEmpno(Map<String, Object> map);
	public int countBySearchSentEmpno(Map<String, Object> map);
	public int countBySearchStarredEmpno(Map<String, Object> map);
	public int countBySearchTrashEmpno(Map<String, Object> map);
	public int countBySearchDraftEmpno(Map<String, Object> map);
	
	
	
	//페이징을 위한 카운트
	public int countByUnreadInbox(int Nno);
	
	/*public int countByStarredEmpno(int Nno);
	public int countByTrashEmpno(int Nno);
	public int countByDraftEmpno(int Nno);
	*/
	//쪽지 정보 삽입
	public void insertNote(Note note);
	public void insertNoteRead(NoteRead noteRead);
	
	public int selectNoteNo(Note note);
	
	//noteRead 업데이트
	public void updateNoteRead(int noteReadNo);
	public NoteRead selectNoteRead(int noteReadNo);
	
	//중요쪽지 업데이트
	public void updateNoteStarred(NoteRead noteRead);
	
	//휴지통에 넣기, 휴지통 비우기 / 휴지통 복구
	public void trashNote(int noteReadNo);
	public void trashNoteSent(int noteNo);
	public void deleteTrashNote(int noteReadNo);
	public void recoveryNotebyNoteRead(NoteRead noteRead);
	
	//발송취소
	public void sentCancelNote(int noteReadNo);
	
	public Note selectNoteByNoteCreatedAt(Note note);
	//noteReadNo로 noteRead불러오기
	public NoteRead selectNoteReadByNoteReadNo(int noteReadNo);
}
