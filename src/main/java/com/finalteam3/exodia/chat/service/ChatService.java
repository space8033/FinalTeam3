package com.finalteam3.exodia.chat.service;

import java.util.List;

import com.finalteam3.exodia.chat.dto.request.ChatMessage;
import com.finalteam3.exodia.chat.dto.request.ChatParticipant;
import com.finalteam3.exodia.chat.dto.response.EmpChat;
import com.finalteam3.exodia.employee.dto.response.EmpNote;

public interface ChatService {
	public EmpNote getEmpInfo(int emp_no);
	public List<ChatMessage> getChatList(ChatParticipant chatPart);
	public List<EmpChat> getChatEmpList(int empInfo_no);
	public void updateMessageRead(ChatMessage chatmsg);
	public int getEmpInfoNo(ChatMessage chatmsg);
	public ChatMessage getChatMessage(int chatmsgNo);
	public int getUckChatMsgAll(int empInfo_no);
}
