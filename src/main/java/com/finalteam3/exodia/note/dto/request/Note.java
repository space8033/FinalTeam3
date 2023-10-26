package com.finalteam3.exodia.note.dto.request;

import lombok.Data;

@Data
public class Note {
	private int note_no;
	private String note_title;
	private String note_content;
	private int note_sender;
	private boolean note_isCanceled;
	private String note_createdAt;
	private String note_deletedAt;
	private String note_restime;
}
