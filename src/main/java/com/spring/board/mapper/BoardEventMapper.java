package com.spring.board.mapper;

import java.util.List;

import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardEventAttachFileDTO;
import com.spring.board.domain.BoardEventVO;



public interface BoardEventMapper { //이벤트,동호회(스페셜) 게시글

	public int beinsert(BoardEventVO vo); //삽입
	public int bedelete(int bno); //삭제
	public int beupdate(BoardEventVO vo); //수정
	public List<BoardEventVO> belist(BoardCriteria cri); //전체리스트 
	public BoardEventVO beread(int bno); //읽기
	public int betotalCnt(BoardCriteria cri); // 검색
	
	public List<BoardEventAttachFileDTO> beAttachList(int bno);
	//게시물 수
}
