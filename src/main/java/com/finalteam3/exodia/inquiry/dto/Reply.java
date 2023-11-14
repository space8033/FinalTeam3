package com.finalteam3.exodia.inquiry.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Reply {
	private int reply_no;
	private int notice_no;
	private String reply_content;
	private int empinfo_no;
	private String reply_createdat;
	private String reply_modifiedat;
	private String reply_deletedat;
	private String empinfo_name;
	private String empinfo_email;
	private String photo;
	private int emp_no;
	private String twoname;
}
