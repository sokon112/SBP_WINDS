package com.spring.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.board.domain.BoardCommentVO;
import com.spring.board.domain.BoardCriteria;


public interface BoardCommentMapper { //댓글
	public int insert(BoardCommentVO comment); //댓글 검색
	public BoardCommentVO read(int rno);	//댓글 읽기
	public int update(BoardCommentVO comment); //댓글 수정
	public int delete(int rno); //댓글 삭제
	public int deleteAll(int ano); //댓글 전체 삭제
	public int getCountByBno(int bno); // 댓글 수
	public List<BoardCommentVO> list(@Param("cri") BoardCriteria cri,@Param("bno") int bno);
	//댓글 검색리스트
}
