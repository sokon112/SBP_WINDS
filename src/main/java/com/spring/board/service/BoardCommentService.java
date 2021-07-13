package com.spring.board.service;

import java.util.List;

import com.spring.board.domain.EventAttachFileDTO;
import com.spring.board.domain.BoardVO;
import com.spring.board.domain.BoardCommentVO;
import com.spring.board.domain.BoardCriteria;

public interface BoardCommentService {

	public boolean insert(BoardCommentVO comment);
	public boolean delete(int bno);
	public boolean update(BoardCommentVO comment);
	public List<BoardCommentVO> list(BoardCriteria cri,int bno);
	public BoardCommentVO read(int bno);
	public int total(BoardCriteria cri);
	
}
