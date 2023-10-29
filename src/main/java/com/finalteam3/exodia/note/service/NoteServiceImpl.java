package com.finalteam3.exodia.note.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finalteam3.exodia.employee.dao.EmployeeDao;
import com.finalteam3.exodia.note.dao.NoteDao;
import com.finalteam3.exodia.note.dto.EmployeeInfo;
import com.finalteam3.exodia.note.dto.NoteAll;
import com.finalteam3.exodia.note.dto.request.Note;
import com.finalteam3.exodia.note.dto.request.NoteRead;
import com.finalteam3.exodia.note.dto.request.NoteRequest;
import com.finalteam3.exodia.note.dto.request.ReplyRequest;

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

	@Override
	public void addNote(NoteRequest request) {
		Note note = new Note();
		
		//note테이블 insert
		note.setNote_sender(request.getNote_sender());
		note.setNote_title(request.getNote_title());
		
		log.info(request.getNote_content().toString()+"내용알려줘엉");
		log.info(request.getNote_content());
		note.setNote_content(request.getNote_content());
		
		
		if(request.getNote_reserve_time() == null) {
			note.setNote_restime("");
		} else {
			note.setNote_restime(request.getNote_reserve_time());
		}
		noteDao.insertNote(note);
		
		int noteNo = note.getNote_no();
		log.info(noteNo+"노트넘버 삽입됐낭");
		
		//참조 수신자 분할/추가
		List<String> receiverCC = request.getNote_receiver_cc();
		if(request.getNote_receiver_bcc() == null) {

		} else {
			for(String receiverCCName : receiverCC) {
				String[] parts = receiverCCName.split(",");
				for(String nameCC : parts) {
					NoteRead noteRead = new NoteRead();
					int receiverNoCC = employeeDao.selectNoByEmpName(nameCC);
					noteRead.setEmp_no_receiver(receiverNoCC);
					noteRead.setNoteRead_type("참조");
					noteRead.setNote_no(noteNo);
					log.info(noteRead.toString()+"뭐가안들어가는지 좀 보자 수신자니");
					noteDao.insertNoteRead(noteRead);
				}
			}
		}
		
		//수신자 분할/추가
		List<String> receiverList = request.getNote_receiver();

		for(String receiver : receiverList) {
			String[] parts = receiver.split(",");
			for(String name : parts) {
				NoteRead noteRead = new NoteRead();
				int receiverNo = employeeDao.selectNoByEmpName(name);
				noteRead.setEmp_no_receiver(receiverNo);
				noteRead.setNoteRead_type("수신");
				noteRead.setNote_no(noteNo);
				log.info(noteRead.toString()+"뭐가안들어가는지 좀 보자 수신자니");
				noteDao.insertNoteRead(noteRead);
			}
		}
		
		//비밀참조 분할/추가
		List<String> receiverBCC = request.getNote_receiver_bcc();
		
		if(request.getNote_receiver_bcc() == null) {

		} else {
			for(String receiverBccName : receiverBCC) {
				String[] parts = receiverBccName.split(",");
				for(String namebcc : parts) {
					NoteRead noteRead = new NoteRead();
					int receiverBccNo = employeeDao.selectNoByEmpName(namebcc);
					noteRead.setEmp_no_receiver(receiverBccNo);
					noteRead.setNoteRead_type("비밀참조");
					noteRead.setNote_no(noteNo);
					log.info(noteRead.toString()+"뭐가안들어가는지 좀 보자 bcc니");
					noteDao.insertNoteRead(noteRead);
				}
			}
		}
	}

	@Override
	public void updateRead(int noteNo) {
		NoteRead noteRead = noteDao.selectNoteRead(noteNo);
		String noteReadRead = noteRead.getNoteRead_read();
		if(noteReadRead == null) {
			noteDao.updateNoteRead(noteNo);
		}
	}
	
	//발신 쪽지 가져오기
	@Override
	public List<NoteAll> getNoteSendListByRno(Map<String, Object> map) {
		log.info(map+"잘가져오나.");
		
		
		List<NoteAll> noteAllList = noteDao.selectSentNoteByEmpNo(map);
		for(NoteAll noteAll : noteAllList) {
			int senderNo = noteAll.getNote_sender();
			EmployeeInfo sender = employeeDao.selectInfoByEmpNo(senderNo);
			noteAll.setNote_sender_name(sender.getEmpinfo_name());
		}
		
		
		return noteAllList;
	}
	
	//중요 쪽지 가져오기
	@Override
	public List<NoteAll> getNoteStarredListByRno(Map<String, Object> map) {
		List<NoteAll> noteAllList = noteDao.selectStarredNoteByEmpNo(map);
		for(NoteAll noteAll : noteAllList) {
			int senderNo = noteAll.getNote_sender();
			EmployeeInfo sender = employeeDao.selectInfoByEmpNo(senderNo);
			noteAll.setNote_sender_name(sender.getEmpinfo_name());
		}
		return noteAllList;
	}
	
	//휴지통 쪽지 가져오기
	@Override
	public List<NoteAll> getNoteTrashListByRno(Map<String, Object> map) {
		List<NoteAll> noteAllList = noteDao.selectTrashNoteByEmpNo(map);
		for(NoteAll noteAll : noteAllList) {
			int senderNo = noteAll.getNote_sender();
			EmployeeInfo sender = employeeDao.selectInfoByEmpNo(senderNo);
			noteAll.setNote_sender_name(sender.getEmpinfo_name());
		}
		return noteAllList;
	}
	
	//임시저장 쪽지 가져오기
	@Override
	public List<NoteAll> getNoteDraftListByRno(Map<String, Object> map) {
		
		List<NoteAll> noteAllList = noteDao.selectDraftNoteByEmpNo(map);
		for(NoteAll noteAll : noteAllList) {
			int senderNo = noteAll.getNote_sender();
			EmployeeInfo sender = employeeDao.selectInfoByEmpNo(senderNo);
			noteAll.setNote_sender_name(sender.getEmpinfo_name());
		}
		
		
		return noteAllList;
	}
    
	//임시 쪽지 개수
	@Override
	public int countByNoteDraftNo(int empNo) {
		return noteDao.countByDraftEmpno(empNo);
	}

	//휴지통 쪽지 개수
	@Override
	public int countByNoteTrashNo(int empNo) {
		return noteDao.countByTrashEmpno(empNo);
	}


	//발신 쪽지 개수
	@Override
	public int countByNoteSenderNo(int empNo) {
		return noteDao.countBySentEmpno(empNo);
	}
	//중요 쪽지 개수
	@Override
	public int countByNoteStarredNo(int empNo) {
		return noteDao.countByStarredEmpno(empNo);
	}

	@Override
	public Note getNote(int noteReadNo) {
		
		
		NoteRead noteRead = noteDao.selectNoteRead(noteReadNo);
		int noteNo = noteRead.getNote_no();
		Note note = noteDao.selectNoteByNoteNo(noteNo);
		
		return note;
	}

	@Override
	public void addReply(ReplyRequest request) {
		Note note = new Note();
		
		//note테이블 insert
		note.setNote_sender(request.getNote_sender());
		note.setNote_title("re: " + request.getNote_title());
		
		log.info(request.getNote_content().toString()+"내용알려줘엉");
		note.setNote_content(request.getNote_content());
		
		
		if(request.getNote_reserve_time() == null) {
			note.setNote_restime("");
		} else {
			note.setNote_restime(request.getNote_reserve_time());
		}
		noteDao.insertNote(note);
		
		int noteNo = note.getNote_no();
		log.info(noteNo+"노트넘버 삽입됐낭");
		
		int requestNo = request.getNote_no();
		log.info(requestNo+"일단 답장할 노트No 잘가져오나");
		
		
		//답장 표시 noteRead
		int receiver = Integer.parseInt(request.getNote_receiver());
		
		
		
		NoteRead noteRead = new NoteRead();
		noteRead.setEmp_no_receiver(receiver);
		noteRead.setNoteRead_type("답장");
		noteRead.setNote_no(noteNo);
		noteDao.insertNoteRead(noteRead);
	}

	@Override
	public void updateStarred(int noteNo, String noteStarred) {
		
		NoteRead noteRead = new NoteRead();
		noteRead.setNoteRead_no(noteNo);
		noteRead.setNoteRead_starred(noteStarred);
		noteDao.updateNoteStarred(noteRead);
		
	}


	
	
}
