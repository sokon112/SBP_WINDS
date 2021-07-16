package com.spring.board.mapper;

import java.util.List;

import com.spring.board.domain.BoardEventAttachFileDTO;

public interface BoardHobbyAttachMapper { // 동호회 파일첨부
	public int bspecialinsert(BoardEventAttachFileDTO attach); //파일삽입
	public int bspecialdelete(int hno); //파일 삭제
	public List<BoardEventAttachFileDTO> bspecialfindByBno(int hno);  //파일리스트 찾기
}
