package com.finalteam3.exodia.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.chat.dto.request.ChatMessage;
import com.finalteam3.exodia.chat.dto.request.ChatParticipant;
import com.finalteam3.exodia.chat.dto.request.ChatRoom;

@Mapper
public interface ChatDao {
	public int insertChatRoom(ChatRoom chatRoom);
	public int insertChatMessage(ChatMessage chatMsg);
	
	public Integer selectChatRoomNo(ChatParticipant chatPart);

	public int countUnreadChat(ChatMessage chatMsg);
	
	public List<ChatMessage> selectChatHistory(int chatRoomNo);
	
	public void updateChatRoom(ChatRoom chatRoom);
	
	public ChatRoom selectChatRoomByRoomNo(int chatRoomNo);
	
	public int selectEmpInfoNo(ChatMessage chatMsg);
	
	public ChatMessage selectLastMsg(int chatMsgId);
	
	public void updateUnCheckMsg(ChatMessage chatMsg);

}
