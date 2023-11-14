package com.finalteam3.exodia.note.dto.response;

import com.finalteam3.exodia.note.dto.request.Note;

import lombok.Data;

@Data
public class NoteResponse {
	private int emp_no_receiver;
	private String noteRead_type;
	private String noteRead_read;
	private String emp_name;
	private String emp_email;
	private String base64;
	private String two_name;
	private String two_name_color;
	private int noteRead_no;
	private boolean noteRead_isCanceled;
}
