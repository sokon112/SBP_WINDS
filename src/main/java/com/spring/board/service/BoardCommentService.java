package com.spring.board.service;

import java.util.List;

import com.spring.board.domain.BoardVO;
import com.spring.board.domain.BoardCommentVO;
import com.spring.board.domain.BoardCriteria;

public interface BoardCommentService {

	public boolean bcommentinsert(BoardCommentVO comment);
	public boolean bcommentdelete(int bno);
	public boolean bcommentupdate(BoardCommentVO comment);
	public List<BoardCommentVO> bcommentlist(BoardCriteria cri,int bno);
	public BoardCommentVO bcommentread(int bno);
	public int bcommenttotal(BoardCriteria cri);
	
}
