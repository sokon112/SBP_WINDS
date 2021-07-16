package com.spring.board.service;

import java.util.List;


import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardHobbyAttachFileDTO;
import com.spring.board.domain.BoardHobbyVO;

public interface BoardHobbyService { //이벤트, 동호회 

	public boolean bhinsert(BoardHobbyVO vo);
	public boolean bhdelete(int bno);
	public boolean bhupdate(BoardHobbyVO vo);
	public List<BoardHobbyVO> bhlist(BoardCriteria cri);
	public BoardHobbyVO bhread(int bno);
	public int bhtotalCnt(BoardCriteria cri); // 검색
	
	public List<BoardHobbyAttachFileDTO> bhAttachList(int bno); //

	
}
