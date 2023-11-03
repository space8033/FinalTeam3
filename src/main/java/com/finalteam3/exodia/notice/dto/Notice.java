package com.finalteam3.exodia.notice.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Notice {
	private int notice_no;
	private int project_no;
	private String notice_title;
	private String notice_content;
	private String notice_type;
	private String notice_createdat;
	private String notice_modifiedat;
	private String notice_deletedat;
	private String notice_team;
	private int empinfo_no_writer;
	private String empinfo_name;
	private MultipartFile[] notice_files;

}
