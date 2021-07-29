package com.spring.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardEventAttachFileDTO;
import com.spring.board.domain.BoardEventVO;
import com.spring.board.domain.BoardVO;



public interface BoardEventMapper { //이벤트게시글

	public int beinsert(BoardEventVO vo); //삽입
	public int bedelete(@Param("eno")int eno, @Param("epassword")String epassword); //삭제
	public int beupdate(BoardEventVO vo); //수정
	public List<BoardEventVO> belist(BoardCriteria cri); //전체리스트 
	public BoardEventVO beread(int bno); //읽기
	public int betotalCnt(BoardCriteria cri); // 검색
	public int beupdateviews(int eno); //조회수
	public BoardEventVO becheckpw(@Param("eno")int eno, @Param("epassword")String epassword); //비밀번호 체크
	public List<BoardEventAttachFileDTO> beAttachList(int bno);
	//첨부파일 리스트
	public int beaddelete(int bno); // 관리자 삭제
}
