package com.finalteam3.exodia.note.dto.request;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoteRequest {
	private int note_sender;
	private String note_title;
	private String note_content;
	private List<String> note_receiver;
	private List<String> note_receiver_cc;
	private List<String> note_receiver_bcc;
	private String note_reserve_time;
	private String note_label;
	private MultipartFile[] files;
}
