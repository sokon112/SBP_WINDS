package com.spring.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.board.domain.BoardVO;
import com.spring.board.domain.BoardCriteria;

public interface BoardMapper { //게시판

	public int boardinsert(BoardVO vo); //게시글 삽입
	public int boarddelete(int bno);  //게시글 삭제
	public int boardupdate(BoardVO vo);  //게시글 수정
	public List<BoardVO> boardlist(BoardCriteria cri);  //게시판 전체 리스트 검색
	public BoardVO boardread(int bno); //게시글 읽기
	public int boardupdateviews(int bno); //조회수
	public int boardtotalCnt(BoardCriteria cri); //게시글 검색
	public int boardcommentCntUpdate(@Param("bno") int bno, @Param("amount") int amount);// 게시글 댓글수 
	public int boardcheckpw(@Param("bno")int bno, @Param("password")String password); //비밀번호 체크
	
}
