
package com.spring.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.board.domain.BoardVO;
import com.spring.board.domain.BoardCriteria;

public interface BoardService { //게시판

	public boolean boardinsert(BoardVO vo);//삽입
	public boolean boarddelete(@Param("bno")int bno, @Param("password")String password);
	public boolean boardupdate(BoardVO vo);// 수정
	public List<BoardVO> boardlist(BoardCriteria cri); //검색
	public BoardVO boardread(int bno);//읽기
	public int boardtotal(BoardCriteria cri); //전체검색
	public boolean boardupdateviews(int bno); //조회수
	public boolean boardcheckpw(@Param("bno") int bno,@Param("password") String password);
	public boolean boardaddelete(int bno); //관리자 삭제
	public BoardVO boardsalt(int bno);//암호화
	
}
