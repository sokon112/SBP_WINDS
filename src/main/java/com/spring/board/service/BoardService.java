package com.spring.board.service;

import java.util.List;

import com.spring.board.domain.EventAttachFileDTO;
import com.spring.board.domain.BoardVO;
import com.spring.board.domain.Criteria;

public interface BoardService {

	public boolean insert(BoardVO vo);
	public boolean delete(int bno);
	public boolean update(BoardVO vo);
	public List<BoardVO> list(Criteria cri);
	public BoardVO read(int bno);
	public int total(Criteria cri);
	

	
}
