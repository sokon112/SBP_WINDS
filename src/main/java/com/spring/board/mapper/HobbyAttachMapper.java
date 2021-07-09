package com.spring.board.mapper;

import java.util.List;

import com.spring.board.domain.HobbyAttachFileDTO;


public interface HobbyAttachMapper {
	public int insert(HobbyAttachFileDTO attach);
	public int delete(int bno);
	public List<HobbyAttachFileDTO> findByBno(int bno); 
	public List<HobbyAttachFileDTO> getOldFiles();
}
