package com.finalteam3.exodia.chat.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finalteam3.exodia.chat.dao.ChatDao;
import com.finalteam3.exodia.chat.dto.request.ChatMessage;
import com.finalteam3.exodia.chat.dto.request.ChatParticipant;
import com.finalteam3.exodia.chat.dto.request.ChatRoom;
import com.finalteam3.exodia.chat.dto.response.EmpChat;
import com.finalteam3.exodia.employee.dao.EmployeeDao;
import com.finalteam3.exodia.employee.dto.response.EmpNote;
import com.finalteam3.exodia.note.dao.NoteDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ChatServiceImpl implements ChatService {
	@Resource
	private NoteDao noteDao;
	@Resource
	private EmployeeDao employeeDao;
	@Resource
	private ChatDao chatDao;
	
	@Override
	public EmpNote getEmpInfo(int emp_no) {
		
		return employeeDao.selectEmployeeByEmpNo(emp_no);
		
	}

	@Override
	public List<ChatMessage> getChatList(ChatParticipant chatPart) {
		
		Integer chatRoomNo = chatDao.selectChatRoomNo(chatPart);
		log.info(chatRoomNo+"챗넘버못받아오는건지");
		
		if(chatRoomNo == null) {
			ChatRoom chatRoom = new ChatRoom();
			
			chatDao.insertChatRoom(chatRoom);
			
			int chatRoom_no = chatRoom.getChatRoom_no();
			log.info(chatRoom_no+"방번호잘가져오나");
			
			
			ChatMessage chatMsg = new ChatMessage();
			chatMsg.setChatRoom_no(chatRoom_no);
			chatMsg.setEmpInfo_no(chatPart.getEmpInfo_no1());
			chatMsg.setMessage_content("");
			chatMsg.setMessage_read("");
			chatDao.insertChatMessage(chatMsg);
			ChatMessage chatMsg2 = new ChatMessage();
			chatMsg2.setChatRoom_no(chatRoom_no);
			chatMsg2.setEmpInfo_no(chatPart.getEmpInfo_no2());
			chatMsg2.setMessage_content("");
			chatMsg2.setMessage_read("");
			chatDao.insertChatMessage(chatMsg2);
			List<ChatMessage> chatMsgList = chatDao.selectChatHistory(chatRoom_no);
			
			return chatMsgList;
			
		} else {
			
			List<ChatMessage> chatMsg = chatDao.selectChatHistory(chatRoomNo);
			return chatMsg;
		}
	}

	@Override
	public List<EmpChat> getChatEmpList(int empInfo_no) {
		List<EmpNote> empList = employeeDao.selectEmployeeForNote();
		List<EmpChat> empChatList = new ArrayList<>();
		
		for(EmpNote emp : empList) {
			ChatParticipant chatParticipant = new ChatParticipant();
			if(emp.getEmpinfo_no() != empInfo_no && emp.getEmpinfo_no() != 0) {
				
				EmpChat empchat = new EmpChat();
				chatParticipant.setEmpInfo_no1(emp.getEmpinfo_no());
				chatParticipant.setEmpInfo_no2(empInfo_no);
				
				empchat.setEmp_id(emp.getEmp_id());
				empchat.setEmp_no(emp.getEmp_no());
				empchat.setEmpinfo_email(emp.getEmpinfo_email());
				empchat.setEmpinfo_position(emp.getEmpinfo_position());
				empchat.setEmpinfo_no(emp.getEmpinfo_no());
				empchat.setProfile(emp.getProfile());
				empchat.setTwo_name(emp.getTwo_name());
				empchat.setTeam_name(emp.getTeam_name());
				empchat.setEmpinfo_name(emp.getEmpinfo_name());
				
				//챗방검색
				Integer chatRoomNo = chatDao.selectChatRoomNo(chatParticipant);
				
				if(chatRoomNo != null) {
					log.info(chatRoomNo+"챗룸넘버 integer");
					
					int chatroom_no = chatRoomNo;
					ChatRoom room = chatDao.selectChatRoomByRoomNo(chatroom_no);
					log.info(chatRoomNo+"챗룸넘버 int");
					empchat.setChatRoom_no(chatroom_no);
					Integer lastMsgId = room.getChatRoom_lastMsgId();
					if(lastMsgId != null && lastMsgId != 0) {
						ChatMessage chatMsg = new ChatMessage();
						chatMsg.setChatRoom_no(chatroom_no);
						chatMsg.setEmpInfo_no(emp.getEmpinfo_no());
						int unreadCount = chatDao.countUnreadChat(chatMsg);
						empchat.setUnreadCount(unreadCount);
						log.info(lastMsgId+"lastMsgId int");
						int lastMsgNo = lastMsgId;
						log.info(lastMsgNo+"lastMsgNo int");
						ChatMessage chatMessage = chatDao.selectLastMsg(lastMsgNo);
						empchat.setLastMsgContent(chatMessage.getMessage_content());
						empchat.setLastMsgNo(chatMessage.getChatMessage_no());
						empchat.setMessage_createdAt(chatMessage.getMessage_createdAt());
					}
				}
				
				
				empChatList.add(empchat);
			}
		}
		
		return empChatList;
	}

	
}
