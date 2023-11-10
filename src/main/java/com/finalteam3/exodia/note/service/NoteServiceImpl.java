package com.finalteam3.exodia.note.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.finalteam3.exodia.alarm.dao.AlarmDao;
import com.finalteam3.exodia.alarm.dto.request.AlarmRequest;
import com.finalteam3.exodia.chat.dto.response.EmpChat;
import com.finalteam3.exodia.employee.dao.EmployeeDao;
import com.finalteam3.exodia.employee.dto.response.EmpNote;
import com.finalteam3.exodia.media.dao.MediaDao;
import com.finalteam3.exodia.media.dto.MediaDto;
import com.finalteam3.exodia.note.dao.NoteDao;
import com.finalteam3.exodia.note.dto.EmployeeInfo;
import com.finalteam3.exodia.note.dto.NoteAll;
import com.finalteam3.exodia.note.dto.request.Note;
import com.finalteam3.exodia.note.dto.request.NoteRead;
import com.finalteam3.exodia.note.dto.request.NoteRequest;
import com.finalteam3.exodia.note.dto.request.ReplyRequest;
import com.finalteam3.exodia.note.dto.response.NoteResponse;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NoteServiceImpl implements NoteService{
	@Resource
	private NoteDao noteDao;
	@Resource
	private EmployeeDao employeeDao;
	@Resource
	private AlarmDao alarmDao;
	@Resource
	private MediaDao mediaDao;

	@Override
	public List<NoteAll> getNoteListByRno(Map<String, Object> map) {
		log.info(map+"잘가져오나.");
		List<NoteAll> noteAllList = noteDao.selectNoteByEmpNo(map);
		for(NoteAll noteAll : noteAllList) {
			int senderNo = noteAll.getNote_sender();
			EmployeeInfo sender = employeeDao.selectInfoByEmpNo(senderNo);
			noteAll.setNote_sender_name(sender.getEmpinfo_name());
			int noteNo = noteAll.getNote_no();
			MediaDto media = new MediaDto();
			media.setFrom_no(noteNo);
			media.setMedia_from("NOTE");
			List<MediaDto> mediaList = mediaDao.selectMedia(media);
			if(mediaList.isEmpty()) {
				noteAll.setMedia_isEmpty(true);
			}else {
				noteAll.setMedia_isEmpty(false);
			}
			
			
		}
		return noteAllList;
	}

	@Override
	public int countByNoteNo(int empNo) {
		return noteDao.countByEmpno(empNo);
	}

	@Override
	@Scheduled(cron = "0 * * * * ?")
	public void restimeSend() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String currentDate = sdf.format(new Date());
		List<Note> noteRestimes = noteDao.selectNoteByNoteRestime(currentDate);
		
		for (Note noteRestime : noteRestimes) {
			Note note = new Note();
			note.setNote_createdAt(noteRestime.getNote_restime());
			note.setNote_restime("예약 전송 완료");
			note.setNote_no(noteRestime.getNote_no());
			noteDao.updateNoteRestime(note);
			log.info("예약전송완료");
			
		}
	}
	
	
	@Override
	public void addNote(NoteRequest request) throws Exception {
		Note note = new Note();
		AlarmRequest alarm = new AlarmRequest();
		
		//note테이블 insert
		note.setNote_sender(request.getNote_sender());
		note.setNote_title(request.getNote_title());
		
		log.info(request.getNote_content().toString()+"내용알려줘엉");
		log.info(request.getNote_content());
		note.setNote_content(request.getNote_content());
		note.setNote_label(request.getNote_label());
		note.setNote_draft("");
		
		
		if(request.getNote_reserve_time() == null) {
			note.setNote_restime("");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
	        String formattedDate = sdf.format(new Date());

			
			note.setNote_createdAt(formattedDate);
		} else {
			note.setNote_createdAt("");
			
			String inputDate = request.getNote_reserve_time();
	        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
	        
	        Date date = inputFormat.parse(inputDate);
	        String outputDate = outputFormat.format(date);
			
			
			note.setNote_restime(outputDate);
			
		}
		noteDao.insertNote(note);
		
		int noteNo = note.getNote_no();
		log.info(noteNo+"노트넘버 삽입됐낭");
		
		
		
		
		//참조 수신자 분할/추가
		List<String> receiverCC = request.getNote_receiver_cc();
		if(request.getNote_receiver_cc() == null) {

		} else {
			for(String receiverCCNo : receiverCC) {
				String[] parts = receiverCCNo.split(",");
				for(String noCC : parts) {
					NoteRead noteRead = new NoteRead();
					int receiverNoCC = Integer.parseInt(noCC);
					noteRead.setEmp_no_receiver(receiverNoCC);
					noteRead.setNoteRead_type("참조");
					noteRead.setNote_no(noteNo);
					log.info(noteRead.toString()+"뭐가안들어가는지 좀 보자 수신자니");
					noteDao.insertNoteRead(noteRead);
					
					EmployeeInfo employeeInfo = employeeDao.selectInfoByEmpNo(receiverNoCC);
					int empInfo_no = employeeInfo.getEmpinfo_no();
					alarm.setAlarm_isRead(false);
					alarm.setAlarm_type("쪽지");
					alarm.setAlarm_typeNo(noteRead.getNoteRead_no());
					alarm.setEmpinfo_no(empInfo_no);
					alarmDao.insertAlarm(alarm);
					
				}
			}
		}
		
		//수신자 분할/추가
		List<String> receiverList = request.getNote_receiver();
		if(request.getNote_receiver() == null) {

		} else {
			for(String receiver : receiverList) {
				String[] parts = receiver.split(",");
				for(String no : parts) {
					NoteRead noteRead = new NoteRead();
					int receiverNo = Integer.parseInt(no);
					noteRead.setEmp_no_receiver(receiverNo);
					noteRead.setNoteRead_type("수신");
					noteRead.setNote_no(noteNo);
					log.info(noteRead.toString()+"뭐가안들어가는지 좀 보자 수신자니");
					noteDao.insertNoteRead(noteRead);
					
					EmployeeInfo employeeInfo = employeeDao.selectInfoByEmpNo(receiverNo);
					int empInfo_no = employeeInfo.getEmpinfo_no();
					alarm.setAlarm_isRead(false);
					alarm.setAlarm_type("쪽지");
					alarm.setAlarm_typeNo(noteRead.getNoteRead_no());
					alarm.setEmpinfo_no(empInfo_no);
					alarmDao.insertAlarm(alarm);
				}
			}
		}
		//비밀참조 분할/추가
		List<String> receiverBCC = request.getNote_receiver_bcc();
		
		if(request.getNote_receiver_bcc() == null) {

		} else {
			for(String receiverBccName : receiverBCC) {
				String[] parts = receiverBccName.split(",");
				for(String nobcc : parts) {
					NoteRead noteRead = new NoteRead();
					int receiverBccNo = Integer.parseInt(nobcc);
					noteRead.setEmp_no_receiver(receiverBccNo);
					noteRead.setNoteRead_type("비밀참조");
					noteRead.setNote_no(noteNo);
					log.info(noteRead.toString()+"뭐가안들어가는지 좀 보자 bcc니");
					noteDao.insertNoteRead(noteRead);
					
					EmployeeInfo employeeInfo = employeeDao.selectInfoByEmpNo(receiverBccNo);
					int empInfo_no = employeeInfo.getEmpinfo_no();
					alarm.setAlarm_isRead(false);
					alarm.setAlarm_type("쪽지");
					alarm.setAlarm_typeNo(noteRead.getNoteRead_no());
					alarm.setEmpinfo_no(empInfo_no);
					alarmDao.insertAlarm(alarm);
				}
			}
		}
		
		
		
		
		MultipartFile[] uploadFiles = request.getFiles();
		if(uploadFiles != null && uploadFiles.length > 0) {
			for(MultipartFile noteFile : uploadFiles) {
				if(!noteFile.isEmpty()) {
					MediaDto noteMedia = new MediaDto();
					noteMedia.setMedia_data(noteFile.getBytes());
					noteMedia.setMedia_name(noteFile.getOriginalFilename());
					noteMedia.setMedia_type(noteFile.getContentType());
					noteMedia.setMedia_from("NOTE");
					noteMedia.setFrom_no(noteNo);
					mediaDao.insertMedia(noteMedia);
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
			int noteNo = noteAll.getNote_no();
			MediaDto media = new MediaDto();
			media.setFrom_no(noteNo);
			media.setMedia_from("NOTE");
			List<MediaDto> mediaList = mediaDao.selectMedia(media);
			if(mediaList.isEmpty()) {
				noteAll.setMedia_isEmpty(true);
			}else {
				noteAll.setMedia_isEmpty(false);
			}
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
			int noteNo = noteAll.getNote_no();
			MediaDto media = new MediaDto();
			media.setFrom_no(noteNo);
			media.setMedia_from("NOTE");
			List<MediaDto> mediaList = mediaDao.selectMedia(media);
			if(mediaList.isEmpty()) {
				noteAll.setMedia_isEmpty(true);
			}else {
				noteAll.setMedia_isEmpty(false);
			}
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
			int noteNo = noteAll.getNote_no();
			MediaDto media = new MediaDto();
			media.setFrom_no(noteNo);
			media.setMedia_from("NOTE");
			List<MediaDto> mediaList = mediaDao.selectMedia(media);
			if(mediaList.isEmpty()) {
				noteAll.setMedia_isEmpty(true);
			}else {
				noteAll.setMedia_isEmpty(false);
			}
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
			int noteNo = noteAll.getNote_no();
			MediaDto media = new MediaDto();
			media.setFrom_no(noteNo);
			media.setMedia_from("NOTE");
			List<MediaDto> mediaList = mediaDao.selectMedia(media);
			if(mediaList.isEmpty()) {
				noteAll.setMedia_isEmpty(true);
			}else {
				noteAll.setMedia_isEmpty(false);
			}
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
	public Note getNoteSent(int noteNo) {
		
		Note note = noteDao.selectNoteByNoteNo(noteNo);
		
		
		return note;
	}

	@Override
	public void addReply(ReplyRequest request) throws Exception {
		Note note = new Note();
		AlarmRequest alarm = new AlarmRequest();
		//note테이블 insert
		note.setNote_sender(request.getNote_sender());
		note.setNote_title("re: " + request.getNote_title());
		
		note.setNote_content(request.getNote_content());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
        String formattedDate = sdf.format(new Date());

		
		note.setNote_createdAt(formattedDate);
		note.setNote_label("일반 쪽지");
		if(request.getNote_reserve_time() == null) {
			note.setNote_restime("");
		} else {
			note.setNote_restime(request.getNote_reserve_time());
		}
		note.setNote_draft("");
		noteDao.insertNote(note);
		
		int noteNo = note.getNote_no();
		log.info(noteNo+"노트넘버 삽입됐낭");
		
		int requestNo = request.getNote_no();
		log.info(requestNo+"일단 답장할 노트No 잘가져오나");
		
		
		//답장 표시 noteRead
		int receiver = Integer.parseInt(request.getNote_receiver());
		
		
		
		NoteRead noteRead = new NoteRead();
		noteRead.setEmp_no_receiver(receiver);
		noteRead.setNoteRead_type("수신");
		noteRead.setNote_no(noteNo);
		noteDao.insertNoteRead(noteRead);
		
		EmployeeInfo employeeInfo = employeeDao.selectInfoByEmpNo(receiver);
		int empInfo_no = employeeInfo.getEmpinfo_no();
		alarm.setAlarm_isRead(false);
		alarm.setAlarm_type("쪽지");
		alarm.setAlarm_typeNo(noteRead.getNoteRead_no());
		alarm.setEmpinfo_no(empInfo_no);
		alarmDao.insertAlarm(alarm);
		
		
		MultipartFile[] uploadFiles = request.getReply_files();
		if(uploadFiles != null && uploadFiles.length > 0) {
			for(MultipartFile noteFile : uploadFiles) {
				if(!noteFile.isEmpty()) {
					MediaDto noteMedia = new MediaDto();
					noteMedia.setMedia_data(noteFile.getBytes());
					noteMedia.setMedia_name(noteFile.getOriginalFilename());
					noteMedia.setMedia_type(noteFile.getContentType());
					noteMedia.setMedia_from("NOTE");
					noteMedia.setFrom_no(noteNo);
					mediaDao.insertMedia(noteMedia);
				}
			}
		}
		
		
		
	}

	@Override
	public void updateStarred(int noteNo, String noteStarred) {
		
		NoteRead noteRead = new NoteRead();
		noteRead.setNoteRead_no(noteNo);
		noteRead.setNoteRead_starred(noteStarred);
		noteDao.updateNoteStarred(noteRead);
		
	}

	@Override
	public void checkTrash(String checkedIdsString) {
		
		String[] numberStrings = checkedIdsString.split(", ");
		int[] numberArray = new int[numberStrings.length];
		for(int i = 0; i < numberStrings.length; i++) {
			numberArray[i] = Integer.parseInt(numberStrings[i].trim());
		}
		for(int noteReadNo : numberArray) {
			noteDao.trashNote(noteReadNo);
		}
	}
	
	//발신 쪽지 삭제
	@Override
	public void checkTrashSent(String checkedIdsString) {
		
		String[] numberStrings = checkedIdsString.split(", ");
		int[] numberArray = new int[numberStrings.length];
		for(int i = 0; i < numberStrings.length; i++) {
			numberArray[i] = Integer.parseInt(numberStrings[i].trim());
		}
		for(int noteNo : numberArray) {
			noteDao.trashNoteSent(noteNo);
		}
	}
	
	@Override
	public void deleteTrash(String checkedIdsString) {
		
		String[] numberStrings = checkedIdsString.split(", ");
		int[] numberArray = new int[numberStrings.length];
		for(int i = 0; i < numberStrings.length; i++) {
			numberArray[i] = Integer.parseInt(numberStrings[i].trim());
		}
		for(int noteReadNo : numberArray) {
			noteDao.deleteTrashNote(noteReadNo);
		}
	}

	@Override
	public void recoverTrashNote(String checkedIdsString) {
		
		String[] numberStrings = checkedIdsString.split(", ");
		int[] numberArray = new int[numberStrings.length];
		for(int i = 0; i < numberStrings.length; i++) {
			numberArray[i] = Integer.parseInt(numberStrings[i].trim());
		}
		for(int noteReadNo : numberArray) {
			
			NoteRead noteRead = new NoteRead();
			noteRead.setNoteRead_no(noteReadNo);
			noteRead.setNoteRead_deletedAt("");
			
			noteDao.recoveryNotebyNoteRead(noteRead);
		}

		
	}

	@Override
	public NoteRead getNoteRead(int noteReadNo) {
		NoteRead noteRead = noteDao.selectNoteReadByNoteReadNo(noteReadNo);
		return noteRead;
	}

	@Override
	public List<EmpNote> getEmpList() {
		List<EmpNote> empList = employeeDao.selectEmployeeForNote();
		List<EmpNote> empListPM = employeeDao.selectPM();
		empList.addAll(empListPM);
		
		
		
		
		
		return empList;
	}

	@Override
	public List<String> getTeamList() {
		List<String> team = employeeDao.selectTeamname(0);
		return team;
	}

	@Override
	public List<MediaDto> getMediaList(int noteNo) {
		MediaDto media = new MediaDto();
		media.setMedia_from("NOTE");
		media.setFrom_no(noteNo);
		
		List<MediaDto> mediaList = mediaDao.selectMedia(media);
		
		return mediaList;

	}

	@Override
	public int countByUnreadNoteNo(int empNo) {
		return noteDao.countByUnreadInbox(empNo);
	}

	//수신자 목록 불러오기
	@Override
	public List<NoteResponse> getNoteReceiver(int noteNo, int empNo) {
		List<NoteRead> noteReadList = noteDao.selectNoteReadByNoteNo(noteNo);
		List<NoteResponse> noteResponseList = new ArrayList<>();
		
		for(NoteRead noteRead : noteReadList) {
			NoteResponse noteResponse = new NoteResponse();
			if("비밀참조".equals(noteRead.getNoteRead_type())) {
				
				
				if(noteRead.getEmp_no_receiver() == empNo) {
					EmployeeInfo empInfo = employeeDao.selectInfoByEmpNo(empNo);
					noteResponse.setEmp_name(empInfo.getEmpinfo_name());
					noteResponse.setEmp_email(empInfo.getEmpinfo_email());
					noteResponse.setEmp_no_receiver(noteRead.getEmp_no_receiver());
					noteResponse.setNoteRead_type(noteRead.getNoteRead_type());
					noteResponseList.add(noteResponse);
				}
				
			} else {
			
				int emp_No = noteRead.getEmp_no_receiver();
				EmployeeInfo empInfo = employeeDao.selectInfoByEmpNo(emp_No);
				noteResponse.setEmp_name(empInfo.getEmpinfo_name());
				noteResponse.setEmp_email(empInfo.getEmpinfo_email());
				noteResponse.setEmp_no_receiver(noteRead.getEmp_no_receiver());
				noteResponse.setNoteRead_type(noteRead.getNoteRead_type());
				noteResponseList.add(noteResponse);
			}
			
		}
		
		
		return noteResponseList;
	}
	
	//수신자 목록 불러오기 - 발신/임시저장
	@Override
	public List<NoteResponse> getNoteReceiverSent(int noteNo, int empNo) {
		List<NoteRead> noteReadList = noteDao.selectNoteReadByNoteNo(noteNo);
		List<NoteResponse> noteResponseList = new ArrayList<>();
		
		for(NoteRead noteRead : noteReadList) {
			NoteResponse noteResponse = new NoteResponse();
				
				int emp_No = noteRead.getEmp_no_receiver();
				EmployeeInfo empInfo = employeeDao.selectInfoByEmpNo(emp_No);
				noteResponse.setEmp_name(empInfo.getEmpinfo_name());
				noteResponse.setEmp_email(empInfo.getEmpinfo_email());
				noteResponse.setEmp_no_receiver(noteRead.getEmp_no_receiver());
				noteResponse.setNoteRead_type(noteRead.getNoteRead_type());
				noteResponseList.add(noteResponse);
			
		}
		
		
		return noteResponseList;
	}
	
	//발송취소 인원 불러오기
	@Override
	public List<NoteResponse> getNoteSentList(int noteNo) {
		List<NoteRead> noteReadList = noteDao.selectNoteReadByNoteNo(noteNo);
		List<NoteResponse> noteResponseList = new ArrayList<>();
		
		for(NoteRead noteRead : noteReadList) {
			NoteResponse noteResponse = new NoteResponse();
			int emp_No = noteRead.getEmp_no_receiver();
			EmployeeInfo empInfo = employeeDao.selectInfoByEmpNo(emp_No);
			noteResponse.setEmp_name(empInfo.getEmpinfo_name());
			noteResponse.setEmp_email(empInfo.getEmpinfo_email());
			noteResponse.setEmp_no_receiver(noteRead.getEmp_no_receiver());
			noteResponse.setNoteRead_type(noteRead.getNoteRead_type());
			noteResponse.setNoteRead_read(noteRead.getNoteRead_read());
			noteResponse.setNoteRead_no(noteRead.getNoteRead_no());
			noteResponse.setNoteRead_isCanceled(noteRead.isNoteRead_isCanceled());
			noteResponseList.add(noteResponse);
		}
		
		return noteResponseList;
	}

	@Override
	public void addDraft(NoteRequest request) throws Exception {

		Note note = new Note();
		note.setNote_sender(request.getNote_sender());
		if(request.getNote_title() != null) {
			note.setNote_title(request.getNote_title());
		} else {
			note.setNote_title("(제목 없음)");
		}

			
		if(request.getNote_content() != null) {
			note.setNote_content(request.getNote_content());
		} else {
			note.setNote_content("(내용 없음)");
		}
		note.setNote_draft("draft");
		note.setNote_restime("");
		note.setNote_label("");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
        String formattedDate = sdf.format(new Date());

		
		note.setNote_createdAt(formattedDate);
		
		
		noteDao.insertNote(note);
		
		int noteNo = note.getNote_no();
		log.info(noteNo+"노트넘버 삽입됐낭");
		
		//참조 수신자 분할/추가
		List<String> receiverCC = request.getNote_receiver_cc();
		if(request.getNote_receiver_cc() == null) {

		} else {
			for(String receiverCCNo : receiverCC) {
				String[] parts = receiverCCNo.split(",");
				for(String noCC : parts) {
					NoteRead noteRead = new NoteRead();
					int receiverNoCC = Integer.parseInt(noCC);
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
		if(request.getNote_receiver() == null) {

		} else {
			for(String receiver : receiverList) {
				String[] parts = receiver.split(",");
				for(String no : parts) {
					NoteRead noteRead = new NoteRead();
					int receiverNo = Integer.parseInt(no);
					noteRead.setEmp_no_receiver(receiverNo);
					noteRead.setNoteRead_type("수신");
					noteRead.setNote_no(noteNo);
					log.info(noteRead.toString()+"뭐가안들어가는지 좀 보자 수신자니");
					noteDao.insertNoteRead(noteRead);
				
				}
			}
		}
		//비밀참조 분할/추가
		List<String> receiverBCC = request.getNote_receiver_bcc();
		
		if(request.getNote_receiver_bcc() == null) {

		} else {
			for(String receiverBccName : receiverBCC) {
				String[] parts = receiverBccName.split(",");
				for(String nobcc : parts) {
					NoteRead noteRead = new NoteRead();
					int receiverBccNo = Integer.parseInt(nobcc);
					noteRead.setEmp_no_receiver(receiverBccNo);
					noteRead.setNoteRead_type("비밀참조");
					noteRead.setNote_no(noteNo);
					log.info(noteRead.toString()+"뭐가안들어가는지 좀 보자 bcc니");
					noteDao.insertNoteRead(noteRead);
					
					
				}
			}
		}
		
		MultipartFile[] uploadFiles = request.getFiles();
		if(uploadFiles != null && uploadFiles.length > 0) {
			for(MultipartFile noteFile : uploadFiles) {
				if(!noteFile.isEmpty()) {
					MediaDto noteMedia = new MediaDto();
					noteMedia.setMedia_data(noteFile.getBytes());
					noteMedia.setMedia_name(noteFile.getOriginalFilename());
					noteMedia.setMedia_type(noteFile.getContentType());
					noteMedia.setMedia_from("NOTE");
					noteMedia.setFrom_no(noteNo);
					mediaDao.insertMedia(noteMedia);
				}
			}
		}
		
	}

	//발송 취소
	@Override
	public String noteSentCancel(String checkedIdsString) {
		String[] numberStrings = checkedIdsString.split(", ");
		String noCancel = "발송 취소";
		int[] numberArray = new int[numberStrings.length];
		for(int i = 0; i < numberStrings.length; i++) {
			numberArray[i] = Integer.parseInt(numberStrings[i].trim());
		}
		
		
		for(int noteReadNo : numberArray) {
			NoteRead noteReadEx = noteDao.selectNoteReadByNoteReadNo(noteReadNo);
			
			if(noteReadEx.isNoteRead_isCanceled()) {
				noCancel = "발송취소할 목록이 없습니다.";
			} else {
				noteDao.sentCancelNote(noteReadNo);
				noCancel = "발송취소 완료";
				
				//예약 전송 취소
				NoteRead noteReadAll = noteDao.selectNoteReadByNoteReadNo(noteReadNo);
				int noteNo = noteReadAll.getNote_no();
				Note note = noteDao.selectNoteByNoteNo(noteNo);
				if(note.getNote_restime() != null) {
					List<NoteRead> noteReadList = noteDao.selectNoteReadByNoteNo(noteNo);
					boolean hasNoReferenceCanceled = noteReadList.stream()
						    .noneMatch(noteRead -> !noteRead.isNoteRead_isCanceled());
					
					log.info(hasNoReferenceCanceled+"참이냐 거짓이냐");
					if(hasNoReferenceCanceled) {
						Note newNote = new Note();
						newNote.setNote_no(noteNo);
						
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
						String currentDate = sdf.format(new Date());
						
						newNote.setNote_restime(currentDate+" 예악 발송 취소됨");
						newNote.setNote_createdAt("");
						noteDao.updateNoteRestime(newNote);
						
					}
				}
				
			}
		}
		
		
		
		return noCancel;
		
	}
	
	//임시저장 메세지 전송
	@Override
	public void sendDraftNote(int noteNo) {
		Note note = new Note();
		note.setNote_no(noteNo);
		note.setNote_draft("");
		noteDao.updateDraftNote(note);
		
	}

	@Override
	public List<MediaDto> selectMediaFiles(String fileValues) {
		String[] numberStrings = fileValues.split(", ");
		int[] numberArray = new int[numberStrings.length];
		for(int i = 0; i < numberStrings.length; i++) {
			numberArray[i] = Integer.parseInt(numberStrings[i].trim());
		}
		
		List<MediaDto> mediaList = new ArrayList<>();
		for(int mediaNo : numberArray) {
			
			
			MediaDto media = new MediaDto();
			media = mediaDao.selectMediaByMno(mediaNo);
			
			mediaList.add(media);
		}
		
		
		
		return mediaList; 
		
	}

	@Override
	public List<NoteAll> getNoteSearchListByRno(Map<String, Object> map) {
		List<NoteAll> noteAllList = noteDao.searchNoteByEmpNo(map);
		for(NoteAll noteAll : noteAllList) {
			int senderNo = noteAll.getNote_sender();
			EmployeeInfo sender = employeeDao.selectInfoByEmpNo(senderNo);
			noteAll.setNote_sender_name(sender.getEmpinfo_name());
			int noteNo = noteAll.getNote_no();
			MediaDto media = new MediaDto();
			media.setFrom_no(noteNo);
			media.setMedia_from("NOTE");
			List<MediaDto> mediaList = mediaDao.selectMedia(media);
			if(mediaList.isEmpty()) {
				noteAll.setMedia_isEmpty(true);
			}else {
				noteAll.setMedia_isEmpty(false);
			}
			
			
		}
		return noteAllList;
	}

	@Override
	public List<NoteAll> getNoteSentSearchListByRno(Map<String, Object> map) {
		List<NoteAll> noteAllList = noteDao.searchSentNoteByEmpNo(map);
		for(NoteAll noteAll : noteAllList) {
			int senderNo = noteAll.getNote_sender();
			EmployeeInfo sender = employeeDao.selectInfoByEmpNo(senderNo);
			noteAll.setNote_sender_name(sender.getEmpinfo_name());
			int noteNo = noteAll.getNote_no();
			MediaDto media = new MediaDto();
			media.setFrom_no(noteNo);
			media.setMedia_from("NOTE");
			List<MediaDto> mediaList = mediaDao.selectMedia(media);
			if(mediaList.isEmpty()) {
				noteAll.setMedia_isEmpty(true);
			}else {
				noteAll.setMedia_isEmpty(false);
			}
		}
		return noteAllList;
	}

	@Override
	public List<NoteAll> getNoteStarredSearchListByRno(Map<String, Object> map) {
		List<NoteAll> noteAllList = noteDao.searchStarredNoteByEmpNo(map);
		for(NoteAll noteAll : noteAllList) {
			int senderNo = noteAll.getNote_sender();
			EmployeeInfo sender = employeeDao.selectInfoByEmpNo(senderNo);
			noteAll.setNote_sender_name(sender.getEmpinfo_name());
			int noteNo = noteAll.getNote_no();
			MediaDto media = new MediaDto();
			media.setFrom_no(noteNo);
			media.setMedia_from("NOTE");
			List<MediaDto> mediaList = mediaDao.selectMedia(media);
			if(mediaList.isEmpty()) {
				noteAll.setMedia_isEmpty(true);
			}else {
				noteAll.setMedia_isEmpty(false);
			}
		}
		return noteAllList;
	}

	@Override
	public List<NoteAll> getNoteTrashSearchListByRno(Map<String, Object> map) {
		List<NoteAll> noteAllList = noteDao.searchTrashNoteByEmpNo(map);
		for(NoteAll noteAll : noteAllList) {
			int senderNo = noteAll.getNote_sender();
			EmployeeInfo sender = employeeDao.selectInfoByEmpNo(senderNo);
			noteAll.setNote_sender_name(sender.getEmpinfo_name());
			int noteNo = noteAll.getNote_no();
			MediaDto media = new MediaDto();
			media.setFrom_no(noteNo);
			media.setMedia_from("NOTE");
			List<MediaDto> mediaList = mediaDao.selectMedia(media);
			if(mediaList.isEmpty()) {
				noteAll.setMedia_isEmpty(true);
			}else {
				noteAll.setMedia_isEmpty(false);
			}
		}
		return noteAllList;
	}

	@Override
	public List<NoteAll> getNoteDraftSearchListByRno(Map<String, Object> map) {
		List<NoteAll> noteAllList = noteDao.searchDraftNoteByEmpNo(map);
		for(NoteAll noteAll : noteAllList) {
			int senderNo = noteAll.getNote_sender();
			EmployeeInfo sender = employeeDao.selectInfoByEmpNo(senderNo);
			noteAll.setNote_sender_name(sender.getEmpinfo_name());
			int noteNo = noteAll.getNote_no();
			MediaDto media = new MediaDto();
			media.setFrom_no(noteNo);
			media.setMedia_from("NOTE");
			List<MediaDto> mediaList = mediaDao.selectMedia(media);
			if(mediaList.isEmpty()) {
				noteAll.setMedia_isEmpty(true);
			}else {
				noteAll.setMedia_isEmpty(false);
			}
		}
		return noteAllList;
	}

	@Override
	public int countBySearchNoteNo(Map<String, Object> map) {
		log.info(map.toString()+"맵정보좀줘바");
		return noteDao.countBySearchEmpno(map);
	}

	@Override
	public int countBySearchNoteSenderNo(Map<String, Object> map) {
		return noteDao.countBySearchSentEmpno(map);
	}

	@Override
	public int countBySearchNoteStarredNo(Map<String, Object> map) {
		return noteDao.countBySearchStarredEmpno(map);
	}

	@Override
	public int countBySearchNoteTrashNo(Map<String, Object> map) {
		return noteDao.countBySearchTrashEmpno(map);
	}

	@Override
	public int countBySearchNoteDraftNo(Map<String, Object> map) {
		return noteDao.countBySearchDraftEmpno(map);
	}
}
