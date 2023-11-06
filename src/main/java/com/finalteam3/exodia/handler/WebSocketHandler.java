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
import com.finalteam3.exodia.employee.dao.EmployeeDao;
import com.finalteam3.exodia.employee.dto.request.JoinRequest;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.note.dto.EmployeeInfo;

import lombok.extern.slf4j.Slf4j;

@Component
@RequestMapping("/header")
@Slf4j
public class WebSocketHandler extends TextWebSocketHandler{

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Resource
	private AlarmDao alarmDao;
	
	@Resource
	private EmployeeDao empDao;
	
	//로그인한 인원 전체
	private static List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	//1:1로 할 경우
	private Map<String, WebSocketSession> userSessionMap = new HashMap<String, WebSocketSession>();
	 
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//알람
		sessions.add(session);
		String userId = session.getPrincipal().getName();
		userSessionMap.put(userId, session);
		
		//채팅
		//log.info("#ChattingHandler, afterConnectionEstablished");
		
		//log.info(session.getId()+"님이 입장하셨습니다.");
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		//알람
			
			String msg = message.getPayload();
			log.info(msg+"메세지 받아오니?");
			
			if(msg.isEmpty()) {
				
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
		//log.info("#ChattingHandler, afterConnectionClosed");

		sessionList.remove(session);
		
		//log.info(session.getId()+"님이 퇴장하셨습니다.");
	}
}