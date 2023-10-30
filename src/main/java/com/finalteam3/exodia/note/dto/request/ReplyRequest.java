package com.finalteam3.exodia.note.dto.request;


import lombok.Data;

@Data
public class ReplyRequest {
	private int note_sender;
	private String note_title;
	private String note_content;
	private String note_receiver;
	private String note_reserve_time;
	private int note_no;
}
