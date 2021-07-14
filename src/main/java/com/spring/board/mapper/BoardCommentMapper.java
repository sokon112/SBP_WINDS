package com.spring.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.board.domain.BoardCommentPageVO;
import com.spring.board.domain.BoardCommentVO;
import com.spring.board.domain.BoardCriteria;


public interface BoardCommentMapper { //댓글
	public int bcommentinsert(BoardCommentVO comment); //댓글 삽입
	public BoardCommentVO bcommentread(int rno);	//댓글 하나읽기
	public int bcommentupdate(BoardCommentVO comment); //댓글 수정
	public int bcommentdelete(int rno); //댓글 삭제
	public int bcommentdeleteAll(int ano); //댓글 전체 삭제
	public int bcommentCountByBno(int bno); // 댓글 수
	public List<BoardCommentVO> bcommentlist(@Param("cri") BoardCriteria cri,@Param("dno") int dno);
	//댓글 검색리스트
	public int bcommenttotal(BoardCriteria cri);
	//댓글 검색
}
