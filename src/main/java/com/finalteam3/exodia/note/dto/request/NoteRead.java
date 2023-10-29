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
}
