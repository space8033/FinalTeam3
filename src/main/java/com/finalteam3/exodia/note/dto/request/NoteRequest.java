package com.finalteam3.exodia.note.dto.request;

import java.util.List;

import org.json.JSONArray;

import lombok.Data;

@Data
public class NoteRequest {
	private int note_sender;
	private String note_title;
	private String note_content;
	private List<String> note_receiver;
	private JSONArray note_receiver_cc;
	private List<String> note_receiver_bcc;
	private String note_reserve_time;
}
