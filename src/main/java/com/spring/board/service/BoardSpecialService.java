package com.spring.board.service;

import java.util.List;


import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardSpecialAttachFileDTO;
import com.spring.board.domain.BoardSpecialVO;

public interface BoardSpecialService { //이벤트, 동호회 

	public boolean bspecialinsert(BoardSpecialVO vo);
	public boolean bspecialdelete(int bno);
	public boolean bspecialupdate(BoardSpecialVO vo);
	public List<BoardSpecialVO> bspeciallist(BoardCriteria cri);
	public BoardSpecialVO bspecialread(int bno);
	public int bspecialtotalCnt(BoardCriteria cri); // 검색
	
	public List<BoardSpecialAttachFileDTO> bspecialAttachList(int bno); //

	
}
