package com.finalteam3.exodia.note.dto.request;

import lombok.Data;

@Data
public class Note {
	private int note_no;
	private String note_title;
	private String note_content;
	private int note_sender;
	
	private String note_createdAt;
	private String note_label;
	private String note_draft;
	private String note_restime;
}
