package com.spring.board.mapper;

import java.util.List;

import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardSpecialAttachFileDTO;
import com.spring.board.domain.BoardSpecialVO;



public interface BoardSpecialMapper { //이벤트,동호회(스페셜) 게시글

	public int specialinsert(BoardSpecialVO vo); //삽입
	public int specialdelete(int bno); //삭제
	public int specialupdate(BoardSpecialVO vo); //수정
	public List<BoardSpecialVO> speciallist(BoardCriteria cri); //전체리스트 
	public BoardSpecialVO specialread(int bno); //읽기
	public int specialtotalCnt(BoardCriteria cri); // 검색
	
	public List<BoardSpecialAttachFileDTO> specialAttachList(int bno);
	//게시물 수
}
