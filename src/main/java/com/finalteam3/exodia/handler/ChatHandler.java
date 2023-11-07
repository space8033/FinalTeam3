package com.finalteam3.exodia.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import com.finalteam3.exodia.chat.dao.ChatDao;
import com.finalteam3.exodia.chat.dto.request.ChatMessage;
import com.finalteam3.exodia.employee.dao.EmployeeDao;
import com.finalteam3.exodia.employee.dto.request.JoinRequest;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.note.dto.EmployeeInfo;

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
			
				log.info(roomList.get(chatMessage.getChatRoom_no()).toString()+"상대방 접속 까지 완료");
				
				
			}
			
			//채팅방이 존재 할 때
			else if(roomList.get(chatMessage.getChatRoom_no()) != null && !chatMessage.getMessage_content().equals("ENTER-CHAT")) {
				
				
				TextMessage textMessage = new TextMessage(chatMessage.getEmpInfo_no()+","+chatMessage.getMessage_content());
				
				
				int sessionCount = 0;
				
				log.info(roomList.get(chatMessage.getChatRoom_no()).toString()+"채팅방 얼마나 있나봅시다..ㅜ");
				for(WebSocketSession sess : roomList.get(chatMessage.getChatRoom_no())) {
					
					log.info("이걸 보내라고!");
					sess.sendMessage(textMessage);
					sessionCount++;
				}
				
				chatDao.insertChatMessage(chatMessage);
				log.info("채팅방 내용");
				
				
			}
			
			//채팅방아니고 알람일 때
			
			log.info("응 아ㅣ무것도 아니야 ㅅㄱㄴ");
		
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
		if(sessionList.get(session) != null) {
			roomList.get(sessionList.get(session)).remove(session);
			sessionList.remove(session);
		}

	}
}