package com.spring.board.service;

import java.util.List;

import com.spring.board.domain.BoardVO;
import com.spring.board.domain.BoardCommentPageVO;
import com.spring.board.domain.BoardCommentVO;
import com.spring.board.domain.BoardCriteria;

public interface BoardCommentService {

	public boolean bcommentinsert(BoardCommentVO comment);
	public boolean bcommentdelete(int dno);
	public boolean bcommentupdate(BoardCommentVO comment);
	public BoardCommentPageVO bcommentlist(BoardCriteria cri,int dno);
	public BoardCommentVO bcommentread(int dno);
	public int bcommenttotal(BoardCriteria cri);
	
}
