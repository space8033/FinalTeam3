package com.finalteam3.exodia.chat.dto.response;

import lombok.Data;

@Data
public class EmpChat {

	private int lastMsgNo;
	private int chatRoom_no;
	private String lastMsgContent;
	private String message_createdAt;
	private int unreadCount;
	private int emp_no;
	private int empinfo_no;
	private String empinfo_name;
	private String two_name;
	private String emp_id;
	private String team_name;
	private String empinfo_email;
	private String empinfo_position;
	private String emp_status;
	private byte[] profile;
}
