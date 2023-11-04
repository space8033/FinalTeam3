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
	
	//쪽지 상세에서 참조/비밀참조 인원불러오기
	public List<NoteRead> selectNoteReadByNoteNo(int noteNo);
	
	//노트번호로 노트불러오기
	public Note selectNoteByNoteNo(int noteNo);
	
	//인원수 불러오기
	
	//페이징을 위한 카운트
	public int countByEmpno(int Nno);
	public int countBySentEmpno(int Nno);
	public int countByStarredEmpno(int Nno);
	public int countByTrashEmpno(int Nno);
	public int countByDraftEmpno(int Nno);
	
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
	public void deleteTrashNote(int noteReadNo);
	public void recoveryNotebyNoteRead(NoteRead noteRead);
	
	//noteReadNo로 noteRead불러오기
	public NoteRead selectNoteReadByNoteReadNo(int noteReadNo);
}
