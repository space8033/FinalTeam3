package com.finalteam3.exodia.employee.dto.response;

import lombok.Data;

@Data
public class TransferDto {
	private int value;
	private String name;
	private String email;
	private String two_name;
	private byte[] profile;
	private String team_name;
}
