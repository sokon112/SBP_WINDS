package com.spring.board.service;

import java.util.List;


import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardSpecialAttachFileDTO;
import com.spring.board.domain.BoardSpecialVO;

public interface BoardSpecialService {

	public boolean insert(BoardSpecialVO vo);
	public boolean delete(int bno);
	public boolean update(BoardSpecialVO vo);
	public List<BoardSpecialVO> list(BoardCriteria cri);
	public BoardSpecialVO read(int bno);
	public int total(BoardCriteria cri);
	
	public List<BoardSpecialAttachFileDTO> getAttachList(int bno);

	
}
