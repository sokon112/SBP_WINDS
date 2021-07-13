package com.spring.board.mapper;

import java.util.List;

import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardSpecialAttachFileDTO;
import com.spring.board.domain.BoardSpecialVO;



public interface BoardSpecialMapper { //이벤트,동호회(스페셜) 게시글

	public int bspecialinsert(BoardSpecialVO vo); //삽입
	public int bspecialdelete(int bno); //삭제
	public int bspecialupdate(BoardSpecialVO vo); //수정
	public List<BoardSpecialVO> bspeciallist(BoardCriteria cri); //전체리스트 
	public BoardSpecialVO bspecialread(int bno); //읽기
	public int bspecialtotalCnt(BoardCriteria cri); // 검색
	
	public List<BoardSpecialAttachFileDTO> bspecialAttachList(int bno);
	//게시물 수
}
