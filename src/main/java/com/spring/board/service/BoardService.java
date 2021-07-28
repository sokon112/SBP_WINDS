package com.spring.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.board.domain.BoardVO;
import com.spring.board.domain.BoardCriteria;

public interface BoardService {

	public boolean boardinsert(BoardVO vo);
	public boolean boarddelete(@Param("bno")int bno, @Param("password")String password);
	public boolean boardupdate(BoardVO vo);
	public List<BoardVO> boardlist(BoardCriteria cri);
	public BoardVO boardread(int bno);
	public int boardtotal(BoardCriteria cri);
	public boolean boardupdateviews(int bno); //조회수
	public boolean boardcheckpw(@Param("bno") int bno,@Param("password") String password);
	
	
}
