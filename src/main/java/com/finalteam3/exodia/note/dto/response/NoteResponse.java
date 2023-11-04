package com.finalteam3.exodia.note.dto.response;

import com.finalteam3.exodia.note.dto.request.Note;

import lombok.Data;

@Data
public class NoteResponse {
	private int emp_no_receiver;
	private String noteRead_type;
	private String emp_name;
	private String emp_email;
}
