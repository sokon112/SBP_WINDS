package com.spring.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardEventAttachFileDTO;
import com.spring.board.domain.BoardEventVO;

public interface BoardEventService { //이벤트

	public boolean beinsert(BoardEventVO vo); //삽입
	public boolean bedelete(int bno); //삭제
	public boolean beupdate(BoardEventVO vo);  //수정
	public List<BoardEventVO> belist(BoardCriteria cri); //검색
	public BoardEventVO beread(int bno); //읽기
	public int betotalCnt(BoardCriteria cri); // 전체검색
	public boolean boardupdateviews(int bno); //조회수
	public boolean boardcheckpw(@Param("bno") int bno,@Param("password") String password);
	
	public List<BoardEventAttachFileDTO> beAttachList(int bno); //파일첨부

	
}
