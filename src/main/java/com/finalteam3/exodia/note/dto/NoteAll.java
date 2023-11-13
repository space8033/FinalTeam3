package com.finalteam3.exodia.note.dto;

import lombok.Data;

@Data
public class NoteAll {
	private int note_no;
	private String note_title;
	private String note_content;
	private String note_draft;
	private int note_sender;
	private boolean noteRead_isCanceled;
	private String note_createdAt;
	private String noteRead_deletedAt;
	private String note_deletedAt;
	private String noteRead_realDeletedAt;
	private String note_restime;
	private String note_label;
	private int noteRead_no;
	private int emp_no_receiver;
	private String noteRead_read;
	private String noteRead_type;
	private String noteRead_starred;
	private String note_sender_name;
	private String base64;
	private boolean media_isEmpty;
}
