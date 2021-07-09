package com.spring.board.mapper;

import java.util.List;

import com.spring.board.domain.EventAttachFileDTO;

public interface EventAttachMapper {
	public int insert(EventAttachFileDTO attach);
	public int delete(int bno);
	public List<EventAttachFileDTO> findByBno(int bno); 
	public List<EventAttachFileDTO> getOldFiles();
}
