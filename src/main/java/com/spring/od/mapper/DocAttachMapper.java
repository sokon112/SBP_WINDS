package com.spring.od.mapper;

import java.util.List;

import com.spring.od.domain.AttachFileDTO;

public interface DocAttachMapper {
	public int oainsert(AttachFileDTO attach);
	public int oadelete(int docNum);
	public List<AttachFileDTO> oafindByDocNum(int docNum);
}
