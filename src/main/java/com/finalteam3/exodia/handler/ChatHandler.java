package com.finalteam3.exodia.handler;

import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

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
import com.finalteam3.exodia.chat.dto.request.ChatRoom;
import com.finalteam3.exodia.employee.dao.EmployeeDao;

import lombok.extern.slf4j.Slf4j;

@Component
@RequestMapping("/chat")
@Slf4j
public class ChatHandler extends TextWebSocketHandler{

	private final ObjectMapper objectMapper = new ObjectMapper();
	
	@Resource
	private ChatDao chatDao;
	
	@Resource
	private EmployeeDao empDao;
	
	@Resource
	private AlarmDao alarmDao;
	
	
	//채팅방 목록 <방 번호, ArrayList<session>
	private Map<Integer, ArrayList<WebSocketSession>> roomList = new ConcurrentHashMap<Integer, ArrayList<WebSocketSession>>();
	 
	// session, 방 번호가 들어간다.
    private Map<WebSocketSession, Integer> sessionList = new ConcurrentHashMap<WebSocketSession, Integer>();
    
    private static int i;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		i++;
		log.info(session.getId()+"연결 성공 => 총 접속 인원:" + i +"명");
		
		//채팅
		//log.info("#ChattingHandler, afterConnectionEstablished");
		
		//log.info(session.getId()+"님이 입장하셨습니다.");
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
			//알람
			
			String msg = message.getPayload();
			
			//채팅
			ChatMessage chatMessage = objectMapper.readValue(msg, ChatMessage.class);
			
			
			//채팅 세션 목록에 채팅방이 존재하지 않고, 처음 들어 왔을 때
			if(roomList.get(chatMessage.getChatRoom_no()) == null && chatMessage.getMessage_content().equals("ENTER-CHAT")) {
				//채팅방에 들어갈 session들
				ArrayList<WebSocketSession> sessionTwo = new ArrayList<>();
				// session 추가
				sessionTwo.add(session);
				//sessionList추가
				sessionList.put(session, chatMessage.getChatRoom_no());
				//roomList에 추가
				roomList.put(chatMessage.getChatRoom_no(), sessionTwo);
				log.info(roomList.get(chatMessage.getChatRoom_no()).toString()+"처음 채팅방에 넣은 애");
				int numberOfSessions = sessionList.size();
				System.out.println("현재 세션 개수: " + numberOfSessions);
				
				
				//확인
				log.info("채팅방 생성");
			
			
			} 
			
			//상대방이 접속했을 때
			else if(roomList.get(chatMessage.getChatRoom_no()) != null && chatMessage.getMessage_content().equals("ENTER-CHAT")) {
				
				// 룸리스트에서 해당 방 번호를 가진 방이 있는지 확인.
				roomList.get(chatMessage.getChatRoom_no()).add(session);
				// session 추가
			
				//sessionList추가
				sessionList.put(session, chatMessage.getChatRoom_no());
				
				int numberOfSessions = sessionList.size();
				System.out.println("읽어야돼 현재 세션 개수: " + numberOfSessions);
				chatDao.updateAllUnCheckMsg(chatMessage.getChatRoom_no());
			
				TextMessage textMessage = new TextMessage("읽음");
				for(WebSocketSession sess : roomList.get(chatMessage.getChatRoom_no())) {
					sess.sendMessage(textMessage);
				}
				log.info(roomList.get(chatMessage.getChatRoom_no()).toString()+"상대방 접속 까지 완료");
				
				
			}
			
			//채팅방이 존재 할 때
			else if(roomList.get(chatMessage.getChatRoom_no()) != null && !chatMessage.getMessage_content().equals("ENTER-CHAT")) {
				
				
				
				
				int numberOfSessions = roomList.get(chatMessage.getChatRoom_no()).size();
				System.out.println("현재 세션 개수: " + numberOfSessions);
				chatDao.insertChatMessage(chatMessage);
				
				int chatMsgNo = chatMessage.getChatMessage_no();
				
				ChatRoom chatRoom = new ChatRoom();
				chatRoom.setChatRoom_lastMsgId(chatMsgNo);
				chatRoom.setChatRoom_no(chatMessage.getChatRoom_no());
				chatDao.updateChatRoom(chatRoom);
				
				
				log.info(roomList.get(chatMessage.getChatRoom_no()).toString()+"채팅방 얼마나 있나봅시다..ㅜ");
				
				if(numberOfSessions == 1) {
					int receiverNo = chatDao.selectEmpInfoNo(chatMessage);
					AlarmRequest alarm = new AlarmRequest();
					alarm.setAlarm_isRead(false);
					alarm.setAlarm_type("채팅");
					alarm.setEmpinfo_no(receiverNo);
					alarm.setAlarm_typeNo(chatMessage.getChatMessage_no());
					
					for(WebSocketSession sess : roomList.get(chatMessage.getChatRoom_no())) {
						log.info("읽으면 안돼!");
						TextMessage textMessage = new TextMessage("안읽음"+","+chatMessage.getEmpInfo_no()+","+chatMessage.getMessage_content());
						sess.sendMessage(textMessage);
					}
					
					alarmDao.insertAlarm(alarm);
				} else {
					//알람 세션에 두명있을때랑 한명있을떄 나누기
					for(WebSocketSession sess : roomList.get(chatMessage.getChatRoom_no())) {
						log.info("읽어야 돼!");
						
						chatDao.updateAllUnCheckMsg(chatMessage.getChatRoom_no());
						
						TextMessage textMessage = new TextMessage("읽음"+","+chatMessage.getEmpInfo_no()+","+chatMessage.getMessage_content());
						sess.sendMessage(textMessage);
					}
					
				}
				
				
				log.info("채팅방 내용");
			}
			//채팅방아니고 알람일 때
			
		//채팅
		//log.info(session.getId() + ": " + message);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		//채팅
		i--;
		log.info("소켓 연결 끊김 현재 접속자수:" + i);
		  // sessionList에 session이 있다면
          // 해당 session의 방 번호를 가져와서, 방을 찾고, 그 방의 ArrayList<session>에서 해당 session을 지운다.
		/*if(sessionList.get(session) != null) {
			roomList.get(sessionList.get(session)).remove(session);
			sessionList.remove(session);
			log.info(roomList.toString()+"채팅방 얼마나 있나봅시다..ㅜ");
			log.info(sessionList.toString()+"채팅방 얼마나 있나봅시다..ㅜ");
		}
		*/
		
		
		if (sessionList.containsKey(session)) {
	        int roomNumber = sessionList.get(session);

	        // 해당 방 번호에 대한 세션 목록을 가져옴
	        ArrayList<WebSocketSession> roomSessions = roomList.get(roomNumber);

	        // 해당 세션을 방에서 제거
	        roomList.get(sessionList.get(session)).remove(session);
	        if (roomSessions != null) {
	            roomSessions.remove(session);

	            // 세션이 모두 나갔다면 방도 삭제
	            if (roomSessions.isEmpty()) {
	                roomList.remove(roomNumber);
	                log.info("방 번호 " + roomNumber + "가 모두 나가서 방이 삭제되었습니다.");
	            }
	        }
	        sessionList.remove(session);

	        log.info(roomList.toString() + "채팅방 얼마나 있나봅시다..ㅜ");
	        log.info(sessionList.toString() + "채팅방 얼마나 있나봅시다..ㅜ");
	    }

		
		
		
		
		
		
		
		
		

	}
}