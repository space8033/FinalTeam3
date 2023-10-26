package com.finalteam3.exodia.note.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.finalteam3.exodia.employee.dao.EmployeeDao;
import com.finalteam3.exodia.note.dao.NoteDao;
import com.finalteam3.exodia.note.dto.EmployeeInfo;
import com.finalteam3.exodia.note.dto.NoteAll;
import com.finalteam3.exodia.note.dto.request.Note;
import com.finalteam3.exodia.note.dto.request.NoteRead;
import com.finalteam3.exodia.note.dto.request.NoteRequest;

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
		
		note.setNote_title(request.getNote_title());
		note.setNote_content(request.getNote_content());
		
		if(request.getNote_reserve_time() == null) {
			note.setNote_restime("");
		} else {
			note.setNote_restime(request.getNote_reserve_time());
		}
		noteDao.insertNote(note);
		int generatedNoteNo = 16;
		
		//참조 수신자 분할/추가
		if(request.getNote_receiver_cc()== null) {
			
		} else {
			JSONArray receiverCC = request.getNote_receiver_cc();
			int ccLength = receiverCC.length();
			for(int i = 0; i < ccLength; i++) {
				JSONObject obj = receiverCC.getJSONObject(i);
				NoteRead noteRead = new NoteRead();
				String name = obj.getString("value");
				int nameInt = Integer.parseInt(name);
				//int receiver = employeeDao.selectNoByEmpName(name);
				noteRead.setEmp_no_receiver(nameInt);
				noteRead.setNoteRead_type("참조");
				noteRead.setNoteRead_read("0");
				noteRead.setNote_no(generatedNoteNo);
				
				log.info(noteRead.toString()+"뭐가안들어가는지 좀 보자 cc니");
				noteDao.insertNoteRead(noteRead);
		
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
				noteRead.setNote_no(generatedNoteNo);
				noteRead.setNoteRead_read("0");
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
					noteRead.setNote_no(generatedNoteNo);
					log.info(noteRead.toString()+"뭐가안들어가는지 좀 보자 bcc니");
					noteRead.setNoteRead_read("0");
					noteDao.insertNoteRead(noteRead);
				}
			}
		}
	}
}
