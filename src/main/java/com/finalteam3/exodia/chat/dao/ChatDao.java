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
	
	public int selectChatRoomNo(ChatParticipant chatPart);
	
	public List<ChatMessage> selectChatHistory(int chatRoomNo);

}
