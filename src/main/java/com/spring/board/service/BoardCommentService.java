package com.spring.board.service;

import com.spring.board.domain.BoardCommentPageVO;
import com.spring.board.domain.BoardCommentVO;
import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardVO;

public interface BoardCommentService {

	public boolean bcinsert(BoardCommentVO comment);
	public boolean bcdelete(int dno);
	public boolean bcupdate(BoardCommentVO comment);
	public BoardCommentPageVO bclist(BoardCriteria cri,int bno); 
	public BoardCommentVO bcread(int dno); //읽기
	public boolean bcdeleteAll(int bno); //댓글 전체 삭제
	public int bcCountByBno(int bno); // 댓글 전체수
	public BoardCommentVO bcsalt(int dno);//암호화

	
}
