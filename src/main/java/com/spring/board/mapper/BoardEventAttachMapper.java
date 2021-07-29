package com.spring.board.mapper;

import java.util.List;

import com.spring.board.domain.BoardEventAttachFileDTO;

public interface BoardEventAttachMapper { // 이벤트 파일첨부
	public int beinsert(BoardEventAttachFileDTO attach); //파일삽입
	public int bedelete(int eno); //파일 삭제
	public List<BoardEventAttachFileDTO> befindBySno(int eno);  //파일리스트 찾기
	public List<BoardEventAttachFileDTO> geteOldFiles();

}
