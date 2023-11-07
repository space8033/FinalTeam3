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
@RequestMapping("/header")
@Slf4j
public class WebSocketHandler extends TextWebSocketHandler{

	private final ObjectMapper objectMapper = new ObjectMapper();
	
	
	@Resource
	private ChatDao chatDao;
	
	@Resource
	private AlarmDao alarmDao;
	
	@Resource
	private EmployeeDao empDao;
	
	//로그인한 인원 전체
	private static List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	//1:1로 할 경우
	private Map<String, WebSocketSession> userSessionMap = new HashMap<String, WebSocketSession>();
	
	
    private static int i;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//알람
		sessions.add(session);
		String userId = session.getPrincipal().getName();
		
		userSessionMap.put(userId, session);
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
			log.info(msg+"메세지 받아오니?");
			
			//채팅
			ChatMessage chatMessage = objectMapper.readValue(msg, ChatMessage.class);
				
				for(WebSocketSession single : sessions) {
					String memId = single.getPrincipal().getName();
		     
		
					//log.info(message+"나 메세지" + memId+"나 아이디"+single+"싱글이야?"+session.getId()+"세션에서 얻은 아이디"+single.getId()+"싱글에서얻은아이디");
					
					int uckCount = alarmDao.selectAlarmUchkCount(memId);
					
					if(single.getId().equals(session.getId()) && uckCount != 0) {
						
						ObjectMapper objectMapper = new ObjectMapper(); // Jackson 라이브러리 사용
		
						// 메시지 목록을 배열에 담습니다.
						Message messageContent= new Message();
						messageContent.setCount(uckCount);
						messageContent.setMsg("");
						String jsonMessages = objectMapper.writeValueAsString(messageContent);
						TextMessage textMessage = new TextMessage(jsonMessages);
						session.sendMessage(textMessage);
						
					}
				//messageContent.setMsg(memId+"님 새 알림이 있습니다.");
				}
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		//채팅
		i--;
		log.info("소켓 연결 끊김 현재 접속자수:" + i);
		  // sessionList에 session이 있다면
          // 해당 session의 방 번호를 가져와서, 방을 찾고, 그 방의 ArrayList<session>에서 해당 session을 지운다.
	

	}
}