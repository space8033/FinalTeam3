package com.finalteam3.exodia.note.dto.request;

import lombok.Data;

@Data
public class NoteRead {
	private int noteRead_no;
	private int note_no;
	private int emp_no_receiver;
	private String noteRead_read;
	private String noteRead_type;
	private String noteRead_starred;
	private String noteRead_deletedAt;
	private String noteRead_realDeletedAt;
	private boolean noteRead_isCanceled;
	
}
