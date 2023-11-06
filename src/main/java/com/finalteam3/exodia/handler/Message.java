package com.finalteam3.exodia.handler;

import lombok.Data;

@Data
public class Message {
	private String msg;
	private int count;
	private String cmd;
	private String sender;
	private String title;
}
