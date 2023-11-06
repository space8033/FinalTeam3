package com.finalteam3.exodia.chat.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finalteam3.exodia.chat.dao.ChatDao;
import com.finalteam3.exodia.chat.dto.request.ChatMessage;
import com.finalteam3.exodia.chat.dto.request.ChatParticipant;
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
		
		int chatRoomNo = chatDao.selectChatRoomNo(chatPart);
		log.info(chatRoomNo+"챗넘버못받아오는건지");
		List<ChatMessage> chatMsg = chatDao.selectChatHistory(chatRoomNo);
		
		return chatMsg;
	}

	
}
