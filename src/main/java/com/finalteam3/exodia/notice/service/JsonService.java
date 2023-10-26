package com.finalteam3.exodia.notice.service;

import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.finalteam3.exodia.notice.dto.Notice;

import lombok.Data;

public interface JsonService {

	void saveDataJson(List<Notice> dataList);

}
