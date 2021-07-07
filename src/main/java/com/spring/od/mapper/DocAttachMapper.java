package com.spring.od.mapper;

import java.util.List;

import com.spring.od.domain.AttachFileDTO;

public interface DocAttachMapper {
	public int insert(AttachFileDTO attach);
	public int delete(int docNum);
	public List<AttachFileDTO> findByDocNum(int docNum);
}
