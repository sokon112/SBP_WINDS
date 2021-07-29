package com.spring.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardHobbyAttachFileDTO;
import com.spring.board.domain.BoardHobbyVO;

public interface BoardHobbyService { //이벤트, 동호회 

	public boolean bhinsert(BoardHobbyVO vo); //삽입
	public boolean bhdelete(@Param("hno") int hno,@Param("hpassword") String hpassword); //삭제
	public boolean bhupdate(BoardHobbyVO vo); //수정
	public List<BoardHobbyVO> bhlist(BoardCriteria cri); //검색 리스트
	public BoardHobbyVO bhread(int bno); //읽기
	public int bhtotalCnt(BoardCriteria cri); // 검색
	public boolean bhupdateviews(int hno); //조회수
	public boolean bhcheckpw(@Param("hno") int hno,@Param("hpassword") String hpassword);
	public boolean bhaddelete(int bno); //관리자 삭제
	
	public List<BoardHobbyAttachFileDTO> bhAttachList(int bno); //파일 첨부

	
}
