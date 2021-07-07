package com.spring.board.mapper;

import java.util.List;

import com.spring.board.domain.BoardVO;

public interface BoardMapper {

	public int insert(BoardVO vo);
	public int delete(int bno);
	public int update(BoardVO vo);
	public BoardVO read(int bno);
	
	
}
