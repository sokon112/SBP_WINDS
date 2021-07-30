package com.spring.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.domain.BoardCommentPageVO;
import com.spring.board.domain.BoardCommentVO;
import com.spring.board.domain.BoardCriteria;
import com.spring.board.mapper.BoardCommentMapper;

@Service
public class BoardCommentServiceImpl implements BoardCommentService {

	@Autowired
	private BoardCommentMapper bcmapper;
	
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
	public boolean bcdelete(int dno) {
		return bcmapper.bcdelete(dno)>0?true:false;
	}

	
	@Override
	public BoardCommentPageVO bclist(BoardCriteria cri, int bno) {
		return new BoardCommentPageVO(bcmapper.bcCountByBno(bno),bcmapper.bclist(cri, bno));
	}

	@Override
	public BoardCommentVO bcread(int bno) {
		return bcmapper.bcread(bno);
	}

	@Override
	public boolean bcdeleteAll(int bno) {
		return bcmapper.bcdeleteAll(bno)>0?true:false;
	}

	@Override
	public int bcCountByBno(int bno) {
		return bcmapper.bcCountByBno(bno);
	}

	
	
	

	

}