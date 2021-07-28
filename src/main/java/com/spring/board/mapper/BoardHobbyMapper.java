package com.spring.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardHobbyAttachFileDTO;
import com.spring.board.domain.BoardHobbyVO;
import com.spring.board.domain.BoardVO;


public interface BoardHobbyMapper { //이벤트,동호회(스페셜) 게시글

	public int bhinsert(BoardHobbyVO vo); //삽입
	public int bhdelete(int bno); //삭제
	public int bhupdate(BoardHobbyVO vo); //수정
	public List<BoardHobbyVO> bhlist(BoardCriteria cri); //전체리스트 
	public BoardHobbyVO bhread(int bno); //읽기
	public int bhtotalCnt(BoardCriteria cri); // 검색
	public int boardupdateviews(int bno); //조회수
	public BoardVO boardcheckpw(@Param("bno")int bno, @Param("password")String password); //비밀번호 체크
	public List<BoardHobbyAttachFileDTO> bhAttachList(int bno);
	//게시물 수
}
