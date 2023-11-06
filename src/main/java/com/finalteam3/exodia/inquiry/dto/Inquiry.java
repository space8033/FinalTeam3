package com.finalteam3.exodia.inquiry.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Inquiry {
	private int inquiry_no;
	private int project_no;
	private String inquiry_title;
	private String inquiry_content;
	private String inquiry_type;
	private String inquiry_createdat;
	private String inquiry_modifiedat;
	private String inquiry_deletedat;
	private String inquiry_team;
	private int empinfo_no_writer;
	private String empinfo_name;
	private MultipartFile[] inquiry_files;

}
