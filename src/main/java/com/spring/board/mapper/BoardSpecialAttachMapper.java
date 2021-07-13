package com.spring.board.mapper;

import java.util.List;

import com.spring.board.domain.BoardSpecialAttachFileDTO;

public interface BoardSpecialAttachMapper { // 이벤트,동호회 파일첨부
	public int bspecialinsert(BoardSpecialAttachFileDTO attach); //파일삽입
	public int bspecialdelete(int bno); //파일 삭제
	public List<BoardSpecialAttachFileDTO> bspecialfindByBno(int bno);  //파일리스트 찾기
}
