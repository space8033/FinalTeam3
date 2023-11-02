package com.finalteam3.exodia.media.dto;

import lombok.Data;

@Data
public class MediaDto {
	private int media_no;
	private String media_name;
	private byte[] media_data;
	private String media_type;
	//어떤 테이블 관련 미디어인지 표시(등록시 아래 5개중 무조건 지정)
	//EMP, NOTICE, COMMENT, NOTE, CHAT
	private String media_from;
	private int from_no;
}
