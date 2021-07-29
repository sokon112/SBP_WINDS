package com.spring.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.board.domain.BoardCommentPageVO;
import com.spring.board.domain.BoardCommentVO;
import com.spring.board.domain.BoardCriteria;


public interface BoardCommentMapper { //댓글
	public int bcinsert(BoardCommentVO comment); //댓글 삽입
	public BoardCommentVO bcread(int rno);	//댓글 하나읽기
	public int bcupdate(BoardCommentVO comment); //댓글 수정
	public int bcdelete(int rno); //댓글 삭제
	public int bcdeleteAll(int ano); //댓글 전체 삭제
	public int bcCountByBno(int bno); // 댓글 수
	public List<BoardCommentVO> bclist(@Param("cri") BoardCriteria cri,@Param("dno") int dno);
	//댓글 검색리스트
	public int bctotal(BoardCriteria cri);
	//댓글 검색
}
