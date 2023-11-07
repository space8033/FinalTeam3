package com.finalteam3.exodia.chat.dto.request;

import lombok.Data;

@Data
public class ChatMessage {

	private int chatMessage_no;
	private int empInfo_no;
	private int chatRoom_no;
	private String message_content;
	private String message_read;
	private String message_createdAt;
}
