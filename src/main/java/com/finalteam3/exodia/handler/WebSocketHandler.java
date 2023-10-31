package com.finalteam3.exodia.handler;

import java.lang.System.Logger;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.logging.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.finalteam3.exodia.alarm.dao.AlarmDao;

import lombok.extern.slf4j.Slf4j;

@Component
@RequestMapping("/header")
@Slf4j
public class WebSocketHandler extends TextWebSocketHandler{

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Resource
	private AlarmDao alarmDao;
	
	
	private static List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//알람
		sessions.add(session);
		
		
		//채팅
		//log.info("#ChattingHandler, afterConnectionEstablished");
		
		log.info(session.getId()+"님이 입장하셨습니다.");
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		
		//알람
		for(WebSocketSession single : sessions) {
			String memId = message.getPayload();
			log.info(message+"나 메세지" + memId+"나 아이디"+single+"싱글이야?"+session.getId()+"세션에서 얻은 아이디"+single.getId()+"싱글에서얻은아이디");
			//int count = alarmDao.selectAlarmUchkCount(memId);
			int count = 3;
			
			if(single.getId().equals(session.getId()) && count != 0) {
				TextMessage sendMsg = new TextMessage(memId + "님 새 알람이 있습니다");
				single.sendMessage(sendMsg);
			}
		}
		
		
		
		
		//채팅
		
		//log.info(session.getId() + ": " + message);
		
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(message.getPayload()));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		//알람
		
		//채팅
		log.info("#ChattingHandler, afterConnectionClosed");

		sessionList.remove(session);
		
		log.info(session.getId()+"님이 퇴장하셨습니다.");
	}
}