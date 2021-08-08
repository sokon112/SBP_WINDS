package com.spring.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardEventAttachFileDTO;
import com.spring.board.domain.BoardEventVO;
import com.spring.board.domain.BoardHobbyVO;

public interface BoardEventService { //이벤트

	public boolean beinsert(BoardEventVO vo); //삽입
	public boolean bedelete(@Param("eno") int eno,@Param("epassword") String epassword); //삭제
	public boolean beupdate(BoardEventVO vo);  //수정
	public List<BoardEventVO> belist(BoardCriteria cri); //검색 리스트
	public BoardEventVO beread(int eno); //읽기
	public int betotalCnt(BoardCriteria cri); // 전체검색
	public boolean beupdateviews(int eno); //조회수
	public boolean becheckpw(@Param("eno") int eno,@Param("epassword") String epassword); //비번 확인
	public boolean beaddelete(int eno); //관리자 삭제
	public BoardEventVO besalt(int eno);//암호화


	public List<BoardEventAttachFileDTO> beAttachList(int eno); //파일첨부

	
}
