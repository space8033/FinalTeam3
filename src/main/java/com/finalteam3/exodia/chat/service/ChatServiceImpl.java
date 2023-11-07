package com.finalteam3.exodia.chat.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finalteam3.exodia.chat.dao.ChatDao;
import com.finalteam3.exodia.chat.dto.request.ChatMessage;
import com.finalteam3.exodia.chat.dto.request.ChatParticipant;
import com.finalteam3.exodia.chat.dto.request.ChatRoom;
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

	
}
