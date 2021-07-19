package com.spring.board.mapper;

import java.util.List;

import com.spring.board.domain.BoardHobbyAttachFileDTO;

public interface BoardHobbyAttachMapper { // 동호회 파일첨부
	public int bhinsert(BoardHobbyAttachFileDTO attach); //파일삽입
	public int bhdelete(int hno); //파일 삭제
	public List<BoardHobbyAttachFileDTO> bhfindByBno(int hno);  //파일리스트 찾기
}
