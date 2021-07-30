package com.spring.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardHobbyVO;
import com.spring.board.domain.BoardVO;


public interface BoardHobbyMapper { //이벤트,동호회(스페셜) 게시글

	public int bhinsert(BoardHobbyVO vo); //삽입
	public int bhdelete(@Param("hno")int hno, @Param("hpassword")String hpassword); //삭제
	public int bhupdate(BoardHobbyVO vo); //수정
	public List<BoardHobbyVO> bhlist(BoardCriteria cri); //전체리스트 
	public BoardHobbyVO bhread(int hno); //읽기
	public int bhtotalCnt(BoardCriteria cri); // 검색
	public int bhupdateviews(int hno); //조회수
	public BoardHobbyVO bhcheckpw(@Param("hno")int hno, @Param("hpassword")String hpassword); //비밀번호 체크
	public int bhaddelete(int hno); // 관리자 삭제

}
