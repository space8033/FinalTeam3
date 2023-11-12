package com.finalteam3.exodia.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.finalteam3.exodia.alarm.dao.AlarmDao;
import com.finalteam3.exodia.alarm.dto.request.AlarmRequest;
import com.finalteam3.exodia.chat.dao.ChatDao;
import com.finalteam3.exodia.chat.dto.request.ChatMessage;
import com.finalteam3.exodia.employee.dao.EmployeeDao;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.note.dao.NoteDao;
import com.finalteam3.exodia.note.dto.EmployeeInfo;
import com.finalteam3.exodia.note.dto.request.Note;
import com.finalteam3.exodia.note.dto.request.NoteRead;

import lombok.extern.slf4j.Slf4j;

@Component
@RequestMapping("/header")
@Slf4j
public class WebSocketHandler extends TextWebSocketHandler{

	private final ObjectMapper objectMapper = new ObjectMapper();
	
	
	@Resource
	private ChatDao chatDao;
	
	@Resource
	private AlarmDao alarmDao;
	
	
	@Resource
	private NoteDao noteDao;
	
	@Resource
	private EmployeeDao empDao;
	
	
	
	//로그인한 인원 전체
	private static List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	//1:1로 할 경우
	private Map<String, WebSocketSession> userSessionMap = new HashMap<String, WebSocketSession>();
	
	private Map<String, Integer> alarmCount = new HashMap<String, Integer>();
	
    
    private static int i;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	
		
