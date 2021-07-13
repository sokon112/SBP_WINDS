package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public boolean bcommentinsert(BoardCommentVO comment) {
		
		boolean result = bcmapper.bcommentinsert(comment)>0?true:false;
		return result;
	}
	
	@Override
	public boolean bcommentupdate(BoardCommentVO comment) {
		return bcmapper.bcommentupdate(comment)>0?true:false;
	}

	@Override
	public boolean bcommentdelete(int rno) {

		BoardCommentVO comment = bcmapper.bcommentread(rno);
		return bcmapper.bcommentdelete(rno)>0?true:false;
	}

	
	@Override
	public List<BoardCommentVO> bcommentlist(BoardCriteria cri, int bno) {
		return bcmapper.bcommentlist(cri,bno);
	}

	@Override
	public BoardCommentVO bcommentread(int rno) {
		return bcmapper.bcommentread(rno);
	}

	@Override
	public int bcommenttotal(BoardCriteria cri) {
		return bcmapper.bcommenttotal(cri);

	}
	
	
	

	

}