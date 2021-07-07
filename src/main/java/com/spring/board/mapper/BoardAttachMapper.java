package com.spring.board.mapper;

import java.util.List;

import com.spring.board.domain.BoardAttachFileDTO;

public interface BoardAttachMapper {
	public int insert(BoardAttachFileDTO attach);
	public int delete(int bno);
	public List<BoardAttachFileDTO> findByBno(int bno); 
	public List<BoardAttachFileDTO> getOldFiles();
}
