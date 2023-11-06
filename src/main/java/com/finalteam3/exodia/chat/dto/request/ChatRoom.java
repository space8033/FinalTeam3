package com.finalteam3.exodia.chat.dto.request;

import lombok.Data;

@Data
public class ChatRoom {
	private int chatRoom_no;
	private String chatRoom_createdAt;
	private int chatRoom_lastMsgId;

}
