package com.finalteam3.exodia.note.dto;

import lombok.Data;

@Data
public class NoteAll {
	private int note_no;
	private String note_title;
	private String note_content;
	private int note_sender;
	private boolean note_isCanceled;
	private String note_createdAt;
	private String note_deletedAt;
	private int noteRead_no;
	private int emp_no_receiver;
	private String noteRead_read;
	private String noteRead_type;
	private String noteRead_starred;
	private String note_sender_name;
}
