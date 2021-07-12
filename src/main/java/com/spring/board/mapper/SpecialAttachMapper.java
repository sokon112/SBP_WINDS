package com.spring.board.mapper;

import java.util.List;

import com.spring.board.domain.SpecialAttachFileDTO;

public interface SpecialAttachMapper {
	public int insert(SpecialAttachFileDTO attach);
	public int delete(int bno);
	public List<SpecialAttachFileDTO> findByBno(int bno); 
	public List<SpecialAttachFileDTO> getOldFiles();
}