		String user_id = session.getPrincipal().getName();
		//log.info(user_id+"아읻이뭐니?");
		sessions.add(session);
		userSessionMap.put(user_id, session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		
			// Thread.sleep(600);
			//알람
			String msg = message.getPayload();
			//log.info(msg+"메세지 받아오니?");
			
			
			for(WebSocketSession single : sessions) {
				String memId = single.getPrincipal().getName();
				int uckCount = alarmDao.selectAlarmUchkCount(memId);
				if(alarmCount.get(memId) == null) {
					alarmCount.put(memId, uckCount);
					//log.info(alarmCount.toString()+"잘드러갔닝?");
				}
				
				//log.info(alarmCount.get(memId).toString()+"내아이디 안읽은 숫자는?");
				//log.info(uckCount+"알람 안읽은 숫자는?");
				
				if(single.getId().equals(session.getId()) && uckCount != 0) {
					
					ObjectMapper objectMapper = new ObjectMapper(); // Jackson 라이브러리 사용
					// 메시지 목록을 배열에 담습니다.
					Message messageContent= new Message();
					
					messageContent.setMsg(memId+"님 "+uckCount+"개의 알람이 있습니다.");
					String jsonMessages = objectMapper.writeValueAsString(messageContent);
					
					TextMessage textMessage = new TextMessage(jsonMessages);
					
					//session.sendMessage(textMessage);
					
					LoginResponse emp = empDao.selectEmpByEmpId(memId);
					List<AlarmRequest> alarmList = alarmDao.selectUckAlarmList(emp.getEmpInfo_no());
					for(AlarmRequest alarm : alarmList) {
						if(alarm.getAlarm_type().equals("채팅") && alarm.getAlarm_toast() == null) {
							if(uckCount != alarmCount.get(memId)){
								alarmCount.put(memId, uckCount);
							}
							int chatMsgNo = alarm.getAlarm_typeNo();
							ChatMessage chatMsg = chatDao.selectLastMsg(chatMsgNo);
							int senderNo = chatMsg.getEmpInfo_no();
							String chatContent = chatMsg.getMessage_content();
							EmployeeInfo empInfo = empDao.selectEmpInfoByEmpInfoNo(senderNo);
							String senderName = empInfo.getEmpinfo_name();
							
							Message messageContent2= new Message();
							messageContent2.setCmd("채팅");
							messageContent2.setTitle(chatContent);
							messageContent2.setSender(senderName);
							messageContent2.setCount(uckCount);
							
							String jsonMessages2 = objectMapper.writeValueAsString(messageContent2);
							TextMessage textMessage2 = new TextMessage(jsonMessages2);
							//log.info(textMessage2+"머라고보내니?");
							alarmDao.alarmToastUpdate(alarm.getAlarm_no());
							session.sendMessage(textMessage2);
						
						} else if(alarm.getAlarm_type().equals("쪽지") && alarm.getAlarm_toast() == null) {
							if(uckCount != alarmCount.get(memId)){
								alarmCount.put(memId, uckCount);
							}
							int noteReadNo = alarm.getAlarm_typeNo();
							NoteRead noteRead = noteDao.selectNoteReadByNoteReadNo(noteReadNo);
							int noteNo = noteRead.getNote_no();
							Note note = noteDao.selectNoteByNoteNo(noteNo);
							
							int senderNo = note.getNote_sender();
							String noteContent;
							
							if(note.getNote_label().equals("긴급 필독")) {
								noteContent = "[긴급 필독] " + note.getNote_title();
							} else {
								noteContent = note.getNote_title();
							}
							
							EmployeeInfo empInfo = empDao.selectEmpInfoByEmpInfoNo(senderNo);
							String senderName = empInfo.getEmpinfo_name();
							
							Message messageContent2= new Message();
							messageContent2.setCmd("쪽지");
							messageContent2.setTitle(noteContent);
							messageContent2.setSender(senderName);
							messageContent2.setCount(uckCount);
							
							String jsonMessages2 = objectMapper.writeValueAsString(messageContent2);
							TextMessage textMessage2 = new TextMessage(jsonMessages2);
							//log.info(textMessage2+"머라고보내니?");
							alarmDao.alarmToastUpdate(alarm.getAlarm_no());
							session.sendMessage(textMessage2);
							
							
						} else if(alarm.getAlarm_type().equals("프로그램") && alarm.getAlarm_toast() == null) {
							
							if(uckCount != alarmCount.get(memId)){
								alarmCount.put(memId, uckCount);
							}
							String programContent = alarm.getAlarm_content();
							String senderName = emp.getEmpInfo_name();
							Message messageContent2= new Message();
							messageContent2.setCmd("프로그램");
							messageContent2.setTitle(programContent);
							messageContent2.setCount(uckCount);
							messageContent2.setSender(senderName);
							
							String jsonMessages2 = objectMapper.writeValueAsString(messageContent2);
							TextMessage textMessage2 = new TextMessage(jsonMessages2);
							log.info(textMessage2+"머라고보내니?");
							alarmDao.alarmToastUpdate(alarm.getAlarm_no());
							session.sendMessage(textMessage2);
							
						} else if(uckCount != alarmCount.get(memId)){
							// 메시지 목록을 배열에 담습니다.
							
							//log.info(alarmCount.get(memId).toString()+"내아이디 안읽은 숫자는?");
							//log.info(uckCount+"알람 안읽은 숫자는?");
							Message messageContent2= new Message();
							
							messageContent2.setCount(uckCount);
							String jsonMessages2 = objectMapper.writeValueAsString(messageContent2);
							
							TextMessage textMessage2 = new TextMessage(jsonMessages2);
							
							session.sendMessage(textMessage2);
							
						}
					
					}
					
					
				}
			}
			//messageContent.setMsg(memId+"님 새 알림이 있습니다.");
					
			/*
			//채팅 알람
			ChatMessage chatMessage = null;
			
			try {
				chatMessage = objectMapper.readValue(msg, ChatMessage.class);
			} catch(JsonParseException | JsonMappingException e) {
				
			}
			
			if(chatMessage != null) {
				
				int empInfoNo = chatDao.selectEmpInfoNo(chatMessage);
				
				EmployeeInfo sender = empDao.selectEmpInfoByEmpInfoNo(chatMessage.getEmpInfo_no());
				EmployeeInfo empInfo = empDao.selectEmpInfoByEmpInfoNo(empInfoNo);
				int empNo = empInfo.getEmp_no();
				JoinRequest emp = empDao.selectEmpByEmpNo(empNo);
				String empId = emp.getEmp_id();
				WebSocketSession receiverSession = userSessionMap.get(empId);
				int uckCount = alarmDao.selectAlarmUchkCount(empId);
				
				
				// 메시지 목록을 배열에 담습니다.
				Message messageContent= new Message();
				messageContent.setCount(uckCount);
				messageContent.setMsg(empInfo.getEmpinfo_name()+"님 "+sender.getEmpinfo_name()
						+ "님으로부터 1:1채팅이 왔습니다."+chatMessage.getMessage_content());
				String jsonMessages = objectMapper.writeValueAsString(messageContent);
				
				TextMessage textMessage = new TextMessage(jsonMessages);
				log.info(textMessage+"머라고보내니?");
				receiverSession.sendMessage(textMessage);
				
				
			} else {
				String[] strs = msg.split(",");
				if(strs != null && strs.length > 3) {
					String cmd = strs[0];
					String title = strs[1];
					String sender = strs[2];
					List<String> receivers = new ArrayList<>();
					List<String> receiverIds = new ArrayList<>();
					log.info(cmd+"cmd 받아오니?");
					log.info(title+"title 받아오니?");
					log.info(sender+"sender 받아오니?");
					
					LoginResponse empName = empDao.selectEmpByEmpId(sender);
					String senderName = empName.getEmpInfo_name();
					
			        for (int i = 3; i < strs.length; i++) {
			            receivers.add(strs[i]);
			        }
			        log.info(receivers+"receiver 받아오니?");
			        
			        for(String receiver : receivers) {
			        	int receiverNo = Integer.parseInt(receiver);
			        	EmployeeInfo empInfo = empDao.selectInfoByEmpNo(receiverNo);
			        	JoinRequest emp = empDao.selectEmpByEmpNo(receiverNo);
			        	String receiverId = emp.getEmp_id();
			        	//String receiverName = empInfo.getEmpinfo_name();
			        	
			        	receiverIds.add(receiverId);
			        }
					
					WebSocketSession senderSession = userSessionMap.get(sender);
					
					for(String receiverId : receiverIds) {
						WebSocketSession receiverSession = userSessionMap.get(receiverId);
						
						log.info(receiverSession+"receiver session은 들어오니?");
						if("note".equals(cmd) && receiverSession!=null) {
							log.info(receiverSession+"여기는들어오니?");
						
							ObjectMapper objectMapper = new ObjectMapper(); // Jackson 라이브러리 사용
	
							// 메시지 목록을 배열에 담습니다.
							Message messageContent= new Message();
							messageContent.setCmd("쪽지");
							messageContent.setTitle(title);
							messageContent.setSender(senderName);
							
							String jsonMessages = objectMapper.writeValueAsString(messageContent);
							TextMessage textMessage = new TextMessage(jsonMessages);
							log.info(textMessage+"머라고보내니?");
							receiverSession.sendMessage(textMessage);
						}
					}
				} else {
					
					//원래방식
				}
			}*/
		//채팅
		//log.info(session.getId() + ": " + message);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//채팅
		i--;
		//log.info("소켓 연결 끊김 현재 접속자수:" + i);
		  // sessionList에 session이 있다면
          // 해당 session의 방 번호를 가져와서, 방을 찾고, 그 방의 ArrayList<session>에서 해당 session을 지운다.
		sessions.remove(session);
		String user_id = session.getPrincipal().getName();
		userSessionMap.remove(user_id, session);

	}
}