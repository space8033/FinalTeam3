package com.finalteam3.exodia.note.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

import com.finalteam3.exodia.note.dto.NoteAll;

@Mapper
public interface NoteDao {
	public List<NoteAll> selectNoteByEmpNo(Map<String, Object> map);
	public int countByEmpno(int Nno);
}
