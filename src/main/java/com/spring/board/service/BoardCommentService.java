package com.spring.board.service;

import java.util.List;

import com.spring.board.domain.BoardVO;
import com.spring.board.domain.BoardCommentPageVO;
import com.spring.board.domain.BoardCommentVO;
import com.spring.board.domain.BoardCriteria;

public interface BoardCommentService {

	public boolean bcinsert(BoardCommentVO comment);
	public boolean bcdelete(int dno);
	public boolean bcupdate(BoardCommentVO comment);
	public BoardCommentPageVO bclist(BoardCriteria cri,int dno);
	public BoardCommentVO bcread(int dno);
	public int bctotal(BoardCriteria cri);
	
}
