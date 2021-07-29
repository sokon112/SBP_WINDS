package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.domain.BoardCommentPageVO;
import com.spring.board.domain.BoardCommentVO;
import com.spring.board.domain.BoardCriteria;
import com.spring.board.mapper.BoardMapper;
import com.spring.board.mapper.BoardCommentMapper;

@Service
public class BoardCommentServiceImpl implements BoardCommentService {

	@Autowired
	private BoardCommentMapper bcmapper;

	@Autowired
	private BoardMapper bmapper;
	
	@Override	
	public boolean bcinsert(BoardCommentVO comment) {
		
		boolean result = bcmapper.bcinsert(comment)>0?true:false;
		return result;
	}
	
	@Override
	public boolean bcupdate(BoardCommentVO comment) {
		return bcmapper.bcupdate(comment)>0?true:false;
	}

	@Override
	public boolean bcdelete(int rno) {

		BoardCommentVO comment = bcmapper.bcread(rno);
		return bcmapper.bcdelete(rno)>0?true:false;
	}

	
	@Override
	public BoardCommentPageVO bclist(BoardCriteria cri, int dno) {
		return new BoardCommentPageVO(bcmapper.bcCountByBno(dno),bcmapper.bclist(cri, dno));
	}

	@Override
	public BoardCommentVO bcread(int rno) {
		return bcmapper.bcread(rno);
	}

	@Override
	public int bctotal(BoardCriteria cri) {
		return bcmapper.bctotal(cri);

	}

	
	
	

	

}